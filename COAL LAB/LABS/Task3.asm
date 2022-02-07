.data
string1:.asciiz "\n"

i:.word 0

.text

lw $t0, i
	# i=15 intialization
add $t0, $t0, 15

# OUTPUT Starting from 15
move $a0, $t0
li $v0,1
syscall

#newline
li $v0,4
la $a0, string1
syscall

loop:	
	# i>0
blez  $t0, exit
	
	#i-=2
sub $t0, $t0, 2

	# after -2
move $a0, $t0
li $v0,1
syscall

#newline
li $v0,4
la $a0, string1
syscall

j loop
exit:
li $v0, 10
syscall
