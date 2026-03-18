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
val1 DWORD 5
val2 DWORD 6


;----------------------------------------
.code
main PROC
    mov eax,val1
    mov ebx,val2
    call DumpRegs   ; library procedure

    push ebx
    push eax

    pop ebx
    pop eax
    call DumpRegs
    call sample

    INVOKE ExitProcess,0
main ENDP

sample PROC
    mov eax,$
    push eax
    
    ret
sample ENDP

END main