; test.asm
; author: kyle johnson
; description: test template for working with x86 assembly
;----------------------------------------

include irvine32.inc

;.386
;.model flat,stdcall
;.stack 4096

ExitProcess proto, ExitCode:dword
processGrades proto, arrG:ptr dword, sizeG:ptr dword
;----------------------------------------
.data
grades byte 89,78,49,50,56

;----------------------------------------
.code
main proc
    invoke processGrades,offset grades,lengthof grades

    invoke ExitProcess,0
main endp

; header - parameter list
processGrades proc,
    arrG:ptr dword,
    sizeG:ptr dword


    ret 8
processGrades endp 

end main