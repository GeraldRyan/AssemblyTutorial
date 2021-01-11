;hello.asm
section .data
  msg db "Hello, World",0

section .bss
section .text
  global main

main:
  mov rax, 1; 1 = write
  mov rdi, 1 ; 1 = stdout
  mov rsi, msg ; string to display in rsi
  mov rdx, 12 ; length of string w/o 0
  syscall ; display string
  mov rax, 60 ; 60 = exit
  mov rdi, 0 ; 0 = success code
  syscall ; quit