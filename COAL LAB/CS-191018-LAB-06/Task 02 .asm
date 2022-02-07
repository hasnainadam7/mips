.data
n:.word 0
valueN:.asciiz "Enter n = "
n1:.word 1
result:.word 1
output:.asciiz "Output = "

.text
li, $v0, 4
la $a0, valueN
syscall

li, $v0, 5
syscall
sw $v0, n

lw $t1,n
lw $t3,n1
lw $t4, result

loop:
blez $t1, exit
	
sub $t2,$t1,$t3

	#(n--)
sub $t1, $t1, 1

j innerloop

innerloop:

beqz $t2, loop

mul $t4, $t4, $t2
	# t2 --
sub $t2, $t2, 1

j innerloop

exit:
add $t4, $t4, 1

li, $v0, 4
la $a0, output
syscall

li, $v0, 1
move $a0, $t4
syscall

li, $v0, 10
syscall
