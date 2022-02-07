.data
textfile: .asciiz"new.txt"
length: .space 1024
space: .asciiz"\n"
sampleinput: .asciiz"Oranges; Banana; Apple. Mango; Pomegranate"	#input
output: .asciiz "output:  \t "
.text
.globl main
main:

li $v0,13
la $a0,textfile
li $a1,0
syscall
move $s0,$v0

li $v0,14
move $a0,$s0
la $a1,length
la $a2,1024
syscall

li $v0,4
la $a0,length
syscall

li $v0,16
move $a0,$s0
syscall

li $v0,4
la $a0,output
syscall

la $s0,length

loop:
lb $t0,($s0)
bne $t0,';',print

endondot:
add $s0,$s0,1
beq $t0,'.',exit
b loop

print:
li $v0,11
move $a0,$t0
syscall

beq $t0,' ',line
b endondot

line:
li $v0,4
la $a0,space
syscall

b endondot

exit:
li $v0,10
syscall
