SECTION .data
	a DD 0
	b DD 7

SECTION .text
	global main

main:
	push ebp
	mov ebp, esp

	cmp [a], 0
	je if
//else
	mov [b], 0
	jmp endif
if:
	mov [b], 1
endif:
	inc [a]

	; end of program
	mov esp, ebp
	pop ebp

	mov ebx, 0
	mov eax, 1
	int 0x80
