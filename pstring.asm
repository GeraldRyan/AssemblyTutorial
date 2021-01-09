

section .data ; static compile time data. 
  text db "Hello, World!", 10, 0
  text2 db "World!!", 10, 0


section .text
  global _start

_start:
  mov rax, text
  call _printstring

  mov rax, text2
  call _printstring

  mov rax, 60 ; sysexit system call has id of 60
  mov rdi, 0 ; error code : 0 = no error
  syscall

; input : rax
; output : print string at rax

_printstring:
  push rax ; push rax on stack (putting it in order and freeing its capacity for use below)
  mov rbx, 0 ; counter of string
 
_printloop:
  inc rax
  inc rbx
  mov cl, [rax]  ;; rcx register (8-bit low) ; (first unused gp register) ; does nasm know only move one byte?   
  cmp cl, 0
  jne _printloop

  mov rax, 1
  mov rdi, 1
  pop rsi ; register source index 
  mov rdx, rbx ; do not confuse rdx with rdi (both 64 bit registers) 
  syscall
  ret

