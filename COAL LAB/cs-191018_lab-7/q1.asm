.data	
	msg:  .asciiz "Enter your string ->  "
	check1: .asciiz " Given input is Palindrome "
	check2: .asciiz "Given input is not Palindrome"
	str: .space 50
.text
main: 
	li $v0, 4
	la $a0, msg
	syscall

	la $a0, str
	li $a1, 50
	li $v0, 8
	syscall

	la $t0, str
	la $t1, str
calculating_length_ofloop:
	lb $t2, ($t1)
	beqz $t2, ending
	addu $t1, $t1, 1 
	b calculating_length_ofloop
ending:
	subu $t1, $t1, 2
Conditional_loop:
	bge $t0, $t1 check_ispalindrome
	lb $t2, ($t0)
	lb $t3, ($t1)
	bne $t2, $t3 check_notpalindrome
	addu $t0, $t0, 1
	subu $t1, $t1, 1
	b Conditional_loop
check_ispalindrome: 
	la $a0, check1
	li $v0, 4
	syscall
	b exit
check_notpalindrome:
	la $a0, check2
	li $v0, 4
	syscall
	b exit
exit: 
	li $v0, 10
	syscall
