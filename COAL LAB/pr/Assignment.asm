.data
	msg: .asciiz "We love Pakistan!"
	string: .asciiz "String: "
	
	vowels: .asciiz "\nTotal vowels: "
	a: .asciiz "\na occurs "
	atimes: .asciiz " times"
	e: .asciiz "\ne occurs "
	etimes: .asciiz " times"
	i: .asciiz "\ni occurs "
	itimes: .asciiz " times"
	o: .asciiz "\no occurs "
	otimes: .asciiz " times"
	u: .asciiz "\nu occurs "
	utimes: .asciiz " times"
	
	vowelA: .asciiz "a"
	vowelE: .asciiz "e"
	vowelI: .asciiz "i"
	vowelO: .asciiz "o"
	vowelU: .asciiz "u"
.text
.globl main
main:
       	li $v0, 4      
       	la $a0, string
       	syscall 
       
       	li $v0, 4       
       	la $a0, msg
       	syscall 
      
       	li $t3, 0
       	li $t0, 20
       	la $t1, msg       
                          
       	lb $s1, vowelA      
       	lb $s2, vowelE
       	lb $s3, vowelI
       	lb $s4, vowelO
       	lb $s5, vowelU           
CountVowels:
      	lb $t2, ($t1)     
      	addi $t3, $t3,1    
      	addi $t1, $t1,1    
      	beqz $t2, TotalVowels    
      	bgt $t3, $t0, Check   
Check:
      	beq $t2, $s1, Avowel
      	beq $t2, $s2, Evowel
      	beq $t2, $s3, Ivowel
      	beq $t2, $s4, Ovowel
      	beq $t2, $s5, Uvowel
      	j CountVowels 
TotalVowels:
     	li $v0, 4      
     	la $a0, vowels
     	syscall
     
     	add $s0, $t5, $t6
     	add $s0, $s0, $t7
     	add $s0, $s0, $t8
     	add $s0, $s0, $t9
     
     	move $a0, $s0
     	li $v0, 1
     	syscall
     	j Frequency 
Avowel: 
	addi $t5, $t5, 1
  	j CountVowels
Evowel: 
  	addi $t6, $t6, 1
  	j CountVowels                
Ivowel: 
  	addi $t7, $t7, 1
  	j CountVowels                  
Ovowel: 
  	addi $t8, $t8, 1
  	j CountVowels         
Uvowel: 
  	addi $t9, $t9, 1
  	j CountVowels   
Frequency:
   	li $v0, 4       
     	la $a0, a
      	syscall
      	 
       	li $v0, 1
   	move $a0, $t5
   	syscall
        
        li $v0, 4      
       	la $a0, atimes
       	syscall 
                
	li $v0, 4      
   	la $a0, e
    	syscall
          
      	li $v0, 1
       	move $a0, $t6
      	syscall
        
        li $v0, 4      
       	la $a0, etimes
       	syscall 
                
       	li $v0, 4      
      	la $a0, i
      	syscall
          
      	li $v0, 1
       	move $a0, $t7
       	syscall
        
        li $v0, 4      
       	la $a0, itimes
       	syscall   
              
      	li $v0, 4       
      	la $a0, o
      	syscall
          
      	li $v0, 1
      	move $a0, $t8
      	syscall
        
        li $v0, 4      
       	la $a0, otimes
       	syscall   
              
      	li $v0, 4      
      	la $a0, u
      	syscall
          
     	li $v0, 1
     	move $a0, $t9
     	syscall 
     	
     	li $v0, 4      
       	la $a0, utimes
       	syscall                                         
exit:
       li $v0, 10        
       syscall
