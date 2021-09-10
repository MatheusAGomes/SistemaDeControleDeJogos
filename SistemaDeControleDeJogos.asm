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
msg15: .asciiz "\n 0 - Sair "







msg16: .asciiz "\n Escolha o time para fazer a alteracao (Numero do time):  "





msg17: .asciiz "\n 1 - Alterar o nome do time "
msg18: .asciiz "\n 2 - Alterar jogo "
msg19: .asciiz "\n 3 - Alterar resultado "
msg20: .asciiz "\n Escolha: "
msg21: .asciiz "\n Novo nome: "
msg22: .asciiz "\n Antigo nome: "
msg23: .asciiz "\n Partidas do time: \n "
msg24: .asciiz " Jogou \n"
msg25: .asciiz " Nao Jogou \n"
msg26: .asciiz " Escolha um time para alterar a partida(Numero do time):  "
msg27: .asciiz " Perdeu \n "
msg28: .asciiz " Ganhou \n "









SEMI: .asciiz " SEMI-FINAL \n "
CLASSIFICADO: .asciiz " CLASSIFICADO \n "
NAOCLASSIFICADO: .asciiz " NAO CLASSIFICADO \n "
REBAIXADO: .asciiz " REBAIXADO \n "











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
const4: .word 4
const9: .word 9
const36: .word 36
constneg: .word -1


times: .space 80 #10*8

jogos: .space 40

vitorias: .word  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 

derrotas: .word  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 

resultadodejogos: .word 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
                  .word 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
                  .word 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
                  .word 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
                  .word 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
                  .word 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
                  .word 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
                  .word 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
                  .word 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
                  .word 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 

.text
.globl main 
main:

jal		zerar				# jump to zerar and save position to $ra
jal menu


li $v0,10
syscall


zerar:
la	$t0, jogos		#
lw	$t1, const1		# 
lw  $t2, const2	    # 

add		$s0, $zero, $zero		# $s0 = zero1 +zerot2



loopparazerar:

mul $t5,$t2,$s0
add $t3,$t0,$t5

lw	$t4, 0($t3)
add	$t4, $zero, $zero		#$t4 = zero1 +zerot2
sw	$t4, 0($t3)		 
 




addi $s0,$s0,1
bne	$s0, $t1, loopparazerar	# if$s0 != $t1 then target

jr		$ra					# jump to $ra


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
la $a0, msg15 # msg1 ser o objeto da escrita
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


sll $t0,$s0,3 #multiplicando o indice por 32
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
add 	$s0,$zero,$zero #zerando t0 para loop

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg10 # msg1 ser o objeto da escrita
syscall
		 

loop_para_mostrar_times:

addi	$t4, $s0, 1			# $t3 = s01 1 0


sll $t0,$s0,3 #multiplicando o indice por 32
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

add		$s1, $v0, $zero		# $s1 = v01 +zerot2

addi	$s1, $s1, -1			#igular ao indice 


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg11 # msg1 ser o objeto da escrita
syscall

li $v0, 5 # codigo para passar texto atraves do console syscall
syscall


add		$s2, $v0, $zero		# $s1 = v01 +zerot2
addi	$s2, $s2, -1			#igular ao indice

beq	$s2, $s1, Times_iguais	# if $s2 !=s$t1Times_iguaistarget

move 	$a0, $s1		# $a0 =$s11
move 	$a1, $s2		# $a1 = $t1
j continua_1

Times_iguais:
li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg12 # msg1 ser o objeto da escrita
syscall
j escolha_dos_times

continua_1:

#time 1 em a0
#time 2 em a1

move 	 $s1,$a0		# $a0 =$s11
move 	 $s2,$a1		# $a1 = $t1

la		$t1, jogos
la		$t2, vitorias
la		$t3, derrotas
la 		$t7, times
lw 		$t4,const1	


#aumentando a quantidade de jogos do primeiro jogador

lw		$s6,const4		# 
mul $t0,$s6,$s1
add $t6,$t1,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t6)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw $t5, 0($t6)


#aumentando a quantidade de jogos do segundo jogador

lw	$s6,const4		# 
mul $t0,$s6,$s2
add $t6,$t1,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t6)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw $t5, 0($t6)

##AUMENTA VITORIAS CORRETO

#time 1


sll $t0,$s1,3 #multiplicando o indice por 32
add $t6,$t7,$t0 #somando a multiplicacao com o endereco


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

sll $t0,$s2,3 #multiplicando o indice por 32
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


## 





## COLOCAR NA LINHA DO JOGADOR 2



li $v0, 5 # codigo para passar texto atraves do console syscall
syscall
move $t6,$v0
addi $t6, $t6, -1			# $t6 = $61 1 0


#Ate aqui ok

