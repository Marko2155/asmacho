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

global SYSCALL_WRITE
global SYSCALL_FOPEN
global SYSCALL_INPUT
global SYSCALL_FCLOSE
global SYSCALL_EXIT
global O_RDONLY
global O_WRONLY
global O_RDWR
global O_CREAT
global O_TRUNC
global O_EXCL
global O_NOCTTY
global O_APPEND
global O_NOFOLLOW
global O_NONBLOCK
global O_DIRECTORY
global O_CLOEXEC
global O_RSYNC
global O_SYNC
global O_DSYNC
