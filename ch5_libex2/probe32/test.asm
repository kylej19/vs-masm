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
    

    INVOKE ExitProcess,0
main ENDP
END main