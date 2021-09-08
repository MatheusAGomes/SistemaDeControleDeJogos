.data

msg1: .asciiz "\n 1 - para registrar times "
msg2: .asciiz "\n 2 - para registrar resultados "
msg3: .asciiz "\n 3 - editar times  "
msg4: .asciiz "\n 4 - para gerar resultados "
msg5: .asciiz "\n Escolha: "
msg6: .asciiz "\n O numero escolhido nao e uma escolha"
msg7: .asciiz "\n Entre com o time "
msg8: .asciiz " : "
msg9: .asciiz "\n Selecione o primeiro time a fazer o resultado(Numero do time): "
msg11: .asciiz "\n Selecione o segundo time a fazer o resultado(Numero do time): "
msg12: .asciiz "\n Os times sao iguais, escolha 2 times diferentes"

msg13: .asciiz "\n Time vitorioso(Numero do time): "

msg14: .asciiz "\n 5 - tabela "


aspas1: .asciiz "( "
aspas2: .asciiz "  )"


enter: .asciiz "\n"

versus: .asciiz "X \n"



msg10: .asciiz "Numero do time \t Time \n"
tab: .asciiz "\t  \t  "

TABELA: .asciiz "TIMES \t JOGOS \t VITORIAS \t DERROTAS \n"




const : .word 10
const1 : .word 1
const2: .word 40


times: .space 80 #10*8
jogos: .word  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
vitorias: .word  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
derrotas: .word  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0


.text
.globl main 
main:


jal menu


li $v0,10
syscall



menu:

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg1 # msg1 ser o objeto da escrita
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg2 # msg1 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg3 # msg1 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg4 # msg1 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg14 # msg1 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg5 # msg1 ser o objeto da escrita
syscall



li $v0, 5 # codigo para passar texto atraves do console syscall
syscall

#passando o valor da escolha para $t0
add $t0,$v0,$zero


addi $t1, $t0, -1			# $t0 = $t1 + 0

beq $t1,$zero,P1


addi $t2, $t0, -2		# $t0 = $t1 + 0

beq $t2,$zero,P2


addi $t3, $t0, -3			# $t0 = $t1 + 0

beq $t3,$zero,P3


addi $t4, $t0, -4			# $t0 = $t1 + 0

beq $t4,$zero,P4


addi $t5, $t0, -5			# $t0 = $t1 + 0

beq $t5,$zero,P5

jr		$ra					# jump to $ra


P1:

passagem_de_times:

la		$t2, times 
lw		$t1, const	# $t1 = 2
li		$a1, 	8	# $a1 = 8
add 	$s0,$zero,$zero #zerando t0 para loop
		 

loop_para_leitura_de_times:

addi	$t4, $s0, 1			# $t3 = s01 1 0


sll $t0,$s0,5 #multiplicando o indice por 32
add $t3,$t2,$t0 #somando a multiplicacao com o endereco


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg7 # msg1 ser o objeto da escrita
syscall

li $v0, 1 # codigo para passar texto atraves do console syscall
move 	$a0, $t4		# $a0 = $31 # msg1 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg8 # msg1 ser o objeto da escrita
syscall


li		$v0,8 		# $v0 8= 
la		$a0,0($t3) 		# $a0 0($t3)
syscall
addi $s0,$s0,1
bne	$s0, $t1, loop_para_leitura_de_times	# if$s0 != $t1 then target

j menu


P2:

passagem_de_times_mostrar:

la		$t2, times 
lw		$t1, const	# $t1 = 2
li		$a1, 	25	# $a1 = 8
add 	$s0,$zero,$zero #zerando t0 para loop

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg10 # msg1 ser o objeto da escrita
syscall
		 

loop_para_mostrar_times:

addi	$t4, $s0, 1			# $t3 = s01 1 0


sll $t0,$s0,5 #multiplicando o indice por 32
add $t3,$t2,$t0 #somando a multiplicacao com o endereco


li $v0, 1 # codigo para passar texto atraves do console syscall
move 	$a0, $t4		# $a0 = $31 # msg1 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, tab # msg1 ser o objeto da escrita
syscall

li		$v0,4		# $v0 8= 
la		$a0,0($t3) 		# $a0 0($t3)
syscall

addi $s0,$s0,1
bne	$s0, $t1, loop_para_mostrar_times	# if$s0 != $t1 then target

