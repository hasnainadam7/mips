.data
 #((52*8)*12+8)-(18+116)+(15*2) 

.text
li $t0, 52
li $t1, 8
li $t2, 12

mul $t0, $t0, $t1
mul $t0, $t0, $t2
add $t0, $t0, $t1

li $t1, 18
li $t2, 116
li $t3, 15

add $t1, $t1, $t2

li $t2, 2

mul $t3, $t3, $t2

add $t1, $t1, $t3

sub $t0, $t0, $t1

li $v0, 1
move $a0, $t0
  syscall
