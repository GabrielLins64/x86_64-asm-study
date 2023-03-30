section .data
	text db "Hello World", 0x0A

section .text
	global _start

_start:
	call _print_hello
	mov rax, 60
	mov rdi, 0
	syscall

_print_hello:
	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 12
	syscall
	ret
