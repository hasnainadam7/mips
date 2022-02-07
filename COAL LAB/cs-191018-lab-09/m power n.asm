.data
	input_msg1: .asciiz "Enter any base(m)number "
	input_msg2: .asciiz "Enter any power(n)number : "
.text
.globl main
main:
    	la $a0, input_msg1
    	li $v0, 4
    	syscall
        
        li $v0, 5
    	syscall
    
    	move $t1, $v0
    	la $a0, input_msg2
    	li $v0, 4
    	syscall
    
    	li $v0, 5
    	syscall
    
    	move $a1, $v0       
    	move $a0, $t1			
    	jal pow_of_num
    
    	move $t1, $v0
    
    	move $a0, $t1
    	li $v0, 1
    	syscall
    
    	li $v0, 10
    	syscall
pow_of_num: 
	addi $sp, $sp, -4
        sw $ra, 0($sp)
        
        bne $a1, $zero, loop
        addi $v0, $zero, 1
        addi $sp, $sp, 4
        jr $ra
loop:   
	bne $a1, 1, loop1
        add $v0, $zero, $a0
        addi $sp, $sp, 4
        jr $ra
loop1:  
	move $t2, $a1
        addi $t1, $t2, 1        	
        bne $t1, $zero, loop2    	
        srl $a1, $a1,1        		
        jal pow_of_num     		
    
        mul $v0,$v0,$v0        		
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        jr $ra
loop2: 
	addi $a1, $a1, -1        	
        jal pow_of_num
        
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        mul $v0, $v0, $a0
        jr $ra
        
