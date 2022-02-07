.data
compare:.asciiz    " \n\t"
string:.asciiz   "Input: "

filename: .asciiz "E:/DHA SUFFA UNIVERSITY/COAL LAB/CS-191018-LAB-10/filename.txt"
words:.asciiz   "Total Number of WORDS present in String are: "
fileword: .space 1024
newline:.asciiz  "\n"

.text

li $v0, 13 		# open file
la $a0, filename 		 # file name loading

li $a1, 0  		# reading file
syscall
move $s0, $v0 		 # file descriptor

li $v0, 14  		# read from file
move $a0, $s0 		 # file descriptor

la $a1, fileword  		# buffer holding string of whole file

li $a2, 1024 		 # size of buffer
syscall

li $v0, 4 		 # print string in file
la $a0, fileword  		# load address of buffer
syscall


li $s2,0                    
la $s0,fileword                 

loop:

lb      $t0,0($s0)              
addiu   $s0,$s0,1                
beqz    $t0,another_innerLoop          
la      $s1,compare               

innerLoop:
lb      $t1,0($s1)              
beqz    $t1,loop          
addiu   $s1,$s1,1                
bne     $t0,$t1,innerLoop      
addi    $s2,$s2,1                
j  loop

another_innerLoop:

li $v0,4
la $a0,newline
syscall

li $v0,4
la $a0,words
syscall

li   $v0,1
move $a0,$s2
syscall

li $v0,4
la $a0,newline
syscall


li $v0, 16  		# close file
move $a0, $s0
syscall

li $v0, 10  		# end program
syscall
