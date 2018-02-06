;=====================Load===========================
org 7c00h
push cs
pop es
jmp start
db 'Loading OS...'
db 'Pleas press enter:'
a db '-1-|-2-|-3-'
s db '-4-|-5-|-6-'
d db '-7-|-8-|-9-'
start:
mov ah,00h
mov al,3h
int 10h
mov ah,13h
mov cx,13
mov bp,0004h
mov al,0b
mov bl,0000_1111b
int 10h
mov ah,13h
mov cx,18
mov bp,0011h
mov al,1b
mov dh,1
mov dl,0
mov bl,0000_1111b
int 10h
chek:
mov ah,00h
int 16h
cmp al,0dh
je OS
jmp chek
;==================operation sys==================================
f db 'WelcoM!'
OS:
    mov ah,00h
    mov al,3
    int 10h
    mov ah,13h
    push cs
    pop es
    mov bp,0074h
    mov cx,6
    mov dh,1
    mov dl,1
    mov al,1b
    mov bl,0101_1011b
    int 10h
;=============vvod dann=============
vvod:
    mov ah,00h
    int 16h ;al=simvol
    cmp al,78h
    je startg
    jmp vvod
;==============Programm XO===========
xo:
push cs
pop es
push 0



startg:
    mov ah,00h
    mov al,3h
    int 10h
    mov ah,13h
    mov cx,11
    mov bp,0023h
    mov al,1b
    mov dh,0
    mov dl,0
    mov bl,0000_1111b
    int 10h
    mov ah,13h
    mov cx,11
    mov bp,002Eh
    mov al,1b
    mov dh,1
    mov dl,0
    mov bl,0000_1111b
    int 10h
    mov ah,13h
    mov cx,11
    mov bp,0039h
    mov al,1b
    mov dh,2
    mov dl,0
    mov bl,0000_1111b
    int 10h
    mov ah,02h
    mov dh,3
    mov dl,0
    int 10h
    mov ah,00h
    int 16h
    cmp al,65h
    je OS
    mov bx,0023h
    mov cx,33
obrat:
    cmp al,[bx]
    je found
    inc bx
    loop obrat
    jmp neto
found:
    
    pop ax
    push ax
    mov ah,0
    xor dx,dx
    mov dl,2h
    div dl
    cmp ah,0
    je nul
    jmp krest
nul:
    pop ax
    add ax,1
    push ax
    mov [bx],58h
    jmp startg
krest:
    pop ax
    add ax,1
    push ax
    mov [bx],30h
    jmp startg
neto: 
    jmp startg    