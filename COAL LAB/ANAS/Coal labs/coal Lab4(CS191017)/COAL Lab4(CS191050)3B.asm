.data

msg1: .asciiz" Please enter a Positive Integer = "

result1: .asciiz "The Sum of First  "
result2: .asciiz " Integer is = "

#Sum declare by $t1
#Count Declare by $t2

.text
.globl main
main:

	li $v0,4
	la $a0,msg1
	syscall
	
	li $v0,5
	syscall
	
	move $t0,$v0
	
	li $t1,0
	li $t2,0

for:
	blt $t0,$t2,endf
#Sum = Sum + count
	add $t1,$t1,$t2
	
#Count++	
	add $t2,$t2,1
	b for

	
endf:
	li $v0,4
	la $a0,result1
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall
	
	li $v0,4
	la $a0,result2
	syscall
	
	li $v0,1
	move $a0,$t1
	syscall

	li $v0,10
	syscall	
		
