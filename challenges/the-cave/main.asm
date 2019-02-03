section .data
	prompt:       db 'password: '
	prompt_len:   equ $-prompt

	secret:       db 'secret',
	secret_len:   equ $-secret

	success:      db 'You did it',0xa
	success_len:  equ $-success

	failure:      db 'Access denied',0xa
	failure_len:  equ $-failure

section .bss
	password:     resb 256
	password_len: equ $-password

section .text
	global _start 

_start:
	; Prompt
	mov eax,4            ; 'write' system call = 4
	mov ebx,1            ; file descriptor 1 = STDOUT
	mov ecx,prompt       ; string to write
	mov edx,prompt_len   ; length of string to write
	int 80h              ; call the kernel

	; Read
	mov eax,3            ; 'read' system call = 3
	mov ebx,0            ; file descriptor 0 = STDIN
	mov ecx,password     ; save to buffer   
	mov edx,password_len ; with length
	int 80h              ; call the kernel

	; Magic
	mov esi,password     ; point to password
	mov edi,secret       ; point to secret
	mov ecx,secret_len   ; the length is the secret length
	cld                  ; clear direction flag
	repe cmpsb           ; compare byes
	jecxz on_success     ; call success
	call on_failure      ; call failure

	; Terminate
	mov eax,1            ; 'exit' system call
	mov ebx,0            ; exit with error code 0
	int 80h              ; call the kernel

on_success:
	; Message
	mov eax,4            ; 'write' system call = 4
	mov ebx,1            ; file descriptor 1 = STDOUT
	mov ecx,success      ; string to write
	mov edx,success_len  ; length of string to write
	int 80h              ; call the kernel

	; Terminate
	mov eax,1            ; 'exit' system call
	mov ebx,0            ; exit with error code 0
	int 80h              ; call the kernel

on_failure:
	; Message
	mov eax,4            ; 'write' system call = 4
	mov ebx,1            ; file descriptor 1 = STDOUT
	mov ecx,failure      ; string to write
	mov edx,failure_len  ; length of string to write
	int 80h              ; call the kernel

	; Terminate
	mov eax,1            ; 'exit' system call
	mov ebx,1            ; exit with error code 1
	int 80h              ; call the kernel
