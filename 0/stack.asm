
section .data
  digit db 0, 10 ; we will only load the least significant byte forthcoming, so it will only affect the 0 val. 10 will endure. 


section .text
  global _start

_start:
  push 4
  push 8
  push 3

  pop rax
  call _printRAXDigit
  pop rax
  call _printRAXDigit
  pop rax
  call _printRAXDigit

_printRAXDigit:
  add rax, 48 ; 48 is where numbers begin in ascii
  mov [digit], al ;; al is lower (8 bit) part of RAX reg. [] dereferences/overwrites. Basically scraping bottom byte of rax
  mov rax, 1 ;;
  mov rdi, 1
  mov rsi, digit 
  mov rdx, 2
  syscall
  ret ;;

_printString