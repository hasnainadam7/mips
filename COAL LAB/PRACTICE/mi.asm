
.data
filename: .asciiz "E:\hello.txt" 
word: .asciiz "\nHey !HSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSello to all\n"
fileword: .space 1024
.text
li $v0, 13 # open file
la $a0, filename # loading file name
li $a1, 1 # mode of writing in file
syscall
move $s0, $v0 # file descriptor

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, word # word u want to print

li $a2, 50 # size of word
syscall
li $v0, 16 # close file
move $a0, $s0 # file descriptor
syscall
li $v0, 10 # end program
syscall