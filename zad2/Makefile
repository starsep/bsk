CFLAGS=-Wall -Wextra -Wshadow -O2 -pedantic
COMPILER=gcc
LIBRARIES=-lpam -lpam_misc
OFILES=text.o

all: program

program: program.c $(OFILES)
	$(COMPILER) -o $@ $^ $(CFLAGS) $(LIBRARIES)

%.o: %.c %.h
	$(COMPILER) -c $< $(CFLAGS)

clean:
	rm -f program *.o

pack: clean fc359081.tar.gz

fc359081.tar.gz: program.c text.c text.h
	tar -czvf $@ $^
