.data
string1: .asciiz "Enter the Table Number = "
string2: .asciiz "\n"
a: .word 1
b: .word 1
number: .word 1
s1: .asciiz "*"
s2: .asciiz "="

.text
lw $t0, a
lw $t1, b
lw $t2, number
	#string1 (TABLE NUMBER)
li $v0, 4
la $a0 , string1
syscall
	#input
li $v0, 5
syscall
move $t0 , $v0
	
	#LOOP
loop:
	# compare
beq $t1, 11, Exit

# Multiply
mul $t2, $t0, $t1

	# (a)
move $a0, $t0
li $v0, 1
syscall
	# ( * sign )
li $v0, 4
la $a0 , s1
syscall
	# (b)
move $a0, $t1
li $v0, 1
syscall
	# ( = sign )
li $v0, 4
la $a0 , s2
syscall
	# NUMBER OUTPUT
move $a0, $t2
li $v0,1
syscall
	#string 2 (NEWLINE) 
li $v0, 4
la $a0 , string2
syscall
		
		# ( b++)
add $t1, $t1, 1
j loop

Exit:
li $v0, 10
syscall
