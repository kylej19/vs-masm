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
array BYTE "hello",0

;----------------------------------------
.code
main PROC
    call proc1
    mov ecx,LENGTHOF array
    mov esi,OFFSET array
    mov eax,0
L1:
    add al,[esi]
    add esi,TYPE array
    loop L1

    INVOKE ExitProcess,0
main ENDP

proc1 PROC
    pop eax
    sub eax,3
    call WriteHex
    push eax
    ret
proc1 ENDP

END main