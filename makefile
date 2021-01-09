all: hello get_ui

hello.o: hello.asm
	nasm -f elf64 -o hello.o hello.asm

get_ui.o: get_ui.asm
	nasm -f elf64 -o get_ui.o get_ui.asm

hello:  hello.o
	ld hello.o -o hello

get_ui: get_ui.o
	ld get_ui.o -o get_ui