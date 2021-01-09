  ; Semicolons represent comments. 
  ; Code to compile nasm -f elf64 -o hello.o hello.asm
  ; Code to link: ld hello.o -o hello
  ; and to run is just ./hello


section .data
  text db "Hello, World!", 10  ; 10 represents a new line


section .text
  global _start

_start:
  mov rax, 1
  mov rdi, 1
  mov rsi, text
  mov rdx, 14 ; number of bytes written to standard output. 
  syscall

  mov rax, 60
  mov rdi, 0 
  syscall