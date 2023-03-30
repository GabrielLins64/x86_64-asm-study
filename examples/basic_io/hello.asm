section .data
	text1 db "What is your name?"
	text2 db "Hello, "
	new_line db 0x0A

section .bss
	name resb 16
	;resb stands for reserve bytes
	;we are reserving 16 bytes

section .text
	global _start

_start:
	call _print_ask_name
	call _get_name
	call _print_greetings
	call _print_name
	call _print_newline

	mov rax, 60
	mov rdi, 0
	syscall

_print_ask_name:
	mov rax, 1
	mov rdi, 1
	mov rsi, text1
	mov rdx, 18
	syscall
	call _print_newline
	ret

_print_greetings:
	mov rax, 1
	mov rdi, 1
	mov rsi, text2
	mov rdx, 7
	syscall
	ret

_print_name:
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, 16
	syscall
	ret

_get_name:
	mov rax, 0
	mov rdi, 0
	mov rsi, name
	mov rdx, 16
	syscall
	ret

_print_newline:
	mov rax, 1
	mov rdi, 1
	mov rsi, new_line
	mov rdx, 1
	syscall
	ret

