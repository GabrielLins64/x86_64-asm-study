section .data
	text db "Hello World", 0x0A, 0
	text2 db "World?", 0x0A, 0

section .text
	global _start

_start:
	mov rax, text ;rax has the text start memory address (for 'H')
	call _print

	mov rax, text2
	call _print

	mov rax, 60
	mov rdi, 0
	syscall

;input: rax
;output: print string at rax
_print:
	push rax ;the address of the start of text is pushed to the stack
	mov rbx, 0
_print_loop:
	inc rax ;go tho the address of the next char 'e'
	inc rbx ;increment the counter
	mov cl, [rax] ;cl: 8-bit equivalent of rcx
	cmp cl, 0 ;if [rax] (rax value, not address) it's the end...
	jne _print_loop ;else, to to the label

	mov rax, 1 ;write syscall ID
	mov rdi, 1 ;stdout ID
	pop rsi ;take the address of the start of text from the stack into rsi
	mov rdx, rbx ;put the counter value into rdx
	syscall

	ret