lw	$s6,const4		# 
mul $t0,$s6,$t6
add $t7,$t2,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t7)




bne		$t6, $s1, Primeiro_Time_perdedor	# if $t6 !=s1t1 then target

j Segundo_time_perdedor

Primeiro_Time_perdedor:

lw	$s6,const4		# 

mul $t0,$s6,$s1


add $t7,$t3,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t7)


## COLOCAR NA LINHA DO JOGADOR 1 

la		$s5, resultadodejogos		#
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$s2,$s6
mul     $t1,$s1,$s7
add     $t0,$t0,$t1
add		$t0, $s5, $t0		# $t0 = s51 + 0t2
 

lw		$t5, 0($t0)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t0)


la		$s5, resultadodejogos		#
lw	    $s6, const9
lw      $s7, const4
mul     $t0,$s1,$s6
mul     $t1,$s2,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		# $t0 = s51 + 0t2



lw		$t5, 0($t0)
addi	$t5, $t5,-1			# $t5 = $51 1 0
sw 		$t5, 0($t0)



j continua_2

Segundo_time_perdedor:




lw	$s6,const4		# 

mul $t0,$s6,$s2


add $t7,$t3,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t7)


## COLOCAR NA LINHA DO JOGADOR 1 

la		$s5, resultadodejogos		#
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$s1,$s6
mul     $t1,$s2,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		# $t0 = s51 + 0t2

lw		$t5, 0($t0)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t0)


la		$s5, resultadodejogos		#
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$s2,$s6
mul     $t1,$s1,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		# $t0 = s51 + 0t2

lw		$t5, 0($t0)
addi	$t5, $t5,-1			# $t5 = $51 1 0
sw 		$t5, 0($t0)


continua_2:


j menu

P3:

passagem_de_times_alterar:

la		$t2, times 
lw		$t1, const	# $t1 = 2
add 	$s0,$zero,$zero #zerando t0 para loop

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg10 # msg1 ser o objeto da escrita
syscall
		 

loop_para_alterar_times:

addi	$t4, $s0, 1			# $t3 = s01 1 0


sll $t0,$s0,3 #multiplicando o indice por 32
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
bne	$s0, $t1, loop_para_alterar_times	# if$s0 != $t1 then target




li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg16 # msg1 ser o objeto da escrita
syscall

li $v0, 5 # codigo para passar texto atraves do console syscall
syscall

addi	$v0, $v0, -1			# $a1 = a11 -1 0


move 	$a1,$v0		# $t0  v01



jal		menu_2				# jump to menu_2 and save position to $ra

j menu





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

sll $t0,$s0,3 #multiplicando o indice por 32
add $t3,$t2,$t0 #somando a multiplicacao com o endereco
#TIMES
li		$v0,4		
la		$a0,0($t3) 		
syscall


lw	$s6, const4		# 
mul $t8,$s6,$s0



add $t3,$t4,$t8 #somando a multiplicacao com o endereco
#JOGOS

li		$v0,1		
lw		$t7,0($t3)
add     $a0,$t7,$zero
syscall





add $t3,$t5,$t8 #somando a multiplicacao com o endereco
#Vitorias

li		$v0,1		
lw		$t7,0($t3)
add     $a0,$t7,$zero
syscall



add $t3,$t6,$t8 #somando a multiplicacao com o endereco
#Derrotas

li		$v0,1		
lw		$t7,0($t3)
add     $a0,$t7,$zero
syscall



#texto de enter

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, enter # msg1 ser o objeto da escrita
syscall


addi $s0,$s0,1
bne	$s0, $t1, loop_para_mostrar_times_TABELA	# if$s0 != $t1 then target





j menu



menu_2:



li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg17 # msg1 ser o objeto da escrita
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg18 # msg1 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg19 # msg1 ser o objeto da escrita
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg20 # msg1 ser o objeto da escrita
syscall


li $v0, 5 # codigo para passar texto atraves do console syscall
syscall

add $t0,$v0,$zero


addi $t1, $t0, -1			# $t0 = $t1 + 0

beq $t1,$zero,P3_1


addi $t2, $t0, -2		# $t0 = $t1 + 0

beq $t2,$zero,P3_2


addi $t3, $t0, -3			# $t0 = $t1 + 0

beq $t3,$zero,P3_3


addi $t4, $t0, -4			# $t0 = $t1 + 0

beq $t4,$zero,P3_4

jr		$ra



P3_1:
# a1 time escolhido
la		$t1, times

#ANTIGO NOME 
li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg22 # msg1 ser o objeto da escrita
syscall

sll $t0,$a1,3 #multiplicando o indice por 32
add $t3,$t1,$t0 #somando a multiplicacao com o endereco

li		$v0,4		# $v0 8= 
la		$a0,0($t3) 		# $a0 0($t3)
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, enter # msg1 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg21 # msg1 ser o objeto da escrita
syscall

