
all: bison flex gcc
	@echo "Done."

bison: parser.y
	bison parser.y

flex: scanner.l
	flex scanner.l

gcc: scanner.c parser.c tree.c
	gcc -Wall -o parser scanner.c parser.c tables.o tree.c -ly

clean:
	@rm -f *.o *.output scanner.c parser.h parser.c parser *.dot *.pdf
