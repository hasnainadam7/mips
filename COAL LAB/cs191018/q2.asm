.data


.text
li $t0, 29
li $t1, 70

add $t0, $t0, $t1
li $t1, 3

div $t0, $t0, $t1

li $t1, -20
li $t2, 22

add $t2, $t1, $t2
li $t1, 2

sub $t2, $t2, $t1

add $t0, $t0, $t2

li $v0, 1
move $a0, $t0
syscall
li $v0, 10
syscall