#include "parser.h"
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

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


static void initWordsContainer(WordsContainer *wordsContainer) {
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
	printf("%s\n", wordsContainer->word[bestIndex].w);
	wordsContainer->word[bestIndex].count = 0;
}

static void printBestWords(WordsContainer *wordsContainer) {
	for (int i = 0; i < BEST_WORDS_NUM; i++) {
		printBestWord(wordsContainer);
	}
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

static void initLine(Line *line) {
	line->l[0] = '\0';
}

static void swapBuffers(Buffer **b1, Buffer **b2) {
	Line *tmp = *b1;
	*b1 = *b2;
	*b2 = tmp;
}

void parse(void) {
	WordsContainer wordsContainer;
	Line buffer[2], firstLine;
	Buffer *currentBuffer, *previousBuffer;
	initLine(&buffer[0]);
	initLine(&buffer[1]);
	initLine(&firstLine);
	currentBuffer = &buffer[0];
	previousBuffer = &buffer[1];
	bool end = 0;
	initWordsContainer(&wordsContainer);
	while (!end) {
		int bytesRead = read(STDIN, currentBuffer->l, MAX_LINE_SIZE);
		/*if (bytesRead == 0) { // eof
			break;
		}*/
		swapBuffers(&currentBuffer, &previousBuffer);
	}
	printBestWords(&wordsContainer);
}
