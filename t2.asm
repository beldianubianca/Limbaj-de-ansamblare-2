;Sa se calculeze expresiile :
;z=(a+b+c+1)*(a+b+c+1)/((a-b+d)*(a-b+d))
;Rezolvare cu semn

ASSUME cs:text_,ds:data_
data_ SEGMENT
a db 4
b db 4
d db 4
c dw 123
z dw ?
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei
mov al, a ; al = a
sub al,b ; al=a-b
add al,d ; al=a-b+d
imul al ; ax=(a-b+d)*(a-b+d)
mov bx,ax ; bx=(a-b+d)*(a-b+d)
mov al,a ; al = a
add al,b ; al=a+b
add al,1 ; al=a+b+1
cbw ; ax=a+b+1
add ax,c ; ax=a+b+c+1
imul ax ; dx:ax=(a+b+c+1)*(a+b+c+1)
idiv bx ; ax=(a+b+c+1)*(a+b+c+1)/((a-b+d)*(a-b+d))
mov z,ax; z=(a+b+c+1)*(a+b+c+1)/((a-b+d)*(a-b+d))
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start