

.data	
T:  .asciiz " Input String here: "
Y: .asciiz "Provided String is Palindrome"
N: .asciiz "Provided String is Palindrome"
S: .space 10
.text

Main: 
	li $v0, 4
	la $a0, T
	syscall

	la $a0, S
	li $a1, 50
	li $v0, 8
	syscall

	la $t0, S
	la $t1, S

Sl:
	lb $t2, ($t1)
	beqz $t2, E1
	addi $t1, $t1, 1 
	j Sl

E1:
	subu $t1, $t1, 2

Iteration:
	bge $t0, $t1 Yes
	lb $t2, ($t0)
	lb $t3, ($t1)
	bne $t2, $t3 No
	addi $t0, $t0, 1
	subu $t1, $t1, 1
	j Iteration 

Yes: 
	la $a0,Y
	li $v0, 4
	syscall
	j E2

No:
	la $a0,N
	li $v0, 4
	syscall
	j E2

E2:
	li $v0, 10
	syscall
