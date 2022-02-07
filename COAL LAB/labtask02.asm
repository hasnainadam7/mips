.data 
prompt: .asciiz"Enter Your age:"
message: .asciiz "\nYour age is:"


.text
	#prompt the user 
	li  $v0, 4
	la $a0 ,prompt
	syscall
	
	# get age
	li $v0 ,5
	syscall
	
	# store 
	move $t0, $v0
	
	# diaplay
	
	li $v0, 4
	la $a0 , message
	syscall
	
	#print age
	li $v0, 1
	mul $t0, $t0, 2
	move $a0, $t0
	syscall
	