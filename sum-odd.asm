;name= ahmad farooq
;rollno. = 23-ntu-cs-1128

include irvine32.inc

.data
    array sword 3,-6,-1,-10,10,30,40,4
    sum sword 0
    count sword 0
    msg1 db "the sum of odd numbers is: ", 0
    msg2 db "total number of odd numbers is: ", 0

.code
main proc
    call clrscr
    mov eax, 0
    mov esi, offset array            ; offsetting array
    mov ecx, lengthof array          ; loop counter set to length of array

next:
    mov ax, word ptr [esi]
    test ax, 1                        ; check if even (bitwise check for LSB)
    jnz sumjump                       ; jump if odd
    jumpback:                          ; jump if even
    add esi, type array               ; move to next element of the array
    loop next

mov eax, 0
mov ax, sum
mov edx, offset msg1
call writestring
call writeint
call crlf
mov eax, 0
mov ax, count
mov edx, offset msg2
call writestring
call writeint
sumjump:
    add sum, ax                        ; add to sum if odd
    inc count                          ; increment count for odd numbers
jmp jumpback

    exit
main endp
end main
