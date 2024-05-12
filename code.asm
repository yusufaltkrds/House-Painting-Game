.data                      
    houseLine0 DB  '        __                   ', 10, 13, '$'
    houseLine1 DB  '   _____||_____________        ', 10, 13, '$'
    houseLine2 DB  '  _||_  || _       _  |_       ', 10, 13, '$'
    houseLine3 DB  ' _|  |_   (_)     (_)  |_      ', 10, 13, '$'
    houseLine4 DB  '_|    |_                |_     ', 10, 13, '$' 
    houseLine5 DB  '|______|_________________|   ', 10, 13, '$'
    houseLine6 DB  '|      |                 |    ', 10, 13, '$'
    houseLine7 DB  '|  _   |  _ _       _ _  |    ', 10, 13, '$'
    houseLine8 DB  '| {_}  | [_|_]     [_|_] |    ', 10, 13, '$'
    houseLine9 DB  '|      |       ___       |    ', 10, 13, '$'
    houseLine10 DB '|      |       | |       |    ', 10, 13, '$'
    houseLine11 DB '|______|_______|_|_______|    ', 10, 13, '$'
    color db 0
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    
    lea dx, houseLine0
    int 21h    
    
    lea dx, houseLine1
    int 21h
    
    lea dx, houseLine2
    int 21h
    
    lea dx, houseLine3
    int 21h
    
    lea dx, houseLine4
    int 21h
    
    lea dx, houseLine5
    int 21h

    lea dx, houseLine6
    int 21h
    
    lea dx, houseLine7
    int 21h    
    
    lea dx, houseLine8
    int 21h
    
    lea dx, houseLine9
    int 21h
    
    lea dx, houseLine10
    int 21h
    
    lea dx, houseLine11
    int 21h
    
    
	mov al, 1
	mov bh, 0
	mov bl, 1111_0000b
	mov cx, msg4end - offset msg4  
	mov dl, 2
	mov dh, 16
	push cs
	pop es
	mov bp, offset msg4
	mov ah, 13h
	int 10h
	jmp msg4end
	msg4 db "Cikmak icin esc'ye basiniz"
	msg4end:
	
    
    jmp renk
    
renk:
    mov al, 1
	mov bh, 0
	mov bl, 1111_0000b
	mov cx, msg0end - offset msg0 
	mov dl, 2
	mov dh, 13
	push cs
	pop es
	mov bp, offset msg0
	mov ah, 13h
	int 10h
	jmp msg0end
	msg0 db "Bir renk seciniz:"
	msg0end:
    
    mov al, 1
	mov bh, 0
	mov bl, 1111_0000b
	mov cx, msg1end - offset msg1  
	mov dl, 2
	mov dh, 14
	push cs
	pop es
	mov bp, offset msg1
	mov ah, 13h
	int 10h
	jmp msg1end
	msg1 db "1 : Kirmizi, 2 : Mavi, 3 : Sari, 4 : Yesil"
	msg1end:
    
    mov ah,00h
    int 16h
    cmp al,31h
    je renk1 
    cmp al,32h
    je renk2
    cmp al,33h
    je renk3
    cmp al,34h
    je renk4
    cmp al,1bh
    je exit
    
    
    jmp renk
    
renk1:
    mov color, 1100_1111b    
    jmp bolge       

renk2:
    mov color, 1001_1111b    
    jmp bolge       

renk3:
    mov color, 1110_0000b    
    jmp bolge       

renk4:
    mov color, 1010_0000b    
    jmp bolge      
       
