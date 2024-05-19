global _main

%include "lib/libmacho.s"

section .text

_main:
	mov rsi, msg
	mov rdx, 34
	mov rdi, 0x01
	call SYSCALL_WRITE

	mov rsi, msg2
	mov rdx, 3
	mov rdi, 0x01
	call SYSCALL_WRITE

	mov rsi, buffer
	mov rdx, 256
	call SYSCALL_INPUT

	mov rsi, buffer
	mov rdx, 256
	mov rdi, 0x01
	call SYSCALL_WRITE

	mov rdi, filename
	mov rsi, O_RDWR
	or rsi, O_CREAT
	or rsi, O_TRUNC
	mov rdx, 0x1A4
	call SYSCALL_FOPEN
	test rax, rax
	je _err

	mov rdi, rax
	mov rsi, buffer
	mov rdx, 256
	call SYSCALL_WRITE

	mov rdi, rax
	call SYSCALL_FCLOSE

	call SYSCALL_EXIT

_err:
	mov rdi, 1
	call SYSCALL_EXIT


section .data

filename db "macho64asm.txt", 0
msg db "Hello, World from Mach-O Assembly!", 0, 0xa
window resq 1 
windowTitle db "Hello, World from Carbon APIs and Mach-O Assembly!", 0
buffer times 256 db 0
msg2 db 0xa, ">", 0

