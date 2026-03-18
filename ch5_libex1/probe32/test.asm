; test.asm : Library Test #1: Integer I/O
; author: Kip Irvine
; description: test program for working with x86 assembly
;----------------------------------------
; INCLUDE: "B:\lib\Irvine"

INCLUDE irvine32.inc

;----------------------------------------
.data

COUNT = 4
BlueTextOnGray = blue + (lightGray * 16)
DefaultColor = lightGray + (black * 16)
arrayD SDWORD 12345678h,1a4b2000h,3434h,7ab9h
prompt BYTE "Enter a 32-bit signed integer: ",0

;----------------------------------------
.code
main PROC

    ; select blue text on a light gray background
    mov eax,BlueTextOnGray
    call SetTextColor
    call Clrscr

    ; display an array using DumpMem
    mov esi,OFFSET arrayD
    mov ebx,TYPE arrayD
    mov ecx,LENGTHOF arrayD
    call DumpMem

    ;ask the user to input a series of signed integers
    call Crlf
    mov ecx,COUNT
L1:
    mov edx,OFFSET prompt
    call WriteString
    call ReadInt
    call Crlf

    ; display the integer in decimal, hex, and binary
    call WriteInt
    call Crlf
    call WriteHex
    call Crlf
    call WriteBin
    call Crlf
    call Crlf
    loop L1
    
    ; return the window to default colors

    call WaitMsg                ; press any key...
    mov eax,DefaultColor
    call SetTextColor
    call Clrscr

    exit
main ENDP
END main