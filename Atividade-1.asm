.data
	mensagem: .ascii "Hello World"
	caracterPularLinha: .asciiz " \n"
.text
	la $s0, mensagem

	#JOGANDO O VALOR 4 NO REGISTRADOR $V0 PARA EXECUTAR O COMANDO O SYSCALL
	addi $v0, $0, 4
	add $a0, $s0, $0
	syscall
	
	#ENCERRANDO PROGRAMA
	li $v0, 10
	syscall
	
	#/////////// PULANDO LINHAS POR ERROS DE PRINTAR STRINGS EXTRAS NO PC
	la $t5, caracterPularLinha
	
	li $v0, 4
	add $a0, $t5, $0
	syscall
	
	li $v0, 4
	add $a0, $t5, $0
	syscall
	#///////////
