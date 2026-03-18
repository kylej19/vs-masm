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

;----------------------------------------
.code
main PROC
    mov eax, 0ffffffffh
    mov ebx, 0aaaaaaaah
    call DumpRegs       ;display the original values in the registers

    push eax            ; push eax on the stack
    push ebx            ; then ebx
    pop eax             ; pop the top value
    pop ebx             ; pop the lower value

    call DumpRegs       ;display the swapped registers

    INVOKE ExitProcess,0
main ENDP
END main