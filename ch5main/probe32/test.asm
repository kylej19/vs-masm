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
rows BYTE ?
cols BYTE ?
prompt1 BYTE "Enter in an integer: ",0
prompt2 BYTE "Enter another integer: ",0
intVal1 DWORD ?
sum DWORD ?

;----------------------------------------
.code
main PROC
    call GetMaxXY           ; get the size of the console window
    mov rows,al             ; save the rows into a variable
    mov cols,dl             ; save the cols into a variable
    sub rows,0fh            ; subtract 15 (half the value)
    sub cols,3ch            ; subtract 60 (half the value)
    mov dh,rows             ; set the cursor's y position
    mov dl,cols             ; set the cursor's x position
    call Clrscr             ; clear the screen
    call GotoXY             ; go to the center

    mov edx,OFFSET prompt1  ; load the string into edx
    call WriteString        ; prompt the user for input
    call ReadInt            ; read the integer value input
    mov intVal1,eax         ; save the input into a variable
    mov dh,rows             ; reset the cursor's y position
    mov dl,cols             ; reset the cursor's x position
    call Clrscr             ; clear the screen
    call GotoXY             ; go to the center

    mov edx,OFFSET prompt2  ; load the string into edx
    call WriteString        ; prompt the user for another integer

    call ReadInt            ; read the integer value input
    add eax,intVal1         ; add the first value to the second value
    mov sum,eax             ; save the sum in a variable
    mov dh,rows             ; reset the cursor's y position
    mov dl,cols             ; reset the cursor's x position
    call Clrscr             ; clear the screen
    call GotoXY             ; move the cursor to the center
    call WriteInt           ; output the sum
    
    INVOKE ExitProcess,0
main ENDP
END main