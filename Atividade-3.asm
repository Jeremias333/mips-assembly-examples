.data
	output_nota1: .asciiz "Entre com a primeira nota: "
	output_nota2: .asciiz "Entre com a segunda nota: "
	output_frequencia: .asciiz "Entre com a quantidade de frequencia: "
	output_aprovado: .asciiz "Aprovado !!"
	output_reprovado: .asciiz "Reprovado !!"
	SETENTAE5: .float 75.0
	SETE: .float 7.0
	DOIS: .float 2.0
	caracterPularLinha: .asciiz " \n"
.text
	#Printando Output 1
	la $t0, output_nota1

	li $v0, 4
	add $a0, $t0, $0
	syscall
	
	
	#Entrando com a primeira nota
	li $v0, 6
	syscall
	
	add.s $f1, $f0, $f9
	
	#li $v0, 2
	#add.s $f12, $f1, $f9
	#syscall
	
	#Printanto Output 2
	la $t0, output_nota2

	li $v0, 4
	add $a0, $t0, $0
	syscall
	
	
	#Entrando com a segunda nota
	li $v0, 6
	syscall
	
	add.s $f2, $f0, $f9
	
	#fazendo a soma
	add.s $f3, $f1, $f2
	
	l.s $f8, DOIS
	#calculando amedia 
	div.s $f3, $f3, $f8 #$f3 CARREGADO COM VALOR DA MEDIA
	
	#Printando output da frequencia
	la $t0, output_frequencia
		
	li $v0, 4
	add $a0, $t0, $0
	syscall 
	
	#Entrada da frequencia
	li $v0, 6
	syscall
	
	add.s $f4, $f0, $f9
	
	
	#aqui vai ficar a comparar se a media e menor ou igual a 7
	l.s $f7, SETE
	c.lt.s 0, $f3, $f7 #se for verdade altera a flag para 1
	
	#se a flag for 1 ele pula para a label reprovado
	bc1t 0, REPROVADO
	
	#aqui vai ficar a comparar se a frequencia e menor ou igual a 75
	l.s $f7, SETENTAE5
	c.lt.s 0, $f4, $f7 #se for verdade altera a flag para 1

	#se a flag for 1 ele pula para a label reprovado
	bc1t 0, REPROVADO 
	
	#se nao mudar nenhuma flag ele so vai printar o aprovado
	la $t5, output_aprovado
	
	li $v0, 4
	add $a0, $t5, $0
	syscall
	
	#ENCERRANDO PROGRAMA
	li $v0, 10
	syscall
	
	REPROVADO:
		#printando o reprovado
		la $t5, output_reprovado
	
		li $v0, 4
		add $a0, $t5, $0
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
	
	
