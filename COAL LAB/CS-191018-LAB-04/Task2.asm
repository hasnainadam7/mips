.data
integer: .asciiz "Enter a positive Integer = "
sumout: .asciiz "Sum = "
num: .word 0
count: .word 0
sum: .word 0

.text
lw $t0, num
lw $t1, count
lw $t2, sum

li $v0, 4
la $a0, integer
syscall
	#Integer Input
li $v0, 5
syscall
move $t0 , $v0

loop:
	#Condition
bge $t1, $t0, exit

	#Increment
add $t1, $t1, 1
	
	# Sum Calculation
add $t2, $t2, $t1

j loop
exit:


li $v0, 4
la $a0, sumout
syscall


move $a0, $t2
li $v0,1

syscall
li $v0, 10
syscall
