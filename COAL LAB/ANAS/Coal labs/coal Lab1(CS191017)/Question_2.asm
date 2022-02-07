.text
.globl main
main:
	li $t1, 18		
	li $t2, 116		
	
	add $a1, $t1, $t2	
	li $t3, 15		
	li $t4, 2		
	
	
	mul $a2, $t3, $t4	
	li $t5, 5		

	mul $v1, $a2, $t5	
	add $v1, $a1, $v0	
	
	syscall 
	
	
	
	
	
	
	
