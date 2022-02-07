.data
chararray: .space 500
msg:.asciiz "enter chars: "
msg1:.asciiz "output: "

.text
.globl main
main:
    la $a0,msg 
    li $v0,4
    syscall

    li $v0,8		 
    la $a0, chararray		
    li $a1, 20 		
    move $t0,$a0 		
    syscall

    la $a0,msg1	 
    li $v0,4
    syscall

    la $a0, chararray 		
    move $a0,$t0 		
    li $v0,4 		
    syscall
    
    li $v0,10 		
    syscall
