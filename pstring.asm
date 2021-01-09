

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
  push rax ; push rax on stack
  mov rbx, 0 ; counter of string
 
_printloop: ; function label
  inc rax
  inc rbx
  mov cl, [rax]  ;; rcx register (8-bit low) ; (first unused gp register) ; soley for checking if zero in order to inc rbx
  cmp cl, 0
  jne _printloop

  mov rax, 1                ;  syscall code
  mov rdi, 1                ;  1 = stdout
  pop rsi                   ;  register source index, where the buffer goes. rsi is not being popped. the stack is being popped into rsi. 
  mov rdx, rbx              ;  size of buffer in bytes
  syscall
  ret

