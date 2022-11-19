.data
	brokenRoll: .ascii "\n"
	inputText: .ascii "Digite um valor diferente de zero: "
	outputText: .ascii "Soma é: "
	space: .asciiz " "
.text
.globl MAIN

# Exemplo de Do While loop até entrada ser diferente de 0

MAIN:
	#Inicializando variáveis de texto
	la $t3, brokenRoll
	la $t1, inputText
	la $t2, outputText
	la $t0, space
	
	li $t5, 1 #x = 1
	
	#Printando pedido de input
	li $v0, 4
	add $a0, $t1, $0
	syscall
	
	#Entrando com a nota
	li $v0, 5
	syscall
	
	#atribuindo valor de entrada ao registrador
	add $t4, $t4, $v0

WHILE:
	bne $t4, 0, EXIT
	
	#Printando pedido de input
	li $v0, 4
	add $a0, $t1, $0
	syscall
	
	#Entrando com a nota
	li $v0, 5
	syscall
	
	#atribuindo valor de entrada ao registrador
	add $t4, $t4, $v0
	
	j WHILE

EXIT:
	add $t4, $t4, $t5 # soma = x+soma

	#Printando pedido de output
	li $v0, 4
	add $a0, $t2, $0
	syscall
	
	#Printando resultado
	li $v0, 1
	add $a0, $t4, $0
	syscall