bolge:
    mov al, 1
	mov bh, 0
	mov bl, 1111_0000b
	mov cx, msg2end - offset msg2  
	mov dl, 2
	mov dh, 13
	push cs
	pop es
	mov bp, offset msg2
	mov ah, 13h
	int 10h
	jmp msg2end
	msg2 db "Boyamak istediginiz alani seciniz:"
	msg2end:
	
	mov al, 1
	mov bh, 0
	mov bl, 1111_0000b
	mov cx, msg3end - offset msg3  
	mov dl, 2
	mov dh, 14
	push cs
	pop es
	mov bp, offset msg3
	mov ah, 13h
	int 10h
	jmp msg3end
	msg3 db "p : Pencere ve Kapi, d : Duvar, c : Cati           "
	msg3end:
    
    mov ah,00h
    int 16h
    cmp al,63h
    je  roof
    cmp al,64h
    je  wall
    cmp al,70h
    je  window
    cmp al,1bh
    je exit 
    
    jmp bolge

    
    
    
    
    
roof:         
    mov al, 1
	mov bh, 0
	mov bl, color
	mov cx, msg1rend - offset msg1r  
	mov dl, 8
	mov dh, 1
	push cs
	pop es
	mov bp, offset msg1r
	mov ah, 13h
	int 10h
	jmp msg1rend
	msg1r db "||"
	msg1rend:             
	
	mov al, 1
	mov bh, 0
	mov bl, color
	mov cx, msg2rend - offset msg2r  
	mov dl, 3
	mov dh, 2
	push cs
	pop es
	mov bp, offset msg2r
	mov ah, 13h
	int 10h
	jmp msg2rend
	msg2r db "||_  || _       _  |"
	msg2rend:           
	        
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg3rend - offset msg3r  
	mov dl, 2
	mov dh, 3
	push cs
	pop es
	mov bp, offset msg3r
	mov ah, 13h
	int 10h
	jmp msg3rend
	msg3r db "|  |_   "
	msg3rend:                         
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg4rend - offset msg4r 
	mov dl, 13
	mov dh, 3
	push cs
	pop es
	mov bp, offset msg4r
	mov ah, 13h
	int 10h
	jmp msg4rend
	msg4r db "     "       
	msg4rend:                            
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg5rend - offset msg5r 
	mov dl, 21
	mov dh, 3
	push cs
	pop es
	mov bp, offset msg5r
	mov ah, 13h
	int 10h
	jmp msg5rend
	msg5r db "  |"
	msg5rend:
                                        
    mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg6rend - offset msg6r 
	mov dl, 1
	mov dh, 4
	push cs
	pop es
	mov bp, offset msg6r
	mov ah, 13h
	int 10h
	jmp msg6rend
	msg6r db "|    |_                |"
	msg6rend:
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg7rend - offset msg7r 
	mov dl, 0
	mov dh, 5
	push cs
	pop es
	mov bp, offset msg7r
	mov ah, 13h
	int 10h
	jmp msg7rend
	msg7r db "|______|_________________|"
	msg7rend:
	
	jmp renk
	
