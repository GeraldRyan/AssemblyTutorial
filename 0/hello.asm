  ; Semicolons represent comments. 
  ; Code to compile nasm -f elf64 -o hello.o hello.asm
  ; Code to link: ld hello.o -o hello
  ; and to run is just ./hello

  ; we're using sys_write system call below. 


section .data ; static compile time data. 
  text db "Hello, World!", 10  ; 10 represents a new line. "text" is a reference (memory address). Can be called jim. 


section .text
  global _start

_start:
  mov rax, 1
  mov rdi, 1 
  mov rsi, text  
  mov rdx, 14  
  syscall 

  mov rax, 60 ; sysexit system call has id of 60
  mov rdi, 0 ; error code : 0 = no error
  syscall