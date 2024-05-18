global _main

; Mach-O variables
O_RDONLY equ 0x0000
O_WRONLY equ 0x0001
O_RDWR equ 0x0002
O_CREAT equ 0x0200
O_EXCL equ 0x0800
O_NOCTTY equ 0x2000
O_TRUNC equ 0x0400
O_APPEND equ 0x0008
O_NONBLOCK equ 0x0004
O_DSYNC equ 0x4000
O_SYNC equ 0x0080
O_RSYNC equ 0x0010
O_DIRECTORY equ 0x100000
O_NOFOLLOW equ 0x0100
O_CLOEXEC equ 0x1000000

; Mach-O syscalls



SYSCALL_WRITE:
	mov rax, 0x2000004
	syscall
	ret

SYSCALL_FOPEN:
	mov rax, 0x2000005
	syscall
	ret

SYSCALL_INPUT:
	mov rax, 0x2000003
	mov rdi, 0x00
	syscall
	ret

SYSCALL_FCLOSE:
	mov rax, 0x2000006
	syscall
	ret

SYSCALL_EXIT:
	mov rax, 0x2000001
	syscall
	ret



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
buffer times 256 db 0
msg2 db 0xa, ">", 0

