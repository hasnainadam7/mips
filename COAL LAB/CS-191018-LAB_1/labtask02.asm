.data


.text

li $t0, 32
li $t1, 52

li $t3, 58
li $t4, 3


mul $t3, $t3, $t4

add $t0, $t0, $t1
add $t0, $t0, $t3
li $t3, 57
add $t0, $t0, $t3

li $v0, 1
move $a0, $t0
  syscall
   
