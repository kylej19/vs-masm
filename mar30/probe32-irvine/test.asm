; test.asm
; author: kyle johnson
; description: template using irvine lib
;----------------------------------------

INCLUDE irvine32.inc

.data                               ;data
;----------------------------------------
msg1 BYTE "Input grade: ",0
array DWORD 52,62,72,82,92,-2

.code                               ;code
;----------------------------------------
main PROC
    mov edx,OFFSET msg1
    call WriteString

    mov eax,0
    call ReadInt
    call CalcGrade
    call WriteChar
    call Crlf
    call Crlf

    mov esi,OFFSET array
    mov edx,TYPE array
    mov ecx,LENGTHOF array
L1:
    mov eax,[esi]
    call CalcGrade
    call WriteChar
    call Crlf
    add esi,edx
    loop L1

    exit
main ENDP

;receives: eax
;returns: eax
CalcGrade PROC
    cmp eax,90
    jge A1
    cmp eax,80
    jge B1
    cmp eax,70
    jge C1
    cmp eax,60
    jge D1

    mov al,46h
    jmp quit
D1:
    mov al,44h
    jmp quit
C1:
    mov al,43h
    jmp quit
B1:
    mov al,42h
    jmp quit
A1:
    mov al,41h
quit:
    ret
CalcGrade ENDP

END main