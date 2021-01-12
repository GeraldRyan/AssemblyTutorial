;alive.asm
section .data
	msg1 db "Hello, World!", 0 ; string with newline and pure 0
	msg1Len equ $-msg1-1 ; measure length minus the 0
	msg2 db "Alive and Kicking!", 10, 0;
	msg2Len equ $-msg2-1 ; ditto
	radius dd 357 ; no string, displayable?
	pi dq 3.14;
	fmtstr db "%s", 10,0 ; format for printing a string
	fmtflt db "%lf", 10, 0; format for printing a float
	fmtint db "%d", 10, 0 ; format for an integer
section .bss 
section .text
extern printf
	global main
main:
	push rbp ; function prologue
	mov rbp, rsp ; function prologue
	; print msg 1 new way	
	mov rax, 0 ; no floating point
	mov rdi, fmtstr
	mov rsi, msg1 ; string to display
	call printf
; print msg 2 old way
	mov rax, 1
	mov rdi, 1
	mov rsi, msg2
	mov rdx, msg2Len
	syscall
	; print radius
	mov rax, 0 ; no floating point
	mov rdi, fmtint
	mov rsi, [radius]
	call printf
	;print pi
	mov rax, 1 ; 1 xmm register used
	movq xmm0, [pi]
	mov rdi, fmtflt
	call printf
	mov rsp, rbp ; function epilogue
	pop rbp ; function epilogue
ret



