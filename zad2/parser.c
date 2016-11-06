#include "parser.h"
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

#define MAX_WORD_SIZE 100
#define MAX_LINE_SIZE 1000
#define MAX_WORDS 1000
#define BEST_WORDS_NUM 5
#define INVALID -1
#define STDIN 0

typedef struct {
	char w[MAX_WORD_SIZE + 1];
	int count;
} Word;

typedef struct {
	char l[MAX_LINE_SIZE + 1];
} Line;

typedef Line Buffer;

typedef struct {
	int count;
	Word word[MAX_WORDS];
} WordsContainer;


static void cleanWordsContainer(WordsContainer *wordsContainer) {
	wordsContainer->count = 0;
}

static void copyWord(const Word *src, Word *dst) {
	dst->count = 1;
	strcpy(dst->w, src->w);
}

static bool addWordToContainer(const Word *word, WordsContainer *wordsContainer) {
	if (wordsContainer->count >= MAX_WORDS) {
		return false;
	}
	copyWord(word, &wordsContainer->word[wordsContainer->count]);
	wordsContainer->count++;
	return true;
}

static void printBestWord(WordsContainer *wordsContainer) {
	int bestCount = 0;
	int bestIndex = INVALID;
	for (int i = 0; i < wordsContainer->count; i++) {
		if (wordsContainer->word[i].count > bestCount) {
			bestCount = wordsContainer->word[i].count;
			bestIndex = i;
		}
	}
	if (bestIndex == INVALID) {
		return;
	}
	printf("%s ", wordsContainer->word[bestIndex].w);
	wordsContainer->word[bestIndex].count = 0;
}

static void printBestWords(WordsContainer *wordsContainer) {
	for (int i = 0; i < BEST_WORDS_NUM; i++) {
		printBestWord(wordsContainer);
	}
	puts("");
}

static void printResult(WordsContainer *wordsContainer, Line *firstLine) {
	printf("%s\n", firstLine->l);
	printBestWords(wordsContainer);
}

static bool equalWords(const Word *first, const Word *second) {
	return strcmp(first->w, second->w) == 0;
}

static bool updateWord(const Word *word, WordsContainer *wordsContainer) {
	for (int i = 0; i < wordsContainer->count; i++) {
		if (equalWords(word, &wordsContainer->word[i])) {
			wordsContainer->word[i].count++;
			return true;
		}
	}
	return addWordToContainer(word, wordsContainer);
}

static void cleanLine(Line *line) {
	line->l[0] = '\0';
}

static void swapBuffers(Buffer **b1, Buffer **b2) {
	Buffer *tmp = *b1;
	*b1 = *b2;
	*b2 = tmp;
}

static void wordFromCString(const char *src, Word *dst) {
	int len = strlen(src);
	if (len > MAX_WORD_SIZE) {
		fprintf(stderr, "Word was too long. Max word size is %d. Exiting.\n",
			MAX_WORD_SIZE);
		exit(1);
	}
	strcpy(dst->w, src);
}

static bool lineEmpty(const Line *line) {
	return line->l[0] == '\0';
}

static void moveBufferLeft(Buffer *buffer, int count) {
	int len = strlen(buffer->l);
	for (int i = count; i <= len; i++) {
		buffer->l[i - count] = buffer->l[i];
	}
}

static bool takeFirstLine(Buffer *buffer, Line *line) {
	int len = strlen(buffer->l);
	for (int i = 0; i < len; i++) {
		line->l[i] = buffer->l[i];
		if (buffer->l[i] == '\n') {
			line->l[i] = '\0';
			moveBufferLeft(buffer, i + 1);
			return true;
		}
	}
	if (len >= MAX_LINE_SIZE) {
		fprintf(stderr, "Line was too long. Maximum line size is %d. Exiting.\n",
			MAX_LINE_SIZE);
		exit(1);
	}
	cleanLine(line);
	return false;
}