wall:         
    mov al, 1
	mov bh, 0
	mov bl, color
	mov cx, msg1wend - offset msg1w 
	mov dl, 0
	mov dh, 6
	push cs
	pop es
	mov bp, offset msg1w
	mov ah, 13h
	int 10h
	jmp msg1wend
	msg1w db "|      |                 |"
	msg1wend:             
	
	mov al, 1
	mov bh, 0
	mov bl, color
	mov cx, msg2wend - offset msg2w 
	mov dl, 0
	mov dh, 7
	push cs
	pop es
	mov bp, offset msg2w
	mov ah, 13h
	int 10h
	jmp msg2wend
	msg2w db "|  _   |  _ _       _ _  |"
	msg2wend:           
	        
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg3wend - offset msg3w  
	mov dl, 0
	mov dh, 8
	push cs
	pop es
	mov bp, offset msg3w
	mov ah, 13h
	int 10h
	jmp msg3wend
	msg3w db "| "
	msg3wend:                         
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg4wend - offset msg4w  
	mov dl, 5
	mov dh, 8
	push cs
	pop es
	mov bp, offset msg4w
	mov ah, 13h
	int 10h
	jmp msg4wend
	msg4w db "  | "       
	msg4wend:                            
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg5wend - offset msg5w  
	mov dl, 14
	mov dh, 8
	push cs
	pop es
	mov bp, offset msg5w
	mov ah, 13h
	int 10h
	jmp msg5wend
	msg5w db "     "
	msg5wend:
                                        
    mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg6wend - offset msg6w  
	mov dl, 24
	mov dh, 8
	push cs
	pop es
	mov bp, offset msg6w
	mov ah, 13h
	int 10h
	jmp msg6wend
	msg6w db " |"
	msg6wend:
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg7wend - offset msg7w  
	mov dl, 0
	mov dh, 9
	push cs
	pop es
	mov bp, offset msg7w
	mov ah, 13h
	int 10h
	jmp msg7wend
	msg7w db "|      |       ___       |"
	msg7wend:
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg8wend - offset msg8w  
	mov dl, 0
	mov dh, 10
	push cs
	pop es
	mov bp, offset msg8w
	mov ah, 13h
	int 10h
	jmp msg8wend
	msg8w db "|      |       "
	msg8wend:
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg9wend - offset msg9w 
	mov dl, 18
	mov dh, 10
	push cs
	pop es
	mov bp, offset msg9w
	mov ah, 13h
	int 10h
	jmp msg9wend
	msg9w db "       |"
	msg9wend:
	
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg10wend - offset msg10w 
	mov dl, 0
	mov dh, 11
	push cs
	pop es
	mov bp, offset msg10w
	mov ah, 13h
	int 10h
	jmp msg10wend
	msg10w db "|______|_______"
	msg10wend:
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg11wend - offset msg11w  
	mov dl, 18
	mov dh, 11
	push cs
	pop es
	mov bp, offset msg11w
	mov ah, 13h
	int 10h
	jmp msg11wend
	msg11w db "_______|"
	msg11wend:
	
	jmp renk
	
window:         
    mov al, 1
	mov bh, 0
	mov bl, color
	mov cx, msg1yend - offset msg1y 
	mov dl, 10
	mov dh, 3
	push cs
	pop es
	mov bp, offset msg1y
	mov ah, 13h
	int 10h
	jmp msg1yend
	msg1y db "(_)"
	msg1yend:             
	
	mov al, 1
	mov bh, 0
	mov bl, color
	mov cx, msg2yend - offset msg2y 
	mov dl, 18
	mov dh, 3
	push cs
	pop es
	mov bp, offset msg2y
	mov ah, 13h
	int 10h
	jmp msg2yend
	msg2y db "(_)"
	msg2yend:           
	        
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg3yend - offset msg3y  
	mov dl, 2
	mov dh, 8
	push cs
	pop es
	mov bp, offset msg3y
	mov ah, 13h
	int 10h
	jmp msg3yend
	msg3y db "{_}"
	msg3yend:                         
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg4yend - offset msg4y 
	mov dl, 9
	mov dh, 8
	push cs
	pop es
	mov bp, offset msg4y
	mov ah, 13h
	int 10h
	jmp msg4yend
	msg4y db "[_|_]"       
	msg4yend:                            
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg5yend - offset msg5y 
	mov dl, 19
	mov dh, 8
	push cs
	pop es
	mov bp, offset msg5y
	mov ah, 13h
	int 10h
	jmp msg5yend
	msg5y db "[_|_]"
	msg5yend:
                                        
    mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg6yend - offset msg6y 
	mov dl, 15
	mov dh, 10
	push cs
	pop es
	mov bp, offset msg6y
	mov ah, 13h
	int 10h
	jmp msg6yend
	msg6y db "| |"
	msg6yend:
	
	mov al, 1        
	mov bh, 0
	mov bl, color
	mov cx, msg7yend - offset msg7y  
	mov dl, 15
	mov dh, 11
	push cs
	pop es
	mov bp, offset msg7y
	mov ah, 13h
	int 10h
	jmp msg7yend
	msg7y db "| |"
	msg7yend:
	 
	jmp renk
	


exit:    
    mov ah, 4Ch
    int 21h
    

end main 