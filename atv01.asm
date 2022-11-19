.data
	message: .ascii "\n"

.text
.globl main

main:
	la $t3, message
	#li $v0, 1
	#addi $a0, $a0, 1
	#syscall

loop:
	bgt $t0, 9, exit
	
	#iteração
	addi $t0, $t0, 1
	
	#passando pra um registrador temporário sem atrapalhar a iteração
	addi $t1, $t0, 0
	
	#printando valor
	li $v0, 1
	move $a0, $t1
	syscall
	
	#printando valor
	li $v0, 4
	add $a0, $t3, $0
	syscall
	
	j loop

exit:

		
