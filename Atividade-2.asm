.data 
	output_celsius: .asciiz "Entre com a temperatura em celsius: "
	output_fahrenheit: .asciiz "A temperatura convertida de celsius para fahrenheit é de: "
	caracterPularLinha: .asciiz " \n"
	NOVE: .float 9.0
	CINCO: .float 5.0
	ZERO: .float 0.0
	TRINTAE2: .float 32
	
.text
	la $t0, output_celsius	# $t0 : STRING DE INICIO DE CELSIUS

	li $v0, 4
	add $a0, $t0, $0
	syscall
	
	li $v0, 6
	syscall 
	
	add.s $f1, $f0, $f9 # $f1 ARMAZENA A ENTRADA DA TEMPERATURA EM CELSIUS
	
	l.s $f8, NOVE # $f8 ARMAZENA O VALOR DE NOVE
	
	mul.s  $f2, $f1, $f8 #$f2 ARMAZENA O RESULTADO DA MULTIPLICACAO DA TEMPERATURA EM CELSIU POR 9
	
	l.s $f7, CINCO # $f7 GUARDA O VALOR DE CINCO
	
	div.s $f2, $f2, $f7 #$f2 ARMAZENA O VALOR DA DIVISAO POR 5
	
	l.s $f6, TRINTAE2 #
	
	add.s $f2, $f2, $f6
	
	la $t0, output_fahrenheit	# $t0 : STRING DE INICIO DE CELSIUS

	#PRINTANDO O OUTPUT DE TEXTO
	li $v0, 4
	add $a0, $t0, $0
	syscall
	
	#PRINTANDO A TEMPERATURA EM FAHRENHEIT
	add.s $f12, $f2, $f9
	li $v0, 2
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