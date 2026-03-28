; test.asm
; author: kyle johnson
; description: test template for working with x86 assembly
;----------------------------------------

INCLUDE irvine32.inc

;----------------------------------------
.data
varD1 DWORD 12345678h
varD2 DWORD 0Ah
evenStr BYTE "Even parity",0dh,0ah,0
oddStr BYTE "Odd parity",0dh,0ah,0

;----------------------------------------
.code
main PROC
    mov eax,0
    mov esi,OFFSET varD1
    mov al,BYTE PTR [esi]
    xor al,BYTE PTR [esi + 1]
    xor al,BYTE PTR [esi + 2]
    xor al,BYTE PTR [esi + 3]
    mov edx,OFFSET evenStr
    jp Q1
    mov edx,OFFSET oddStr
Q1:
    call WriteHex
    call Crlf
    call WriteString

    mov eax,0
    mov esi,OFFSET varD2
    mov al,BYTE PTR [esi]
    xor al,BYTE PTR [esi + 1]
    xor al,BYTE PTR [esi + 2]
    xor al,BYTE PTR [esi + 3]
    mov edx,OFFSET evenStr
    jp Q2
    mov edx,OFFSET oddStr
Q2:
    call WriteHex
    call Crlf
    call WriteString

    exit
main ENDP
;----------------------------------------
END main