static void mergeFittingBuffers(Buffer *first, Buffer *second) {
	int len1 = strlen(first->l);
	int len2 = strlen(second->l);
	for (int i = 0; i <= len2; i++) {
		first->l[len1 + i] = second->l[i];
	}
	cleanLine(second);
}

static void mergeBuffers(Buffer *first, Buffer *second, Line *line) {
	cleanLine(line);
	int len1 = strlen(first->l);
	int len2 = strlen(second->l);
	if (len1 + len2 <= MAX_LINE_SIZE) {
		mergeFittingBuffers(first, second);
	} else {
		for (int i = 0; len1 + i < MAX_LINE_SIZE; i++) {
			first->l[len1 + i] = second->l[i];
		}
		first->l[MAX_LINE_SIZE] = '\0';
		int moved = MAX_LINE_SIZE - len1;

		moveBufferLeft(second, moved);

		mergeFittingBuffers(first, second);
	}
}

static bool wordDelim(char c) {
	return c == '\0' || c == '\t' || c == ' ' || c == '\n' || c == '.';
}

static bool processLine(Line *currentLine, WordsContainer *wordsContainer) {
	bool end = false;
	Word word;
	int len = strlen(currentLine->l);
	int begin = 0;
	for (int i = 0; i < len; i++) {
			if (wordDelim(currentLine->l[i])) {
				begin = i + 1;
				continue;
			}
			if (wordDelim(currentLine->l[i + 1])) {
				char c = currentLine->l[i + 1];
				currentLine->l[i + 1] = '\0';
				wordFromCString(&currentLine->l[begin], &word);
				updateWord(&word, wordsContainer);
				if (c == '.') {
					end = true;
				}
			}
	}
	return end;
}

static bool subtaskEndLine(const Line *line) {
	return line->l[0] == '=' && line->l[1] == '=' && line->l[2] == '\0';
}

void parse(void) {
	WordsContainer wordsContainer;
	Buffer buffers[2];
	Buffer *currentBuffer, *previousBuffer;
	Line firstLine, currentLine;
	cleanLine(&buffers[0]);
	cleanLine(&buffers[1]);
	cleanLine(&firstLine);
	cleanLine(&currentLine);
	currentBuffer = &buffers[0];
	previousBuffer = &buffers[1];
	cleanWordsContainer(&wordsContainer);
	for (bool end = false; !end; swapBuffers(&currentBuffer, &previousBuffer)) {
		int bytesRead = read(STDIN, currentBuffer->l, MAX_LINE_SIZE);
		if (bytesRead < 0) {
			fprintf(stderr, "Unexpected error occurred. Exiting.\n");
			exit(1);
		}
		currentBuffer->l[bytesRead] = '\0';
		if (bytesRead == 0 && !lineEmpty(previousBuffer)) {
			currentLine.l[0] = '\n';
			currentLine.l[1] = '\0';
		}
		if (!lineEmpty(previousBuffer)) {
			mergeBuffers(previousBuffer, currentBuffer, &currentLine);
			swapBuffers(&currentBuffer, &previousBuffer);
		}

		if (lineEmpty(&currentLine)) {
			if (!takeFirstLine(currentBuffer, &currentLine)) {
				continue;
			}
		}

		do {
			if (lineEmpty(&firstLine)) {
				strcpy(firstLine.l, currentLine.l);
			}
			if (subtaskEndLine(&currentLine)) {
				printResult(&wordsContainer, &firstLine);
				cleanWordsContainer(&wordsContainer);
				cleanLine(&firstLine);
				if (!takeFirstLine(currentBuffer, &currentLine)) {
					break;
				}
				continue;
			}
			if (processLine(&currentLine, &wordsContainer)) {
				end = true;
			}
			if (!takeFirstLine(currentBuffer, &currentLine)) {
				break;
			}
		} while(true);

		if (bytesRead == 0) { // eof
			end = true;
		}
	}
}
