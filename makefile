all: hello

hello.o: hello.asm
	nasm -f elf64 -o hello.o hello.asm

hello:  hello.o
	ld hello.o -o hello
	