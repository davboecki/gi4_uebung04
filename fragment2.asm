SECTION .data
	a TIMES 10 DD 0

SECTION .text
	global main

main:
	push ebp
	mov ebp, esp

	mov eax, 0

top:

	mov [a + 4*eax], eax

	inc eax
	cmp eax, 10
	jne top

	; end of program
	mov esp, ebp
	pop ebp

	mov ebx, 0
	mov eax, 1
	int 0x80
