; test.asm
; author: kyle johnson
; description: test template for working with x86 assembly
;----------------------------------------
; INCLUDE: "B:\lib\Irvine"

include irvine32.inc


;----------------------------------------
.data

;----------------------------------------
.code
main PROC
    mov eax,0
    mov ebx,0
    mov ecx,0
    mov edx,0

    mov al,00001111b
    xor al,0Fh
    call DumpRegs
    jz nextL
    je nextL

nextL:

    exit

main ENDP

END main