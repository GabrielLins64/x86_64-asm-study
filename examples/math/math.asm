section .data
	digit db 0,10
	;digit is defined with two bytes (0 and 10 - this one is a \n)

section .text
	global _start

_start:
	mov rax, 6
	mov rbx, 2
	div rbx ;rax = rax / rbx
	call _print_rax_digit
	mov rax, 60
	mov rdi, 0
	syscall

_print_rax_digit:
	add rax, 48 ;48 is the ASCII code for '0', 49 is for '1', ...
	mov [digit], al
	;move the lower byte of rax to the memory address of digit
	;al is the 8-bit register of the lower part of rax
	;see the ../../imgs/registers_sizes.png for registers reference
	mov rax, 1
	mov rdi, 1
	mov rsi, digit
	mov rdx, 2
	syscall
	ret

