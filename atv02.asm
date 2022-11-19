.data
	inputText: .ascii "Digite um valor diferente de zero: "
	outputText: .ascii "Soma é: "
	NOVE: .float 9.0
	CINCO: .float 5.0
	ZERO: .float 0.0
	TRINTAE2: .float 32

.text
.globl MAIN


MAIN:
	#Inicializando variaveis de texto
	la $t1, inputText
	la $t2, outputText
	
	#Printando pedido de input
	li $v0, 4
	add $a0, $t1, $0
	syscall
	
	#Entrando com a nota
	li $v0, 6
	syscall
	
	#atribuindo valor de entrada ao registrador
	add.s $f1, $f0, $f9
	
	l.s $f8, NOVE
	l.s $f7, CINCO 
	l.s $f6, TRINTAE2
	
	j CELSIUSTOFEIRHEINT
	
	add.s $f12, $f2, $f9
	li $v0, 2
	syscall


CELSIUSTOFEIRHEINT:
	mul.s  $f2, $f1, $f8
	div.s $f2, $f2, $f7
	add.s $f2, $f2, $f6
	
	j EXIT
	
EXIT:
	