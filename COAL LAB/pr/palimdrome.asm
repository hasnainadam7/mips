.data	
	input:  .asciiz "Enter a string to check Palindrome statement: "
	Palindrome: .asciiz "The entered string is a Palindrome."
	NOTPalindrome: .asciiz "The entered string is NOT a Palindrome."
	string: .space 20
.text
main: 
	li $v0, 4
	la $a0, input
	syscall

	la $a0, string
	li $a1, 20
	li $v0, 8
	syscall

	la $t1, string
	la $t2, string
LengthLoop:
	lb $t3, ($t2)
	beqz $t3, LengthLoopEnd
	addu $t2, $t2, 1 
	b LengthLoop
LengthLoopEnd:
	subu $t2, $t2, 2
ConditionLoop:
	bge $t1, $t2, IsPalindrome
	lb $t3, ($t1)
	lb $t4, ($t2)
	bne $t3, $t4, NotPalindrome
	addu $t1, $t1, 1
	subu $t2, $t2, 1
	b ConditionLoop
IsPalindrome: 
	la $a0, Palindrome
	li $v0, 4
	syscall
	b Exit
NotPalindrome:
	la $a0, NOTPalindrome
	li $v0, 4
	syscall
	b Exit
Exit: 
	li $v0, 10
	syscall
