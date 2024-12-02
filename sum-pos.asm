;Name= Ahmad Farooq
;Rollno. = 23-NTU-CS-1128

include irvine32.inc

.data
    array SWORD 3,-6,-1,-10,10,30,40,4
    sum SWORD 0
    count SWORD 0
    msg1 db "the summ of positive numbers is :",0
    msg2 db "total number of positive no is :",0

.code
main proc
call clrscr
    mov eax,0
    mov esi,OFFSET array             ; offsetting array
    mov ecx,lengthof array           ; loop counter set to length of array

next:
    mov ax, WORD PTR [esi]          
    test ax, 8000h                   ; Check sign bit
    jz sumjump
    jumpback:                        ; jump if positive
    add esi, TYPE array              ; move to next element of the array
    loop next   

mov eax,0
mov ax,sum
mov edx,OFFSET msg1
call writestring
call WriteInt
call crlf
mov eax,0
mov ax,count
mov edx,OFFSET msg2
call writestring
call Writedec
sumjump:
    add sum, ax                      ; add to sum if positive
    inc count                        ; increment count to check number of positive numbers
jmp jumpback

    exit
main endp
end main
