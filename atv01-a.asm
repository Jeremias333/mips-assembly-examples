.data
	brokenRoll: .ascii "\n"

.text
.globl MAIN

# Exemplo de for loop de 1 até 10

MAIN:
	la $t3, brokenRoll

LOOP:
	bgt $t0, 9, EXIT
	
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
	
	j LOOP

EXIT: