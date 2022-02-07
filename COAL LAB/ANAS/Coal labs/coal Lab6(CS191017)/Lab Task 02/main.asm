.data
msg1: .asciiz "Enter a value of m :- "
msg2: .asciiz "Enter a value of n :- "
msg3: .asciiz "The Result is :- "


.text
.globl main
main:
	li $t0,1 # i=1
	li $t1,1 #Result

	li $v0,4
	la $a0,msg1
	syscall
	
	li $v0,5
	syscall

	move $t2,$v0 # Consider $t3 as "m"

	li $v0,4
	la $a0,msg2
	syscall
	
	li $v0,5
	syscall

	move $t3,$v0 # Consider $t3 as "n"


loop:
	bgt $t0,$t3,displayResult
	
	mul $t1,$t1,$t2

	addi $t0,$t0,1
	j loop
displayResult:
	li $v0,4
	la $a0,msg3
	syscall
	
	li $v0,1
	move $a0,$t1
	syscall
	j exit
	
exit:
	li $v0,10
	syscall
	
