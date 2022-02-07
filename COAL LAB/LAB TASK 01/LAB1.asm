.data

.text
li $t0, 9
li $t1, 8
li $t2, 12
li $t3, 16
li $t4, 15
li $t5, 5
li $t6, 2

sub $t0, $t0, $t1
mul $t2, $t2, $t0


sub $t3, $t3, $t4
mul $t5, $t5, $t6 

sub $t3, $t3, $t5
add $t2, $t2, $t3

li $v0, 1
move $a0, $t2
syscall

li $v0, 10
syscall