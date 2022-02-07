.data
	physics: .asciiz "Enter Physics marks:"
	phymarks: .asciiz "\nNew physics marks:"
	
	chemistry: .asciiz "Enter chemistry marks:"
	chemarks: .asciiz "\nNew chemistry marks:"
	
	math: .asciiz "Enter math marks:"
	mathmarks: .asciiz "\nNew math marks:"
	
	english: .asciiz "Enter english marks:"
	engmarks:  .asciiz "\nNew Englisg marks:"
	
	total400: .asciiz "\nTotal out of 400 is:"
	total800: .asciiz "\nTotal out of 800 is:"
.text
	
	#display physics 
	li $v0, 4
	la $a0, physics
	syscall
	
	# get physics marks 
	li $v0, 5
	syscall
	
	#move to $t0
	move $t0, $v0
	
	#display chemistry 
	li $v0, 4
	la $a0, chemistry
	syscall
	
	# get chemistry marks 
	li $v0, 5
	syscall
	
	#move to $t1
	move $t1, $v0
	
	
	#display math 
	li $v0, 4
	la $a0, math
	syscall
	
	# get math marks 
	li $v0, 5
	syscall
	
	#move to $t2
	move $t2, $v0
	
	#display english 
	li $v0, 4
	la $a0, english
	syscall
	
	# get english marks 
	li $v0, 5
	syscall  
	
	#move to $t3
	move $t3, $v0	
	
	#add marks in $t0
	add $t4, $t0, $t1
	add $t4, $t4, $t2
	add $t4, $t4, $t3
	
		
	#double marks and display
	#physics
	li $v0, 4
	la $a0 , phymarks
	syscall
	
	#print marks
	li $v0, 1
	mul $t0, $t0, 2
	move $a0, $t0
	syscall 
	
	#chemistry
	li $v0, 4
	la $a0 , chemarks
	syscall
	
	#print marks
	li $v0, 1
	mul $t1, $t1, 2
	move $a0, $t1
	syscall
	
	#math
	li $v0, 4
	la $a0 , mathmarks
	syscall
	
	#print marks
	li $v0, 1
	mul $t2, $t2, 2
	move $a0, $t2
	syscall
	
	#english
	li $v0, 4
	la $a0 , engmarks
	syscall
	
	#print marks
	li $v0, 1
	mul $t3, $t3, 2
	move $a0, $t3
	syscall
	
	
	
	#print total out of 400
	li $v0, 4
	la $a0, total400
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	#print total out of 800
	li $v0, 4
	la $a0, total800
	syscall
	
	li $v0, 1
	mul $t4, $t4, 2
	move $a0, $t4
	syscall
	
	
	
