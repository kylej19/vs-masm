; Link Library Test #3 (test.asm)
; author: Kip Irvine
; description: calculate the elapsed time of a nested loop
;----------------------------------------
; INCLUDE: "B:\lib\Irvine"

INCLUDE irvine32.inc

;----------------------------------------
.data

OUTER_LOOP_COUNT = 3
startTime DWORD ?
msg1 BYTE "Please wait...",0dh,0ah,0
msg2 BYTE "Elapsed milliseconds: ",0

;----------------------------------------
.code
main PROC
    mov edx,OFFSET msg1
    call WriteString            ; "Please wait..."

; save the starting time
    call GetMSeconds
    mov startTime,eax

; start the outer loop
    mov ecx,OUTER_LOOP_COUNT
L1:
    call innerLoop
    loop L1

; calculate the elapsed time
    call GetMSeconds
    sub eax,startTime

; display the elapsed time
    mov edx,OFFSET msg2
    call WriteString
    call WriteDec
    call Crlf

    exit
main ENDP

innerLoop PROC
    push ecx                    ; save current ecx value

    mov ecx,0ffffffffh          ; set the loop counter 
L1:
    mul eax                     ; use up some cycles
    mul eax
    mul eax
    loop L1                     ; repeat the inner loop

    pop ecx                     ; restore ecx's saved value
    ret
innerLoop ENDP

END main