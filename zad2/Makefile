CFLAGS=-Wall -Wextra -Wshadow -O2 -pedantic -lpam
LIBRARIES=-lpam -lpam_misc

all: program

program: program.c
	gcc -o program program.c $(CFLAGS) $(LIBRARIES)
