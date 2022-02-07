.data 
	array: .space 40
	mess1: .asciiz "Please input 10 random numbers \n"	
	mess2: .asciiz "\nNumber in ascending order is: "
	mess3: .asciiz "\nSum of all number is: "
	mess4: .asciiz "\nAverage of numbers is: "
	mess5: .asciiz "\nMedian of numbers is: "
	mess6: .asciiz "\nSelect one of the following operations to peroform on the numbers \n1.Print in ascending order\n2.Print in descending order\n3.Sum & Average\n4.Median\n5.Largest Number \n6.Smallest Number \n7.Multiply two indexs(input indexs as 1,2,3...)\n8.Divide two indexes(input indexs as 1,2,3...) \n9.Sub two indexes(input indexs as 1,2,3...)\n10.Add two indexes(input indexs as 1,2,3...)\nInput 0 for exit\n"	
	mess7: .asciiz "\nNumber in descending order is: "
	mess8: .asciiz "\nLargest number is "
	mess9: .asciiz "\nSmallest number is "
	nl: .asciiz "\n"
	input1: .asciiz "Input index 1: "
	input2: .asciiz "Input index 2: "
	mul_i: "\nMultiple of two indexes is "
	div_i: "\nDivision of two indexes is "
	add_i: "\nAddition of two indexes is "
	sub_i: "\nSubtraction of two indexes is "
	
	space: .asciiz " "
	colon: .asciiz " : "
	dot: .asciiz "."
.text
.globl main
main:
	#print mess1
	li $v0,4
	la $a0,mess1
	syscall
	
########loop for input of numebrs
	li $t9,1
	li $s1,0
	li $t1,0
loop:
	move $a0,$t9 #for printing 1: , 2: etc
	li $v0,1
	syscall
	li $v0,4
	la $a0,colon
	syscall
	
	li $v0,5  #code for number input
	syscall
	sw $v0,array($s1)
	addi $s1,$s1,4
	addi $t9,$t9,1
	addi $t1,$t1,1
	blt $t1,10,loop
######## end of loop

######## Sorting of numbers
	li $t2,0
	li $s1,0
	li $t1,0
sort:
	beq $t2,9,contsort
	
	lw $t3,array($s1)
	lw $t4,array+4($s1)
	addi $s1,$s1,4	#for changing array index
	addi $t2,$t2,1  # i++ 
	ble $t3,$t4,sort
	
	sw $t3,array($s1)
	sw $t4,array+-4($s1)
	bne $t2,9,sort
contsort:
	addi $t1,$t1,1
	addi $t2,$t1,0
	li $s1,0
	blt $t1,9,sort
######### end of sorting

######## display operations
try_again:
	li $v0,4
	la $a0,mess6 #print operations
	syscall
	
	li $v0,5 #switch(choice)
	syscall
	move $a1,$v0
	
	
	bltz $v0,try_again
	beqz $v0,exit
	beq $v0,1,ascending
	beq $v0,2,descending
	beq $v0,3,sumaverage
	beq $v0,4,median
	beq $v0,5,largest_num
	beq $v0,6,smallest_num
	beq $v0,7,calculator
	beq $v0,8,calculator
	beq $v0,9,calculator
	beq $v0,10,calculator
	bgt $v0,10,try_again

######## print ascending array
ascending:
	li $t0,0
	li $t1,0
	
	##print mess2
	li $v0,4
	la $a0,mess2
	syscall
print_asc:
	lw $a0,array($t0)
	li $v0,1
	syscall
	
	la $a0,space
	li $v0,4
	syscall
	
	addi $t0,$t0,4
	addi $t1,$t1,1
	blt $t1,10,print_asc
	
	li $v0,4
	la $a0,nl #next Line
	syscall
	
	j try_again
	
######## end of print

######## print ascending array
descending:
	li $t0,36
	li $t1,0
	
	##print mess2
	li $v0,4
	la $a0,mess7
	syscall
print_des:
	lw $a0,array($t0)
	li $v0,1
	syscall
	
	la $a0,space
	li $v0,4
	syscall
	
	subi $t0,$t0,4
	addi $t1,$t1,1
	blt $t1,10,print_des
	
	li $v0,4
	la $a0,nl #next Line
	syscall
	
	j try_again
	
######## end of print

################# Sum && Average
sumaverage:
####### Sum of array elements
	li $t0,0
	li $t4,0
	li $t1,0
	
	##print mess3
	li $v0,4
	la $a0,mess3
	syscall
sum:
	lw $t3,array($t0)
	add $t4,$t4,$t3
	addi $t0,$t0,4
	addi $t1,$t1,1
	blt $t1,10,sum
	
	move $a0,$t4 #printing sum
	li $v0,1
	syscall
	
####### average
	li $t1,0
	
	##print mess3
	li $v0,4
	la $a0,mess4
	syscall
average:
	addi $t1,$t1,10
	div $t4,$t1
	mfhi $s1
	mflo $s0
	
	move $a0,$s0
	li $v0,1
	syscall 
	
	la $a0,dot
	li $v0,4
	syscall
	
	move $a0,$s1
	li $v0,1
	syscall
###### end of average
	li $v0,4
	la $a0,nl #next Line
	syscall
	
	j try_again
################# END of sum && average


###### printing median
median:
	la $a0,mess5
	li $v0,4
	syscall
	lw $t1,array+16
	lw $t2,array+20
	
	add $t1,$t1,$t2
	li $s1,2
	 
	div $t1,$s1
	mflo $s0
	mfhi $s1
	
	move $a0,$s0
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,dot
	syscall
	
	move $a0,$s1
	li $v0,1
	syscall

	li $v0,4
	la $a0,nl #next Line
	syscall
	
	j try_again
####### end of median

####### print largest number
largest_num:
	li $v0,4
	la $a0,mess8 #print largest message
	syscall
	
	li $v0,1
	lw $a0,array+36
	syscall
	
	li $v0,4
	la $a0,nl #next Line
	syscall
	
	j try_again
####### end of largest number

####### print smallest number
smallest_num:
	li $v0,4
	la $a0,mess9 #print smallest message
	syscall
	
	li $v0,1
	lw $a0,array
	syscall
	
	li $v0,4
	la $a0,nl #next Line
	syscall
	
	j try_again
####### end of smallest number

####### calculator
calculator:
	la $a0,input1
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $s1,$v0
	
	la $a0,input2
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $s2,$v0
	
	subi $s1,$s1,1
	subi $s2,$s2,1
		
	mul $s1,$s1,4
	mul $s2,$s2,4
	
	lw $t1,array($s1)
	lw $t2,array($s2)
	
	beq $a1,7,m
	beq $a1,8,d
	beq $a1,10,a
	beq $a1,9,s
	
m:	
	mul $t3,$t1,$t2
	
	la $a0,mul_i
	li $v0,4
	syscall
	
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,nl #next Line
	syscall
	
	j try_again
	
d:	
	div $t3,$t1,$t2
	
	la $a0,div_i
	li $v0,4
	syscall
	
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,nl #next Line
	syscall
	
	j try_again
a:	
	add $t3,$t1,$t2
	
	la $a0,add_i
	li $v0,4
	syscall
	
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,nl #next Line
	syscall
	
	j try_again
s:	
	sub $t3,$t1,$t2
	
	la $a0,sub_i
	li $v0,4
	syscall
	
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,nl #next Line
	syscall
	
	j try_again
####### end of calculator

exit:
	li $v0,10
	syscall
####### end of program

	
	

	
	
	
	
	
	
	
	
	
	