lw $a1, 0($t3)		# 


li		$v0,8 		# $v0 8= 
la		$a0,0($t3) 		# $a0 0($t3)
syscall

j menu

#NOVO NOME



P3_2:
# a1 time escolhido
la		$t1, resultadodejogos
la      $s7, times
lw		$t2, const9
lw		$t3, const36
lw		$t4, const4		
add		$s0, $zero, $zero		# $s0 = zero1 +zerot2





li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg23 # msg1 ser o objeto da escrita
syscall

mul $t0,$a1,$t3
add	$t7,$t1,$t0		#$t7 = $t1 + 0t2


loop_para_mostrar_jogos:

sll $t0,$s0,3 #multiplicando o indice por 32
add $t3,$s7,$t0 #somando a multiplicacao com o endereco

li		$v0,4		# $v0 8= 
la		$a0,0($t3) 		# $a0 0($t3)
syscall


lw $t6,0($t7)

beq	$t6, $zero, continua_loop	# if$t0 == $t1 then target

li		$v0,4 		
la    $a0,msg24
syscall

j continua_loop_P32

continua_loop:

li		$v0,4 		
la    $a0,msg25
syscall

continua_loop_P32:

add		$t7, $t7, $t4		# $t0 = $01 +t4t2
addi	$s0, $s0, 1		# $s0 = zero1 +zerot2
bne	$s0, $t2, loop_para_mostrar_jogos	# if$s0 != $t1 then target

li		$v0,4 		
la    $a0,msg26
syscall


li		$v0,5 		
syscall

addi	$t3, $v0, -1			# $t0 = v01 + 0

move 	$s3, $t3		# $s3 = $31

#a1 continua sendo o primeiro time

#s3 o segundo time
la		$s4,jogos		# 
la      $s1, derrotas
la		$s0, vitorias		# 
lw      $s2,constneg
la		$s5, resultadodejogos		#
lw	    $s6, const36
lw      $s7, const4



mul     $t0,$a1,$s6
mul     $t1,$s3,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0	
lw		$t5, 0($t0)
beq		$t5, $zero, Mudar_Para_1	# if 5 == $t1 then target

##Mudar para 0
##Mudar tabela de resultado 

add	$t5, $zero, $zero
sw	$t5, 0($t0)
mul     $t0,$s3,$s6
mul     $t1,$a1,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0	
lw		$t5, 0($t0)

beq		$t5, $s2, Segundo_Jogador_derrotado


Segundo_Jogador_derrotado:


#tabela de vitoriosos
mul $t0,$a1,$s7
add	$t0, $t0,$s0
lw  $t5, 0($t0)
add $t5,$zero,$zero
sw  $t5,0($t0)		# 



#tabela de derrortas

mul $t0,$s3,$s7
add	$t0,$t0,$s1
lw  $t5, 0($t0)
add $t5,$zero,$zero
sw  $t5,0($t0)


##mudando tabela de resultado
mul     $t0,$s3,$s6
mul     $t1,$a1,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0	
lw		$t5, 0($t0)
add	$t5, $zero, $zero
sw	$t5, 0($t0)



#e mudar tabela de jogos

mul     $t0,$s3,$s7
add     $t0,$t0,$s4
lw	$t5, 0($t0)
add	$t5, $zero, $zero
sw	$t5, 0($t0)


mul     $t0,$a1,$s7
add     $t0,$t0,$s4
lw	$t5, 0($t0)
add	$t5, $zero, $zero
sw	$t5, 0($t0)

j continua_3

Mudar_Para_1:

#S3 E A1

la		$s1,times		# 


sll $t0,$a1,3 #multiplicando o indice por 32
add $t0,$s1,$t0 #somando a multiplicacao com o endereco


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, 0($t0) # msg1 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas1 # msg1 ser o objeto da escrita
syscall

li $v0, 1 # codigo para passar texto atraves do console syscall
addi $a0, $a1, 1			# $a0 = at1 1 0
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas2 # msg1 ser o objeto da escrita
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, versus # msg1 ser o objeto da escrita
syscall


sll $t0,$s3,3 #multiplicando o indice por 32
add $t0,$s1,$t0 #somando a multiplicacao com o endereco


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, 0($t0) # msg1 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas1 # msg1 ser o objeto da escrita
syscall

li $v0, 1 # codigo para passar texto atraves do console syscall
addi $a0, $s3, 1			# $a0 = at1 1 0
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas2 # msg1 ser o objeto da escrita
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg13 # msg1 ser o objeto da escrita
syscall


la		$t1, jogos
lw	    $s6,const4		# 

#aumentando jogos


mul $t0,$s6,$a1
add $t7,$t1,$t0 #somando a multiplicacao com o endereco


