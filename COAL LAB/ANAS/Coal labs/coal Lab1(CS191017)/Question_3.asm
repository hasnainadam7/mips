.text
.globl main
main:

	li $t1, 32		
	li $t1, 52
	mul $a0, $t1, $t2	
		
	li $t3, 58		
	li $t4, 3		
	li $t5, 50	
	
	add $a1, $a0, $t3	
	sub $a2, $a1, $t4	
		
	mul $v0, $a2, $t5	
	syscall 
	
	
	
	
	
	
	
