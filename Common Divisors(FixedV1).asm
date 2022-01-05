.model small
indisplay macro a
    mov ah, 09h
    int 21h
endm

.stack 100h


.data
zero_match db "No common divisors.$"
user_in1 db "Enter the first number: $"
user_in2 db "Enter the second number: $"
div1 dw 12 dup(?)

.code

main proc
    mov ax, @data
    mov ds, ax
    
    
    lea dx, user_in1
    indisplay dx
    call valInsert
    call arrVal
    call nextln
    lea dx, user_in2
    indisplay dx
    call valInsert
    call commonDivs
    call nextln
    
    
    
    mov ax, 4c00h
    int 21h   
main endp 


commonFinder proc
    mov si, offset div1
    
   checker:     
    mov dx, [si]
    mov ch, dl
    cmp ch, 1
    je done
    cmp cl, ch
    je common 
    
    inc si
    cmp dl, 1
    jne checker
    
    lea dx, zero_match
    mov ah, 09h
    int 21h
    jmp done
    
   print:
    call nextLn
    cmp bx, 09h
    jg common
    mov dl, bl
    add dl, 30h
    mov ah, 02h
    int 21h
    cmp dl, 1h
    jne checker
    
   common:
    call nextLn
    mov ax, cx
    sub ah, ah
    mov bh, 10h
    div bh
    
    mov dl, al
    mov dh, ah
    add dl, 30h
    mov ah, 02h
    int 21h
    
    mov dl, dh
    add dl, 30h
    aaa
    mov ah, 02h
    int 21h 
    
   done:
   ret
commonFinder endp

  
commonDivs proc
   original: 
    mov cl, bl
    call commonFinder
    call halfInput
   
   divFind:   
    sub bh, bh
    mov ax, bx
    div cl
    cmp cl, 1
    je end
    cmp ah, 0
    je caller
    dec cl 
    jmp divFind
   caller:
    call commonFinder
    dec cl
    jmp divfind
  
   end:
    ret
commonDivs endp 

  
valInsert proc
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, 10
    mul bl
    mov bl, al 
  
    mov ah, 01h
    int 21h
    sub al, 30h
    add bl, al
     
   ret
valInsert endp


arrVal proc
    
    mov si, offset div1
    mov [si], bx
    inc si
     
    call halfInput
   divisorFind:
    mov ax, bx
    div cl
    cmp ah, 0
    je divInsert
    jmp continue
    
   divInsert:
    mov [si], cx
    inc si
   
   continue:
    loop divisorFind
  ret
arrVal endp
  
  
nextLn proc
    mov dl, 0dh 
    mov ah, 02h
    int 21h
    mov dl, 0ah
    mov ah, 02h
    int 21h  
   ret
nextLn endp


halfInput proc
    mov al, bl
    sub ah, ah
    mov cl, 2h
    div cl
    mov cl, al
    sub ch, ch
   ret
halfInput endp
  
  end main
    