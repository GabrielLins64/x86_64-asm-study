
section .data
	text db "Hello, World!", 10
	;"text" is a name assigned to the address in memory that this data is located in. Wheneve we use "text" later in the code, when the code is compiled, the compiler will determine the actual location in memory of this data and replace all future instances of "text" with that memory address.
	;"db" stands for "define bytes". It essentially means that we are going to define some raw bytes of data to insert into our code.
	;"Hello, World!", 10 are the bytes of data we are defining. Each character in the string of text is a single byte. The "10" is a newline character, which I often denote as "\n".

section .text
	global _start

_start:
	mov rax, 1
	;1 is the sys_write x84_64 syscall ID/NR. It is moved into the rax register
	mov rdi, 1
	;1 filedescriptor is the standard output. 0 is the std input, and 2 the std error
	mov rsi, text
	;for the sys_write syscall, the string memory address should be loaded into the rsi register
	mov rdx, 14
	;Hello, World!\n string length
	syscall
	;call the kernel for executing the loaded instruction

	mov rax, 60
	;60 - sys_exit syscall ID
	mov rdi, 0
	;int error_code (0 for none)
	syscall