escolha_dos_times:

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg9 # msg1 ser o objeto da escrita
syscall


li $v0, 5 # codigo para passar texto atraves do console syscall
syscall

move 	$s1, $v0		# $s1 = $01

addi	$s1, $s1, -1			#igular ao indice 


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg11 # msg1 ser o objeto da escrita
syscall

li $v0, 5 # codigo para passar texto atraves do console syscall
syscall

move 	$s2, $v0		# $s1 = $01
addi	$s2, $s2, -1			#igular ao indice

beq	$s2, $s1, Times_iguais	# if $s2 !=s$t1Times_iguaistarget

j continua_1

Times_iguais:
li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg12 # msg1 ser o objeto da escrita
syscall
j escolha_dos_times

continua_1:

la		$t1, jogos
la		$t2, vitorias
la		$t3, derrotas
la 		$t7, times
lw 		$t4,const1	


#aumentando a quantidade de jogos do primeiro jogador

sll $t0,$s1,5 #multiplicando o indice por 32
add $t6,$t1,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t6)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw $t5, 0($t6)


#aumentando a quantidade de jogos do segundo jogador

sll $t0,$s1,5 #multiplicando o indice por 32
add $t6,$t7,$t0 #somando a multiplicacao com o endereco



#time 1

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, 0($t6) # msg1 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas1 # msg1 ser o objeto da escrita
syscall

addi $t6, $s1, 1

li $v0, 1 # codigo para passar texto atraves do console syscall
move $a0,$t6 # msg1 ser o objeto da escrita
syscall




li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas2 # msg1 ser o objeto da escrita
syscall


# versus

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, versus # msg1 ser o objeto da escrita
syscall

#time 2

sll $t0,$s2,5 #multiplicando o indice por 32
add $t6,$t7,$t0 #somando a multiplicacao com o endereco


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, 0($t6) # msg1 ser o objeto da escrita
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas1 # msg1 ser o objeto da escrita
syscall

addi $t6, $s2, 1

li $v0, 1 # codigo para passar texto atraves do console syscall
move $a0,$t6 # msg1 ser o objeto da escrita
syscall




li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas2 # msg1 ser o objeto da escrita
syscall




li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg13 # msg1 ser o objeto da escrita
syscall



li $v0, 5 # codigo para passar texto atraves do console syscall
syscall
move $t6,$v0



sll $t0,$t6,5 #multiplicando o indice por 32
add $t7,$t2,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t7)


bne		$t6, $s1, Primeiro_Time_perdedor	# if $t6 !=s1t1 then target

j Segundo_time_perdedor

Primeiro_Time_perdedor:

move $t6,$s1

sll $t0,$t6,5 #multiplicando o indice por 32
add $t7,$t3,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t7)

j continua_2

Segundo_time_perdedor:

move $t6,$s2

sll $t0,$t6,5 #multiplicando o indice por 32
add $t7,$t3,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t7)


continua_2:

j menu

P3:


P4:

P5:

passagem_de_times_TABELA:

la		$t6, derrotas
la 		$t5, vitorias
la		$t4, jogos
la		$t2, times 
lw		$t1, const	# $t1 = 2
add 	$s0,$zero,$zero #zerando t0 para loop

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, TABELA # msg1 ser o objeto da escrita
syscall
		 

loop_para_mostrar_times_TABELA:

sll $t0,$s0,5 #multiplicando o indice por 32







add $t3,$t2,$t0 #somando a multiplicacao com o endereco
#TIMES
li		$v0,4		
la		$a0,0($t3) 		
syscall







add $t3,$t4,$t0 #somando a multiplicacao com o endereco
#JOGOS

li		$v0,4		
lw		$t7,0($t3)
move 	$a0, $t7		# $a0 = $71		
syscall


















add $t3,$t5,$t0 #somando a multiplicacao com o endereco

#VITORIAS

li		$v0,1
lw		$t7,0($t3)
move 	$a0, $t7		# $a0 = $71					
syscall







add $t3,$t6,$t0 #somando a multiplicacao com o endereco
#DERROTAS
li		$v0,1		
lw		$t7,0($t3)
move 	$a0, $t7		# $a0 = $71				
syscall




li		$v0,4		
la		$a0,enter 		
syscall





addi $s0,$s0,1
bne	$s0, $t1, loop_para_mostrar_times_TABELA	# if$s0 != $t1 then target


j menu
