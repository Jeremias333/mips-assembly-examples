.data
	brokenRow: .asciiz "\n"
	result: .word 0
.text
	.globl MAIN

	MAIN:
		la $t3, brokenRow
		li $a0, 5 #valor a ser fatorado
		
		jal FATORIAL
		sw $v0, result
		
		li $v0, 1
        	lw $a0, result
       		syscall
       		
       		#printando valor
		li $v0, 4
		add $a0, $t3, $0
		syscall
		
		li $v0, 10
        	syscall
	
FATORIAL:
	addi $sp, $sp, -8
	sw $ra, 4 ($sp)
	sw $a0, 0 ($sp)
	
	slti $t0, $a0, 1
	beq $t0, $zero, CALLFAT
	
	addi $v0, $zero, 1
	addi $sp, $sp, 8
	jr $ra

CALLFAT:
	addi $a0, $a0, -1
 	jal FATORIAL

lw $a0, 0 ($sp)
lw $ra, 4 ($sp)
addi $sp, $sp, 8
mul $v0, $a0, $v0
jr $ra
