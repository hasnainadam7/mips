.text
.globl main
main:

	li $t1, 5		
	li $t2, 10		
	
	add $a1, $t1, $t2	
		
	li $t3, 5		
	li $t4, 10	
	
	mul $a2, $t3, $t4	
	
	sub $v1, $a1, $a2	
	
	syscall