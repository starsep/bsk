CFLAGS=-Wall -Wextra -Wshadow -O2 -pedantic
COMPILER=gcc
LIBRARIES=-lpam -lpam_misc
OFILES=parser.o pam.o

all: program

program: program.c $(OFILES)
	$(COMPILER) -o $@ $^ $(CFLAGS) $(LIBRARIES)

%.o: %.c %.h
	$(COMPILER) -c $< $(CFLAGS)

clean:
	rm -f program *.o fc359081.tar.gz

pack: clean fc359081.tar.gz

fc359081.tar.gz:
	tar -czvf fc359081.tar.gz *
