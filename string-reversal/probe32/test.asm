; test.asm
; author: kyle johnson
; description: test template for working with x86 assembly
;----------------------------------------
; INCLUDE: "B:\lib\Irvine"

include irvine32.inc

.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
;----------------------------------------
.data
source BYTE "ABCDEFGHIJ",0

;----------------------------------------
.code
main PROC
    ; push the string to the stack
    mov ecx,LENGTHOF source - 1
    mov esi,OFFSET source

L1: movzx eax,BYTE PTR [esi]
    push eax
    inc esi
    loop L1

    ; reset esi to the beginning of the string 
    ; and pop the characters off the stack
    mov ecx,LENGTHOF source - 1
    mov esi,OFFSET source

L2: pop eax
    mov [esi],al
    inc esi
    loop L2

    INVOKE ExitProcess,0
main ENDP
END main