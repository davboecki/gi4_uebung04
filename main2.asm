SECTION .data
	n DD 46
	last_HIGH DD 0
	last_LOW DD 0
	tmp_HIGH DD 0
	tmp_LOW DD 0
	ergebnis DQ 0

SECTION .text
	global main

main:
	push ebp
	mov ebp, esp

	mov ecx, dword [n]
	mov eax, 0
	mov ebx, 1

	cmp ecx, 0
	je overflow
	dec ecx
	cmp ecx, 0
	je bottom

head:
	mov dword [tmp_HIGH], eax
	mov dword [tmp_LOW], ebx

	add ebx, dword [last_LOW]
	adc eax, dword [last_HIGH]
	jc overflow

	mov edx, dword [tmp_HIGH]
	mov dword [last_HIGH], edx

	mov edx, dword [tmp_LOW]
	mov dword [last_LOW], edx

	loop head ; ecx-- if(ecx != 0) goto head

bottom:

	mov dword [ergebnis], ebx
	mov dword [ergebnis + 4], eax
	; end of program
	mov esp, ebp
	pop ebp
overflow:
	mov ebx, 0
	mov eax, 1
	int 0x80


