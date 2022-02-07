.data
new:.asciiz "\n"

i:.word 0

.text

lw $t0, i

add $t0, $t0, 11
move $a0, $t0
li $v0,1
syscall

#newline
li $v0,4
la $a0, new
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
la $a0, new
syscall

j loop
exit:
li $v0, 10
syscall