lw		$t5, 0($t7)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t7)


mul $t0,$s6,$s3
add $t7,$t1,$t0 #somando a multiplicacao com o endereco


lw		$t5, 0($t7)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t7)



li		$v0, 5 		# $v0  5= 
syscall
move $t6,$v0
addi $t6, $t6, -1

#(A1 E S3) E (T6 VITORIOSO)
lw  	$s6,const4
la		$t2, vitorias		# 

mul $t0,$s6,$t6
add $t7,$t2,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t7)

beq		$t6, $t1, Primeiro_Time_perdedor_P3	# if $t0 == $t1 then target

j Segundo_time_perdedor_P3

Primeiro_Time_perdedor_P3:
lw  	$s6,const4
la	$t3, derrotas		# 
mul $t0,$s6,$a1
add $t7,$t3,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t7)

la		$s5, resultadodejogos		#
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$a1,$s6
mul     $t1,$s3,$s7
add     $t0,$t0,$t1
add		$t0,$s5,$t0		# $t0 = s51 + 0t2
 

lw		$t5, 0($t0)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t0)


la		$s5, resultadodejogos		#
lw	    $s6, const9
lw      $s7, const4
mul     $t0,$s3,$s6
mul     $t1,$a1,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		# $t0 = s51 + 0t2



lw		$t5, 0($t0)
addi	$t5, $t5,-1			# $t5 = $51 1 0
sw 		$t5, 0($t0)

j continua_3

Segundo_time_perdedor_P3:
lw  	$s6,const4
la	$t3, derrotas		# 
mul $t0,$s6,$s3
add $t7,$t3,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t7)



la		$s5, resultadodejogos		#
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$s3,$s6
mul     $t1,$a1,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		# $t0 = s51 + 0t2

lw		$t5, 0($t0)
addi	$t5, $t5, 1			# $t5 = $51 1 0
sw 		$t5, 0($t0)


la		$s5, resultadodejogos		#
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$a1,$s6
mul     $t1,$s3,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		# $t0 = s51 + 0t2

lw		$t5, 0($t0)
addi	$t5, $t5,-1			# $t5 = $51 1 0
sw 		$t5, 0($t0)



continua_3:

j menu

P3_3:

#A1 PRIMEIRO TIME

la		$t1, resultadodejogos
la      $s7, times
lw		$t2, const9
lw		$t3, const36
lw		$t4, const4		
add		$s0, $zero, $zero		# $s0 = zero1 +zerot2

lw      $s1,constneg
lw      $s2,const1



li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg23 # msg1 ser o objeto da escrita
syscall

mul $t0,$a1,$t3
add	$t7,$t1,$t0		#$t7 = $t1 + 0t2


loop_para_mostrar_jogos_P3:

sll $t0,$s0,3 #multiplicando o indice por 32
add $t3,$s7,$t0 #somando a multiplicacao com o endereco

#printa o nome




lw $t6,0($t7)

#se t6 = -1 vai para continua_loop_P3
beq	$t6, $s1, continua_loop_P3_negativo	# if$t0 == $t1 then target
beq $t6, $s2, continua_loop_P3_positivo




j continua_loop_P32_P3
continua_loop_P3_positivo:
li		$v0,4		# $v0 8= 
la		$a0,0($t3) 		# $a0 0($t3)
syscall

li		$v0,4		# $v0 8= 
la		$a0,aspas1 		# $a0 0($t3)
syscall


li		$v0,1		# $v0 8= 
move		$a0,$s0 		# $a0 0($t3)
syscall


li		$v0,4		# $v0 8= 
la		$a0,aspas2 		# $a0 0($t3)
syscall


li		$v0,4 		
la    $a0,msg28
syscall


j continua_loop_P32_P3
continua_loop_P3_negativo:
li		$v0,4		# $v0 8= 
la		$a0,0($t3) 		# $a0 0($t3)
syscall

li		$v0,4		# $v0 8= 
la		$a0,aspas1 		# $a0 0($t3)
syscall


li		$v0,1		# $v0 8= 
move		$a0,$s0 		# $a0 0($t3)
syscall


li		$v0,4		# $v0 8= 
la		$a0,aspas2 		# $a0 0($t3)
syscall

li		$v0,4 		
la    $a0,msg27
syscall

continua_loop_P32_P3:

add		$t7, $t7, $t4		# $t0 = $01 +t4t2
addi	$s0, $s0, 1		# $s0 = zero1 +zerot2
bne	$s0, $t2, loop_para_mostrar_jogos_P3	# if$s0 != $t1 then target

li		$v0,4 		
la    $a0,msg26
syscall

li		$v0,5 		
syscall
addi	$s3, $v0, -1			#s3 = v01 -1 0



j menu

P3_4:



j menu