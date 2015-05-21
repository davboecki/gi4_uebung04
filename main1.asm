SECTION .data
	n DD 5
	ergebnis DD 1

SECTION .text
	global main

main:
	push ebp
	mov ebp, esp

	mov eax, 1
	mov ecx, dword [n]

	cmp ecx, 0
	je bottom

head:
	imul eax, ecx
	loop head ; ecx-- if(ecx != 0) goto head

bottom:

	mov dword [ergebnis], eax
	; end of program
	mov esp, ebp
	pop ebp

	mov ebx, 0
	mov eax, 1
	int 0x80
