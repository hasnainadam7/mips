.data
m:.word 0
n:.word 0
result:.word 1
answer:.asciiz"Answer (M^n) = "
valueM:.asciiz"Enter m = "
valueN:.asciiz"Enter n = "

.text
	#Enter m = 
li, $v0, 4
la, $a0, valueM
syscall
	# = m input
li, $v0, 5
syscall
sw $v0, m
	#Enter n = 
li, $v0, 4
la, $a0, valueN
syscall
	# = n input
li, $v0, 5
syscall
sw $v0, n

lw $t0, m
lw $t1, n
lw $t2, result 

loop:
	# if (n=!0)
beqz $t1, exit
	#Result = Result * m
mul $t2, $t2, $t0
	# n--
sub $t1, $t1, 1

j loop
exit:

li, $v0, 4
la, $a0, answer
syscall

move $a0, $t2
li, $v0, 1
syscall

li, $v0, 10
syscall
.data
