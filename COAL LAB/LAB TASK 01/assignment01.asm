.data
#((52*8)*12+8)-(18+116)+(15*2)
.text

li $t0, 52  
li $t1, 8
li $t2, 12

li $t3, 18
li $t4, 116

li $t5, 15
li $t6, 2

mul $t0, $t0, $t1
mul $t0, $t0, $t2
add $t0, $t0, $t1

add $t3, $t3, $t4
mul $t5, $t5, $t6
add $t3, $t3, $t5

sub $t0, $t0, $t3

li $v0, 1
move $a0, $t0
syscall




