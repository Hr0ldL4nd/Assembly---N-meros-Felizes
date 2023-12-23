#código números felizes - Orlando Moreira
#este código foi feito usando o compilador venus, recomendo que rode lá

addi a4, zero, 4   #vai servir de condição de parada, uma vez que gera um ciclo infinito infeliz
addi a2, zero, 100 #referência centenas
addi a1, zero, 10  #referência dezenas
addi a0, zero, 1   #referência unidades e condição de parada

addi ra, ra, 0x100

addi a3, zero, 32 # armazena o número que desejamos ver se é feliz

bne a3, a0, while

while:
	sw a3, 0(ra)
    addi ra, ra, 13
	add a6, zero, zero # armazena alg. centenas
    add a5, zero, zero # armazena alg. dezenas
    #o algarismo das unidades será o próprio a3 após as subtrações
    
    bge a3, a2, centenas
    bge a3, a1, dezenas    
    bge a3, zero, unidades
    
continuar:
    #obtendo as potências de cada algarismo
    mul a6, a6, a6
    mul a5, a5, a5
    
    #realizando a soma e gerando o novo número
    #unidades² já foi feito antes
    add a3, a3, a6 #add quadrado das centenas
    add a3, a3, a5 #add quadrado das dezenas
    
    beq a3, a4, n_feliz #se chegarmos no ciclo infinito infeliz, eventualmente teremos o valor de a3 = 4, que é uma condição de parada
    beq a3, zero, n_feliz #se der 0, o número é infeliz
    beq a3, a0, feliz # se der 1, o número é feliz
    
    bne a3, a0, while #caso nenhuma das condições de parada sejam atingidas, recomeça o ciclo
    
centenas:
	addi a3, a3, -100
    addi a6, a6, 1
    bge a3, a2, centenas
    bge a3, a1, dezenas 
    bge a3, zero, unidades
    
dezenas:
	addi a3, a3, -10
    addi a5, a5, 1
    bge a3, a1, dezenas
    
unidades:
	mul a3, a3, a3 #já faz o quadrado do dígito das unidades
    beq a3, a3, continuar #sempre verdade, sempre continua
    
n_feliz:
    addi a3, zero, -2048 #se infeliz, o registrador a3 termina em -2048
    #a escolha desse número é só pra facilitar a visualização do resultado
    sw a3, 0(ra)
    beq a1, a1, done

feliz:
	# se feliz, o valor do registrador a3 termina em 1
	sw a3, 0(ra)
    
done:
