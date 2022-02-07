.data
(9-8)*12+(16-15)-(5*2)

.text
li $t0, 2
li $t1, 1
li $t2, 10
li $t3, 3

sub $t0, $t0, $t1
mul $t2, $t2, $t3


li $t3, 4
add $t0, $t0, $t2
add $t0, $t0, $t3


li $v0, 1
move $a0, $t0
syscall