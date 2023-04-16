%macro print 1
	mov rax, %1
	mov rbx, 0
%%print_loop:
	mov cl, [rax]
	cmp cl, 0
	je %%end_print_loop
	inc rbx
	inc rax
	jmp %%print_loop
%%end_print_loop:
	mov rax, SYS_WRITE
	mov rdi, STDOUT
	mov rsi, %1
	mov rdx, rbx
	syscall
%endmacro

%macro exit 0
	mov rax, SYS_EXIT
	mov rdi, 0
	syscall
%endmacro

STDIN 	equ 	0
STDOUT 	equ	1
STDERR	equ	2

SYS_READ	equ	0
SYS_WRITE	equ	1
SYS_OPEN	equ	2
SYS_CLOSE	equ	3
SYS_EXIT	equ	60
