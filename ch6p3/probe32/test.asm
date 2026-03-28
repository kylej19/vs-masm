; test.asm
; author: kyle johnson
; description: test template for working with x86 assembly
;----------------------------------------

INCLUDE irvine32.inc

;----------------------------------------
.data
message1 BYTE "BX is less than or equal to CX",0
message2 BYTE "BX is NOT less than or equal CX",0
var1 WORD 3
var2 WORD 5
;----------------------------------------
.code
main PROC
    mov eax,0
    mov bx,var1
    mov cx,var2
    cmp bx,cx
    jle L1
    jmp L2
L1:
    mov ax,bx
    call WriteHex
    call Crlf
    mov ax,cx
    call WriteHex
    call Crlf
    mov edx,OFFSET message1
    call WriteString
    jmp L3
L2:
    mov edx,OFFSET message2
    call WriteString
    call Crlf
L3:

    exit
main ENDP
;----------------------------------------
END main