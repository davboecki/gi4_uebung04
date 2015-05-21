SECTION .data
	i DD 10
	ergebnis DD 1

SECTION .text
	global main

main:
	push ebp
	mov ebp, esp

	mov ecx, [i]
	mov eax, [ergebnis]

	dec ecx
top:
	imul eax, ecx
	loop top

	mov [ergebnis], eax

	; end of program
	mov esp, ebp
	pop ebp

	mov ebx, 0
	mov eax, 1
	int 0x80
