%include "print.asm"

section .bss
	digit_space 	resb	100	;will store the actual string (backwards)
	digit_space_pos	resb	8	;store the current string position

section .text
	global _start

_start:
	mov rax, 1234564321012
	call _print_rax
	exit

_print_rax:
	mov rcx, digit_space		;rcx holds the addr of the char stream
	mov rbx, 0x0A			;newline character
	mov [rcx], rbx			;add \n as the value of the last digit address
	inc rcx				;rcx points to the next addr in char stream
	mov [digit_space_pos], rcx	;position now points to next ds

_print_rax_loop:
	mov rdx, 0 			;so the division won't be messed up
	mov rbx, 10
	div rbx				;123 / 10 = 12 and the remainder (3) goes to rdx
	push rax
	add rdx, 48			;48 = '0' in ascii. 48 + 3 = '3' in ascii

	mov rcx, [digit_space_pos]
	mov [rcx], dl			;load 51 into digit_space_pos value
	inc rcx
	mov [digit_space_pos], rcx	;position is now at the next char

	pop rax
	cmp rax, 0
	jne _print_rax_loop

_print_rax_loop_2:
	mov rcx, [digit_space_pos]
	mov rax, 1
	mov rdi, 1
	mov rsi, rcx
	mov rdx, 1
	syscall

	;decrement char position, once we stored 123 backwards (321)
	mov rcx, [digit_space_pos]
	dec rcx
	mov [digit_space_pos], rcx
	
	cmp rcx, digit_space
	jge _print_rax_loop_2

	ret

