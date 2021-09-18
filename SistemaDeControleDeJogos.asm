.data
TESTE: .asciiz "\n TESTE \n "
msg1: .asciiz "\n 1 - REGISTRAR TIMES "
msg2: .asciiz "\n 2 - REGISTRAR RESULTADOS "
msg3: .asciiz "\n 3 - EDITAR (TIMES/PARTIDAS/RESULTADOS)  "
msg4: .asciiz "\n 4 - GERAR RESULTADO DA FASE DE GRUPOS "
msg5: .asciiz "\n ESCOLHA: "
msg6: .asciiz "\n O numero escolhido nao e uma escolha"
msg7: .asciiz "\n ENTRE COM O TIME "
msg8: .asciiz " : "
msg9: .asciiz "\n SELECIONE O PRIMEIRO TIME(NUMERO DO TIME): "
msg11: .asciiz "\n SELECIONE O SEGUNDO TIME(NUMERO DO TIME): "
msg12: .asciiz "\n TIMES IGUAIS, ESCOLHA 2 TIMES DIFERENTES"
msg13: .asciiz "\n ESCOLHA O TIME VITORIOSO(NUMERO DO TIME): "
msg14: .asciiz "\n 5 - RESULTADOS "
msg15: .asciiz "\n 0 - SAIR "
msg16: .asciiz "\n ESCOLHA O TIME PARA FAZER A ALTERACAO (NUMERO DO TIME):  "
msg17: .asciiz "\n 1 - ALTERAR NOME DO TIME "
msg18: .asciiz "\n 2 - ALTERAR JOGO "
msg19: .asciiz "\n 3 - ALTERAR RESULTADO "
msg20: .asciiz "\n ESCOLHA: "
msg21: .asciiz "\n NOVO NOME: "
msg22: .asciiz "\n ANTIGO NOME: "
msg23: .asciiz "\n PARTIDAS DO TIME: \n "
msg24: .asciiz " JOGOU \n"
msg25: .asciiz " NAO JOGOU \n"
msg26: .asciiz " ESCOLHA UM TIME PARA ALTERAR A PARTIDA (NUMERO DO TIME):  "
msg27: .asciiz " PERDEU \n "
msg28: .asciiz " GANHOU \n "
msg29: .asciiz "\n APERTE ENTER TECLA PARA SAIR ! \n "
msg30: .asciiz "\n A QUANTIDADE DE JOGOS NAO FOI CONCLUIDA ! \n "
voltar: .asciiz "\n 4 - VOLTAR: "
ResultadodaPartida: .asciiz "\n RESULTADO DA PARTIDA: "
TIMENAOEXISTE: .asciiz "\n A OPCAO DE TIME ESCOLHIDA NAO \n "
Situacao: .asciiz " : \n "
JOGOJAJOGADO: .asciiz "\n JOGO JA JOGADO,ESCOLHA OUTROS TIMES OU EDITE O RESULTADO NO MENU \n"
TimesNaoRegistrados: .asciiz " \n OS TIMES DO CAMPEONATO NAO FORAM REGISTRADOS \n POR FAVOR ESCOLHA A PRIMEIRA OPCAO DO MENU PARA CRIACAO DOS TIMES \n"
SEMI: .asciiz " SEMI-FINAL \n "
CLASSIFICADO: .asciiz " QUARTAS-DE-FINAL \n "
NAOCLASSIFICADO: .asciiz " NAO CLASSIFICADO \n "
REBAIXADO: .asciiz " REBAIXADO \n "
CLASSIFICACAO: .asciiz "\n CLASSIFICACAO: "
NOME: .asciiz "\n NOME: "
Nvitorias: .asciiz "\n VITORIAS: "
Njogos: .asciiz "\n JOGOS: "
NdeDerrotas: .asciiz "\n DERROTAS: "
TRACADO: .asciiz "\n |-----------------------------| "
aspas1: .asciiz "( "
aspas2: .asciiz "  )"
enter: .asciiz "\n"
versus: .asciiz "\n X \n"
msg10: .asciiz "NUMERO DO TIME \t Time \n"
tab: .asciiz "\t  \t  "
RES: .asciiz "      RESULTADOS"
OPCAOINVALIDA: .asciiz "\n OPCAO INVALIDA \n"
TIMEINVALIDO: .asciiz "\n TIME INVALIDO \n"
loginDefaut: .asciiz "adm1"
senhaDefault: .word 12345
loginusuario: .space 5 #1*3
TextoLogin:.asciiz "\n Usuario:"
TEXTOSENHA:.asciiz "\n SENHA:"
ErroNoLogin:.asciiz "\n USUARIO OU SENHA INCORRETOS \n"
LoginEfetuado:.asciiz "\nLOGIN EFETUADO COM SUCESSO \n"
const : .word 10
const1 : .word 1
const2: .word 40
const4: .word 4
const8: .word 8
const9: .word 9
const36: .word 36
constneg: .word -1
times: .space 80 #10*8
jogos: .space 40 #10*4
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

jal	zerar				#zera a matriz de jogos
add		$v1, $zero, $zero		# limpando de lixo da flag 
jal		login				# pula para o login
jal menu # pula pro primeiro menu

#finaliza

li $v0,10
syscall


zerar:
la	$t0, jogos		
lw	$t1, const1		
lw  $t2, const2	    

add		$s0, $zero, $zero		



loopparazerar:
#pega o endereco de jogos
mul $t5,$t2,$s0
add $t3,$t0,$t5

#load no valor zera ele e store
lw	$t4, 0($t3)
add	$t4, $zero, $zero		
sw	$t4, 0($t3)		 
 


#adiciona 1 no indice

addi $s0,$s0,1
bne	$s0, $t1, loopparazerar	

#volta pra main
jr		$ra					



ERRO:
#printa mensagem de erro especifica

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, OPCAOINVALIDA # OPCAOINVALIDA ser o objeto da escrita
syscall

j menu


ERRO_2:
#printa mensagem de erro especifica
li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, OPCAOINVALIDA # OPCAOINVALIDA ser o objeto da escrita
syscall

j menu_2

ERRO_DE_ESCOLHA:
#printa mensagem de erro especifica
li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, TIMEINVALIDO # TIMEINVALIDO ser o objeto da escrita
syscall

jr		$ra					# jump to $ra

Erronomenu:
#printa mensagem de erro especifica
li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, TimesNaoRegistrados # TimesNaoRegistrados ser o objeto da escrita
syscall


menu:

#MENU 1 

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg1 # msg1 ser o objeto da escrita
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg2 # msg2 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg3 # msg3 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg4 # msg4 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg14 # msg14 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg15 # msg15 ser o objeto da escrita
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg5 # msg5 ser o objeto da escrita
syscall






li $v0, 5 # codigo para passar texto atraves do console syscall
syscall

#passando o valor da escolha para $t0
add $t0,$v0,$zero


#VALIDANDO PARA VALORES MENORES QUE 0

lw $t7,const1

slti  $t6,$t0,0

beq $t6,$t7,ERRO

#VALIDANDO PARA VALORES MAIORES QUE 5

slti  $t6,$t0,6

beq $t6,$zero,ERRO


# COMPARANDO O VALOR ESCOLHIDO COM TODAS AS OPCOES

addi $t1, $t0, -1			

beq $t1,$zero,P1


#VALIDANDO PARA VALOR  0

beq	$v1, $zero,Erronomenu 	# if$t0 == $t1 then target



addi $t2, $t0, -2		

beq $t2,$zero,P2


addi $t3, $t0, -3			

beq $t3,$zero,P3


addi $t4, $t0, -4			

beq $t4,$zero,P4


addi $t5, $t0, -5			

beq $t5,$zero,P5

jr		$ra					# jump to $ra

P1:
#ESCOLHA 1 DO MENU 1

passagem_de_times:
#ELEMENTOS QUE SERAM USADOS NO NO PROCEDIMENTO
la		$t2, times 
lw		$t1, const	
li		$a1, 	8	
add 	$s0,$zero,$zero #zerando t0 para loop
		 

loop_para_leitura_de_times:

addi	$t4, $s0, 1	#T4 = 0 + 1 INDICE DA MATRIZ


sll $t0,$s0,3 #multiplicando o indice por 32
add $t3,$t2,$t0 #somando a multiplicacao com o endereco


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg7 # msg7 ser o objeto da escrita
syscall

li $v0, 1 # codigo para passar texto atraves do console syscall
move 	$a0, $t4	
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg8 # msg8 ser o objeto da escrita
syscall


li		$v0,8 		# CODIGO SYSCALL PARA LEITURA
la		$a0,0($t3) 		# ENDERECO DE ESCRITA
syscall

#ADDICIONANDO 1 AO AUXILIAR DO LLOP
addi $s0,$s0,1
bne	$s0, $t1, loop_para_leitura_de_times	# if$s0 != $t1 then target

addi	$v1, $v1, 1		

j menu


P2:

passagem_de_times_mostrar:
#ELEMENTOS QUE SERAM USADOS NO NO PROCEDIMENTO

la		$t2, times 
lw		$t1, const	
add 	$s0,$zero,$zero #zerando t0 para loop

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg10 # msg10 ser o objeto da escrita
syscall
		 

loop_para_mostrar_times:
#INDICE DA MATRIZ
addi	$t4, $s0, 1			


sll $t0,$s0,3 #multiplicando o indice por 32
add $t3,$t2,$t0 #somando a multiplicacao com o endereco


li $v0, 1 # codigo para passar texto atraves do console syscall
move 	$a0, $t4		
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, tab # TAB ser o objeto da escrita
syscall

li		$v0,4		# codigo para passar texto atraves do console syscall
la		$a0,0($t3) 		# NOME DO TIME
syscall

addi $s0,$s0,1
bne	$s0, $t1, loop_para_mostrar_times	

escolha_dos_times:

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg9 # msg9 ser o objeto da escrita
syscall


li $v0, 5 # codigo para passar texto atraves do console syscall
syscall

add		$s1, $v0, $zero		# PASSANDO O VALOR ESCOLHIDO PARA S1

addi	$s1, $s1, -1			#IGUALANDO AOS VALORES DOS INDICES

#VERIFICANDO SE E MENOR QUE 0
slti $t6,$s1,0

bne	$zero,$t6,ERRO_NA_ESCOLHA	

#VERIFICANDO SE E MAIOR QUE 10
slti $t6,$s1,10

beq	$zero, $t6,ERRO_NA_ESCOLHA	

j escolha_dos_times_segundo

ERRO_NA_ESCOLHA:

jal		ERRO_DE_ESCOLHA

j	escolha_dos_times			# jump to target and save position to $ra



escolha_dos_times_segundo:


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg11 # msg11 ser o objeto da escrita
syscall

li $v0, 5 # codigo para passar texto atraves do console syscall
syscall







add		$s2, $v0, $zero		# PASSANDO A ESCOLHA PARA S2
addi	$s2, $s2, -1			#IGUALANDO AOS VALORES DO INDICE


#VERIFICANDO SE O VALOR E MENOR QUE 0

slti $t6,$s2,0

bne	$zero,$t6,ERRO_NA_ESCOLHA_2	

#VERIFICANDO SE O VALOR E MAIOR QUE 10
slti $t6,$s2,10

beq	$zero, $t6,ERRO_NA_ESCOLHA_2	

j verificatime

ERRO_NA_ESCOLHA_2:

jal		ERRO_DE_ESCOLHA

j	escolha_dos_times_segundo			
 #VERIFICANDO SE OS TIMES ESCOLHIDOS SAO OS MESMOS
verificatime:

beq	$s2, $s1, Times_iguais	

#PASSANDO ARGUMENTO
move 	$a0, $s1		
move 	$a1, $s2		



#VERIFICA SE OS DOIS TIMES JA JOGARAM

jal Verifica_se_ja_jogou

#SE SIM VOLTA PARA O INICIO DE P2
beq $v0,$zero,P2




j continua_1

Times_iguais:
li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg12 # msg12 ser o objeto da escrita
syscall
j escolha_dos_times






continua_1:

#time 1 em a0
#time 2 em a1

move 	 $s1,$a0		# $a0 =$s11
move 	 $s2,$a1		# $a1 = $t1
#VALORES PARA AJUDA NO PROCEDIMENTO
la		$t1, jogos
la		$t2, vitorias
la		$t3, derrotas
la 		$t7, times
lw 		$t4,const1	


#aumentando a quantidade de jogos do primeiro jogador

lw		$s6,const4		
mul $t0,$s6,$s1
add $t6,$t1,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t6)
addi	$t5, $t5, 1			
sw $t5, 0($t6)


#aumentando a quantidade de jogos do segundo jogador

lw	$s6,const4		
mul $t0,$s6,$s2
add $t6,$t1,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t6)
addi	$t5, $t5, 1			
sw $t5, 0($t6)


#PRINTANDO OS TIMES ESCOLHIDOS


sll $t0,$s1,3 #multiplicando o indice por 32
add $t6,$t7,$t0 #somando a multiplicacao com o endereco


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, 0($t6) 
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas1 # aspas1 ser o objeto da escrita
syscall

addi $t6, $s1, 1

li $v0, 1 # codigo para passar texto atraves do console syscall
move $a0,$t6 
syscall




li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas2 # aspas2 ser o objeto da escrita
syscall


# versus

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, versus # versus ser o objeto da escrita
syscall

#time 2

sll $t0,$s2,3 #multiplicando o indice por 32
add $t6,$t7,$t0 #somando a multiplicacao com o endereco


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, 0($t6) 
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas1 # aspas1 ser o objeto da escrita
syscall

addi $t6, $s2, 1

li $v0, 1 # codigo para passar texto atraves do console syscall
move $a0,$t6 # msg1 ser o objeto da escrita
syscall




li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas2 # aspas2 ser o objeto da escrita
syscall


escolha_time_errado:

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg13 # msg13 ser o objeto da escrita
syscall

#ESCOLHENDO O TIME VENCEDOR

li $v0, 5 # codigo para passar texto atraves do console syscall
syscall
move $t6,$v0
addi $t6, $t6, -1			

#VERIFICANDO SE O TIME VENCEDOR E UMA DAS DUAS POSSIBILIDADES

beq		$t6, $s1, continuaP2_1	
beq		$t6, $s2, continuaP2_1	

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, TIMENAOEXISTE # TIMENAOEXISTE ser o objeto da escrita
syscall

j escolha_time_errado
continuaP2_1:
#SOMANDO UMA VITORIA AO TIME VENCEDOR

lw	$s6,const4		
mul $t0,$s6,$t6
add $t7,$t2,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			
sw 		$t5, 0($t7)




bne		$t6, $s1, Primeiro_Time_perdedor	# if $t6 !=s1t1 then target

j Segundo_time_perdedor

Primeiro_Time_perdedor:
#colcoando derrota para o primeiro time
la	$t3, derrotas
lw	$s6,const4		 
mul $t0,$s6,$s1
add $t7,$t3,$t0 

lw		$t5, 0($t7)
addi	$t5, $t5, 1			
sw 		$t5, 0($t7)




## COLOCANDO NA TABELA DE RESULTADOS DE TIMES QUE O SEGUNDO TIME E O VENCEDOR

la		$s5, resultadodejogos		
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$s2,$s6
mul     $t1,$s1,$s7
add     $t0,$t0,$t1
add		$t0, $s5, $t0		
 

lw		$t5, 0($t0)
addi	$t5, $zero, 1			
sw 		$t5, 0($t0)

## COLOCANDO NA TABELA DE RESULTADOS DE TIMES QUE O PRIMEIRO TIME E O DERROTADO


la		$s5, resultadodejogos		
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$s1,$s6
mul     $t1,$s2,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		

lw		$t5, 0($t0)
addi	$t5, $zero,-1			
sw 		$t5, 0($t0)





j continua_2

Segundo_time_perdedor:


#COLOCANDO UMA DERROTA PARA O SEGUNDO TIME

lw	$s6,const4		
la	$t3, derrotas
mul $t0,$s6,$s2
add $t7,$t3,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			
sw 		$t5, 0($t7)


## COLOCANDO NA MATRIZ DE RESULTADOS QUE O PRIMEIRO JOGADOR E O VENCEDOR

la		$s5, resultadodejogos		
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$s1,$s6
mul     $t1,$s2,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		

lw		$t5, 0($t0)
addi	$t5, $zero, 1			
sw 		$t5, 0($t0)
## COLOCANDO NA MATRIZ DE RESULTADOS QUE O SEGUNDO JOGADOR E O DERROTADO


la		$s5, resultadodejogos		
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$s2,$s6
mul     $t1,$s1,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		

lw		$t5, 0($t0)
addi	$t5, $zero,-1			
sw 		$t5, 0($t0)


continua_2:





j menu

P3:
#EDICAO
passagem_de_times_alterar:

la		$t2, times 
lw		$t1, const	
add 	$s0,$zero,$zero 

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg10 # msg10 ser o objeto da escrita
syscall
		 

loop_para_alterar_times:
#MOSTRANDO OS INDECES E OS TIMES

addi	$t4, $s0, 1			


sll $t0,$s0,3 #multiplicando o indice por 32
add $t3,$t2,$t0 #somando a multiplicacao com o endereco


li $v0, 1 # codigo para passar texto atraves do console syscall
move 	$a0, $t4		 
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, tab # TAB ser o objeto da escrita
syscall

li		$v0,4		 
la		$a0,0($t3) 		
syscall

addi $s0,$s0,1
bne	$s0, $t1, loop_para_alterar_times	# if$s0 != $t1 then target


Primeira_escolha_em_P3:

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg16 # msg16 ser o objeto da escrita
syscall


li $v0, 5 # codigo para passar texto atraves do console syscall
syscall


addi	$v0, $v0, -1			# IGUALANDO A VALORES DE INDICE


move 	$a1,$v0		# MOVENDO PARA A1

#VERIFICANDO SE E MENOR 0
slti $t6,$a1,0

bne	$zero,$t6,ERRO_NA_ESCOLHA_3	
#VERIFICANDO SE E MAIOR QUE 10

slti $t6,$a1,10

beq	$zero, $t6,ERRO_NA_ESCOLHA_3	

jal		menu_2				

j menu

ERRO_NA_ESCOLHA_3:

jal		ERRO_DE_ESCOLHA

j	Primeira_escolha_em_P3			












# FUNCAO PARA PRINTAR CASO TENHA MENOS JOGOS DO QUE O NECESSARIO PARA MOSTRAR A TABELA FINAL

MENOS_JOGOS:


li		$v0, 4		 
la		$a0,msg30		
syscall



li		$v0, 4		
la		$a0,msg29		
syscall




li		$v0, 5		
syscall


j menu



P4:
#funcao 4
#DADOS NECESSARIOS PARA O PROCEDIMENTO
la		$s0, jogos		
lw      $s1,const4
lw      $s3,const9
add		$t1, $zero, $zero		
add		$t2, $zero, $zero		
addi		$t4, $zero, 1		


#LOOP PARA SOMAR TODOS OS JOGOS PARA VERIFICAR SE JA PODE SE MOSTRAR AS TABELAS DE RESULTADO
loop_de_soma:
mul     $t0,$s1,$t1 
add	    $t0,$t0,$s0	
lw		$t3, 0($t0)		
add		$t2, $t2, $t3		

addi	$t1, $t1, 1			
bne		$s3, $t1, loop_de_soma	

li		$v0, 1		
move	$a0,$t2		 
syscall



slti $t6,$t2,80
bne	$t6, $zero, MENOS_JOGOS	



li		$v0, 1		
move		$a0,$t2		 
syscall


#DADOS PARA PRINTAGEM DOS TIMES EM ORDEM DECRESCENTE

addi		$s0, $zero, 9		
la		    $s1, times		 
la		    $s2, vitorias		
lw          $s3,const4
lw          $t0,const
lw          $s4,const1

addi	    $t1, $zero, 0			
addi	    $t4, $zero, 1			

#PRINTS
li		$v0, 4		 
la		$a0,CLASSIFICACAO	 
syscall


li		$v0, 4		 
la		$a0,TRACADO		 
syscall


j Loop_mostra_classificacao
subS0:

#DIMINUI A GRADE DE PRINT
addi	$s0, $s0, -1		
add	$t1, $zero, $zero			


Loop_mostra_classificacao:


mul $t3,$t1,$s3
add	$t3,$t3,$s2		
lw	$t5, 0($t3)		

#SE O TIME TIVER O MESMO NUMERO QUE A GRADE DE PRINT ENTAO VAI PARA O MOSTRA TIME
beq	$t5, $s0, mostrar_time	

j nao_mostrar_time
mostrar_time:

li		$v0, 4		
la		$a0,tab		
syscall
#MOSTRA O NUMERO DE COLOCACAO
li		$v0, 1		 
move    $a0, $t4		
syscall


li		$v0, 4		
la		$a0,NOME		
syscall

sll $t7,$t1,3 #multiplicando o indice por 32
add $t7,$t7,$s1 #somando a multiplicacao com o endereco
li		$v0,4		 
la		$a0,0($t7) 		
syscall


li		$v0, 4		 
la		$a0,Nvitorias		
syscall


mul $t3,$t1,$s3
add	$t3,$t3,$s2
lw	$t5, 0($t3)

li		$v0, 1		 
move    $a0, $t5		
syscall

li		$v0, 4		
la		$a0,enter		
syscall
li		$v0, 4	
la		$a0,enter		
syscall

#CASO O INDICE T4 ESTEJA MENOR QUE 3 NO PRINT ESTE TIME ESTA CLASSIFICADO PARA SEMI FINAL
slti $t6,$t4,3
beq	$t6, $s4, SEMIFINAL	
#CASO O INDICE T4 ESTEJA MENOR QUE 7 NO PRINT ESTE TIME ESTA CLASSIFICADO PARA AS 4

slti $t6,$t4,7
beq	$t6, $s4, QUARTAS	
#CASO O INDICE T4 ESTEJA MENOR QUE 9 NO PRINT ESTE TIME ESTA DESCLASSIFICADO

slti $t6,$t4,9
beq	$t6, $s4, DES	


li		$v0, 4		
la		$a0,REBAIXADO		 
syscall



j terminar

SEMIFINAL:

li		$v0, 4		
la		$a0,SEMI		 
syscall

j terminar

QUARTAS:

li		$v0, 4		 
la		$a0,CLASSIFICADO		
syscall

j terminar


DES:

li		$v0, 4		
la		$a0,NAOCLASSIFICADO		
syscall

j terminar

terminar:

li		$v0, 4		 
la		$a0,TRACADO		 
syscall

addi	$t4, $t4, 1		
		


nao_mostrar_time:
#CASO O INDICE INTERNO PARA RODAR OS TIMES
addi	    $t1, $t1, 1			#   $t0 = zero1 + 0
bne		$t1, $t0, Loop_mostra_classificacao	# if $t0 !=s0t1 then target

#CASO O INDICE NAO SEJA IGUAL A GRADE SOMA O INDICE E CONTINUA
bne		$s0, $zero, subS0	

li		$v0, 4		
la		$a0,msg29		
syscall


li $v0, 5
syscall


P5:
#TABELA PARA MOSTRAR NOME, JOGOS, VITORIAS E DERROTAS

passagem_de_times_TABELA:

la		$t6, derrotas
la 		$t5, vitorias
la		$t4, jogos
la		$t2, times 
lw		$t1, const	
add 	$s0,$zero,$zero #zerando t0 para loop

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, RES # RES ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, TRACADO # TRACADO ser o objeto da escrita
syscall
		 

loop_para_mostrar_times_TABELA:
li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, enter # enter ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, NOME # NOME ser o objeto da escrita
syscall

sll $t0,$s0,3 #multiplicando o indice por 32
add $t3,$t2,$t0 #somando a multiplicacao com o endereco
#TIMES
li		$v0,4		
la		$a0,0($t3) 		
syscall


lw	$s6, const4		
mul $t8,$s6,$s0

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, Njogos # Njogos ser o objeto da escrita
syscall

add $t3,$t4,$t8 #somando a multiplicacao com o endereco
#JOGOS

li		$v0,1		
lw		$t7,0($t3)
add     $a0,$t7,$zero
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, Nvitorias # Nvitorias ser o objeto da escrita
syscall



add $t3,$t5,$t8 #somando a multiplicacao com o endereco
#Vitorias

li		$v0,1		
lw		$t7,0($t3)
add     $a0,$t7,$zero
syscall



li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, NdeDerrotas # NdeDerrotas ser o objeto da escrita
syscall

add $t3,$t6,$t8 #somando a multiplicacao com o endereco
#Derrotas

li		$v0,1		
lw		$t7,0($t3)
add     $a0,$t7,$zero
syscall



#texto de enter

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, enter # enter ser o objeto da escrita
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, TRACADO # TRACADO ser o objeto da escrita
syscall

addi $s0,$s0,1
bne	$s0, $t1, loop_para_mostrar_times_TABELA	# if$s0 != $t1 then target





j menu



menu_2:


#MENU DE EDICOES


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg17 # msg17 ser o objeto da escrita
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg18 # msg18 ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg19 # msg19 ser o objeto da escrita
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, voltar # voltar ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg20 # msg20 ser o objeto da escrita
syscall

li $v0, 5 # codigo para passar texto atraves do console syscall
syscall




add $t0,$v0,$zero




lw $t7,const1

slti  $t6,$t0,1

beq $t6,$t7,ERRO_2

slti  $t6,$t0,4

beq $t6,$zero,ERRO_2



addi $t1, $t0, -1			

beq $t1,$zero,P3_1


addi $t2, $t0, -2		

beq $t2,$zero,P3_2


addi $t3, $t0, -3			

beq $t3,$zero,P3_3


addi $t4, $t0, -4			

beq $t4,$zero,P3_4

jr		$ra



P3_1:
# A1 PRIMEIRO TIME ESCOLHIDO
#FUNCAO PARA ALTERAR NOME
la		$t1, times

#ANTIGO NOME 
li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg22 # msg22 ser o objeto da escrita
syscall

sll $t0,$a1,3 #multiplicando o indice por 32
add $t3,$t1,$t0 #somando a multiplicacao com o endereco

li		$v0,4		#SYSCALL OARA MOSTRAR NOME DO TIME
la		$a0,0($t3) 		# ENDERECO QUE MOSTRARA
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, enter # enter ser o objeto da escrita
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg21 # msg21 ser o objeto da escrita
syscall

lw $a1, 0($t3)		
#ARMAZENANDO NOVO NOME

li		$v0,8 		 
la		$a0,0($t3) 		
syscall

j menu




P3_2:
# A1 TIME ESCOLHIDO
la		$t1, resultadodejogos
la      $s7, times
lw		$t2, const9
lw		$t3, const36
lw		$t4, const4		
add		$s0, $zero, $zero		





li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg23 # msg23 ser o objeto da escrita
syscall

#ENDERECO DE RESULTADO DE JOGOS

mul $t0,$a1,$t3
add	$t7,$t1,$t0		


loop_para_mostrar_jogos:
#LOOP PARA MOSTRAR SE OS TIMES JOGARA OU NAO CONTRA A1(PRIMEIRO TIME)

sll $t0,$s0,3 #multiplicando o indice por 32
add $t3,$s7,$t0 #somando a multiplicacao com o endereco

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas1 # aspas1 ser o objeto da escrita
syscall


li		$v0,1		 
addi 	$a0, $s0, 1
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas2 # aspas2 ser o objeto da escrita
syscall


li		$v0,4		
la		$a0,0($t3) 		
syscall


lw $t6,0($t7)

beq	$t6, $zero, continua_loop	

li		$v0,4 		
la    $a0,msg24
syscall

j continua_loop_P32

continua_loop:

li		$v0,4 		
la    $a0,msg25
syscall

continua_loop_P32:

add		$t7, $t7, $t4		
addi	$s0, $s0, 1		
bne	$s0, $t2, loop_para_mostrar_jogos	


Segunda_escolha_em_P3:


#ESCOLHENDO O SEGUNDO TIME E DECREMENTANDO PARA IGUALAR AO INDICE
li		$v0,4 		
la    $a0,msg26
syscall
li		$v0,5 		
syscall
addi	$t3, $v0, -1			
move 	$s3, $t3		


#VERIFICANDO OS SE O TIME E POSSIVEL DE SER ESCOLHIDO

slti $t6,$s3,0

bne	$zero,$t6,ERRO_NA_ESCOLHA_4	


slti $t6,$s3,10

beq	$zero, $t6,ERRO_NA_ESCOLHA_4	


j continua_p3_1

ERRO_NA_ESCOLHA_4:

jal		ERRO_DE_ESCOLHA

j	Segunda_escolha_em_P3

continua_p3_1:

#VERIFICANDO SE OS DOIS TIMES ESCOLHIDOS SAO IGUAIS, CASO SIM IMPRIME MENSAGEM DE ERRO E RETORNA PARA O INICIO

beq	$s3, $a1, Times_iguais_P2	

j continua_p3_2

Times_iguais_P2:
li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg12 # msg12 ser o objeto da escrita
syscall
j P3_2

continua_p3_2:


#a1 continua sendo o primeiro time
#ENDERECOS E CONSTANTES USADAS NO RESTO

la		$s4,jogos		
la      $s1, derrotas
la		$s0, vitorias		
lw      $s2,constneg
la		$s5, resultadodejogos		
lw	    $s6, const36
lw      $s7, const4



mul     $t0,$a1,$s6
mul     $t1,$s3,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0	
lw		$t5, 0($t0)
#CASO T5 SEJA ZERO QUER DIZER QUE O JOGO AINDA NAO ACONTECEU SENDO ASSIM SER ENCAMINHADO PARA A INSCRICAO DE RESULTAOD
beq		$t5, $zero, Mudar_Para_1	# if 5 == $t1 then target

#COMO O JOGO JA OCORREU ZERANDO O JOGO


#ZERANDO O RESULTADO DA LINHA DE A1 E POSICAO DE S3

add	$t5, $zero, $zero
sw	$t5, 0($t0)

#PEGANDO O VALOR DO SEGUNDO TIME

mul     $t0,$s3,$s6
mul     $t1,$a1,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0	
lw		$t5, 0($t0)

#se o segundo = -1 Segundo jogador=

beq		$t5, $s2, Segundo_Jogador_derrotado


# s3 DIMINUIR UMA  , RETIRAR JOGO E zerar RESULTADO
# a1  DIMINUIR UMA  DERROTA, RETIRAR JOGO E zerar RESULTADO 

#PRIMEIRO TIME DERROTADO

#DIMINUINDO O VALOR EM DERROTAS DE A1

mul $t0,$a1,$s7
add	$t0,$t0,$s1
lw  $t5, 0($t0)
addi $t5,$t5,-1
sw  $t5,0($t0)		



#DIMINUINDO AS VITORIAS DE S3

mul $t0,$s3,$s7
add	$t0,$t0,$s0
lw  $t5, 0($t0)
addi $t5,$t5,-1
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
addi	$t5, $t5, -1
sw	$t5, 0($t0)


mul     $t0,$a1,$s7
add     $t0,$t0,$s4
lw	$t5, 0($t0)
add	$t5, $t5, -1
sw	$t5, 0($t0)






j continua_3
Segundo_Jogador_derrotado:



# A1 DIMINUIR UMA VITORIA, RETIRAR JOGO E zerar RESULTADO
# s3 DIMINUIR UMA derrota, RETIRAR JOGO E zerar RESULTADO 

#tabela de vitoriosos
mul $t0,$a1,$s7
add	$t0,$t0,$s0
lw  $t5, 0($t0)
addi $t5,$t5,-1
sw  $t5,0($t0)		



#tabela de derrortas

mul $t0,$s3,$s7
add	$t0,$t0,$s1
lw  $t5, 0($t0)
addi $t5,$t5,-1
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
addi	$t5, $t5, -1
sw	$t5, 0($t0)


mul     $t0,$a1,$s7
add     $t0,$t0,$s4
lw	$t5, 0($t0)
add	$t5, $t5, -1
sw	$t5, 0($t0)

j continua_3

Mudar_Para_1:

#CASO O JOGO NAO TENHA ACONTECIDO, DENTRO DE EDICOES VOCE TEM A POSSIBILIDADE DE GERAR O RESULTADO NO PROPRIO MENU DE EDICAO
#SEU FUNCIONAMENTO É EQUIVALENTE AO DE DE P1 

la		$s1,times		


sll $t0,$a1,3 #multiplicando o indice por 32
add $t0,$s1,$t0 #somando a multiplicacao com o endereco


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, 0($t0) 
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas1 # aspas1 ser o objeto da escrita
syscall

li $v0, 1 # codigo para passar texto atraves do console syscall
addi $a0, $a1, 1			
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas2 # aspas2 ser o objeto da escrita
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, versus # versus ser o objeto da escrita
syscall


sll $t0,$s3,3 #multiplicando o indice por 32
add $t0,$s1,$t0 #somando a multiplicacao com o endereco


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, 0($t0) 
syscall

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas1 # aspas1 ser o objeto da escrita
syscall

li $v0, 1 # codigo para passar texto atraves do console syscall
addi $a0, $s3, 1			
syscall


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, aspas2 # aspas2 ser o objeto da escrita
syscall






la		$t1, jogos
lw	    $s6,const4		

#aumentando jogos


mul $t0,$s6,$a1
add $t7,$t1,$t0 #somando a multiplicacao com o endereco


lw		$t5, 0($t7)
addi	$t5, $t5, 1			
sw 		$t5, 0($t7)


mul $t0,$s6,$s3
add $t7,$t1,$t0 #somando a multiplicacao com o endereco


lw		$t5, 0($t7)
addi	$t5, $t5, 1			
sw 		$t5, 0($t7)
escolha_time_errado_2:


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg13 # msg13 ser o objeto da escrita
syscall

li		$v0, 5 		
syscall
move $t6,$v0
addi $t6, $t6, -1



beq		$t6, $a1, continuaP3_1	# if $t6 ==s1t1 then target
beq		$t6, $s3, continuaP3_1	# if $t6 ==s1t1 then target

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, TIMENAOEXISTE # TIMENAOEXISTE ser o objeto da escrita
syscall

j escolha_time_errado_2
continuaP3_1:

#(A1 E S3) E (T6 VITORIOSO)
lw  	$s6,const4
la		$t2, vitorias		

mul $t0,$s6,$t6
add $t7,$t2,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			
sw 		$t5, 0($t7)

beq		$t6, $s3, Primeiro_Time_perdedor_P3	

j Segundo_time_perdedor_P3

Primeiro_Time_perdedor_P3:
lw  	$s6,const4
la	    $t3, derrotas		 
mul $t0,$s6,$a1
add $t7,$t3,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			
sw 		$t5, 0($t7)

la		$s5, resultadodejogos		
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$s3,$s6
mul     $t1,$a1,$s7
add     $t0,$t0,$t1
add		$t0,$s5,$t0		
 

lw		$t5, 0($t0)
addi	$t5, $zero, 1			
sw 		$t5, 0($t0)


la		$s5, resultadodejogos		
lw	    $s6, const9
lw      $s7, const4
mul     $t0,$a1,$s6
mul     $t1,$s3,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		



lw		$t5, 0($t0)
addi	$t5, $zero,-1			
sw 		$t5, 0($t0)

j continua_3

Segundo_time_perdedor_P3:
lw  $s6,const4
la	$t3, derrotas		
mul $t0,$s6,$s3
add $t7,$t3,$t0 #somando a multiplicacao com o endereco

lw		$t5, 0($t7)
addi	$t5, $t5, 1			
sw 		$t5, 0($t7)



la		$s5, resultadodejogos		
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$a1,$s6
mul     $t1,$s3,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		

lw		$t5, 0($t0)
addi	$t5, $zero, 1			
sw 		$t5, 0($t0)


la		$s5, resultadodejogos		
lw	    $s6, const36
lw      $s7, const4
mul     $t0,$s3,$s6
mul     $t1,$a1,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		

lw		$t5, 0($t0)
addi	$t5, $zero,-1			
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
add		$s0, $zero, $zero		

lw      $s1,constneg
lw      $s2,const1



li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg23 # msg23 ser o objeto da escrita
syscall

mul $t0,$a1,$t3
add	$t7,$t1,$t0		


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


li		$v0,4		 
la		$a0,aspas1 		
syscall


li		$v0,1		 
addi		$a0,$s0,1 		
syscall


li		$v0,4		
la		$a0,aspas2 		
syscall

li		$v0,4		
la		$a0,0($t3) 		
syscall


li		$v0,4		 
la		$a0,ResultadodaPartida 		
syscall

li		$v0,4 		
la    $a0,msg28
syscall


j continua_loop_P32_P3
continua_loop_P3_negativo:
li		$v0,4		 
la		$a0,0($t3) 		
syscall

li		$v0,4		 
la		$a0,aspas1 		
syscall


li		$v0,1		 
addi		$a0,$s0,1 		
syscall


li		$v0,4		
la		$a0,aspas2 		
syscall

li		$v0,4 		
la    $a0,msg27
syscall

continua_loop_P32_P3:

add		$t7, $t7, $t4		
addi	$s0, $s0, 1		
bne	$s0, $t2, loop_para_mostrar_jogos_P3	

li		$v0,4 		
la    $a0,msg26
syscall

li		$v0,5 		
syscall
addi	$s3, $v0, -1			

##time 1 em A1
##time 2 em S3

#vendo na tabela do 2 time quem ganhou

la		$s5, resultadodejogos		
lw	    $s6, const36
lw      $s7, const4
lw      $s1,const1
mul     $t0,$s3,$s6
mul     $t1,$a1,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0		

#se segundo time venceu vai para primeiro time vencedor
lw		$t5, 0($t0)
beq		$t5, $s1, Primeiro_Time_vencedor	


# se tornara o A1 Derrotado E S3 O Vencedor

addi	$t5,$zero,1		
sw		$t5, 0($t0)	

#primeiro jogador
mul     $t0,$a1,$s6
mul     $t1,$s3,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0

addi	$t5,$zero,-1			
sw		$t5, 0($t0)

la		$t1, vitorias		


#alterando jogador 1
mul     $t0,$a1,$s7
add     $t0,$t0,$t1
#diminui uma vitoria
lw		$t5, 0($t0)
addi	$t5,$t5,-1
sw		$t5, 0($t0)


la      $s4, derrotas

mul     $t0,$a1,$s7
add     $t7,$t0,$s4
#aumentou uma derrota
lw		$t5, 0($t7)
addi	$t5,$t5,1
sw		$t5, 0($t7)

#alterando jogador 2
la		$t1, vitorias
mul     $t0,$s3,$s7
add     $t0,$t0,$t1
#aumentou uma vitoria
lw		$t5, 0($t0)
addi	$t5,$t5,1
sw		$t5, 0($t0)

la      $s4, derrotas

mul     $t0,$s3,$s7
add     $t7,$t0,$s4

lw		$t5, 0($t7)
addi	$t5,$t5,-1
sw		$t5, 0($t7)



j fim_da_alteracao

#A1 SE TORNARA O vencedor E S3 O derrotado
Primeiro_Time_vencedor:



addi	$t5,$zero,-1			
sw		$t5, 0($t0)		

mul     $t0,$a1,$s6
mul     $t1,$s3,$s7
add     $t0,$t0,$t1 
add		$t0, $s5, $t0

addi	$t5,$zero,1			
sw		$t5, 0($t0)	


la		$t1, vitorias		
la      $t2, derrotas

#alterando jogador 1
mul     $t0,$a1,$s7
add     $t0,$t0,$t1

lw		$t5, 0($t0)
addi	$t5,$t5,1
sw		$t5, 0($t0)

la      $s4, derrotas


mul     $t0,$a1,$s7
add     $t7,$t0,$s4

lw		$t5, 0($t7)
addi	$t5,$t5,-1
sw		$t5, 0($t7)

#alterando jogador 2

mul     $t0,$s3,$s7
add     $t0,$t0,$t1

lw		$t5, 0($t0)
addi	$t5,$t5,-1
sw		$t5, 0($t0)

la      $s4, derrotas

mul     $t0,$s3,$7
add     $t7,$t0,$s4

lw		$t5, 0($t7)
addi	$t5,$t5, 1
sw		$t5, 0($t7)


fim_da_alteracao:


j menu

P3_4:

j menu

#VERIFICA SE JA JOGOU PERMITE A VERIFICACAO SE 2 TIMES JA JOGARAM
Verifica_se_ja_jogou:


#a0 time 1 
#a1 time 2





la		$t1, resultadodejogos
lw		$t2, const4
lw		$t3, const36

#ENTRANDO NO ENDERECO DE RESULTADO DE NA LINHA DE A1 E POSICAO DE A0

mul     $t0,$a1,$t3
mul     $t4,$a0,$t2
add     $t0,$t0,$t4 
add		$t0, $t1, $t0

lw		$t5, 0($t0)

#CASO O T5 SEJA 0 QUER DIZER QUE AINDA NAO JOGARAM ENTAO SE NAO SAO IGUAIS VAI PARA JAJOGOU

bne		$zero, $t5, Jajogou	# if $zero == $t1 then target


addi 	$v0,$zero,1	

jr		$ra					# jump to $ra

Jajogou:

li $v0,4
la $a0, JOGOJAJOGADO		
syscall


move 	$v0, $zero		# $t5 = zero

jr		$ra					# jump to $ra
















login:
#SISTEMA DE LOGIN

li $v0,4
la $a0, TextoLogin		
syscall

#login e senha objetivo
la $t1,loginDefaut
la $t3, loginusuario	 

lw $t6,senhaDefault
li $a1,5

add $t4,$t3,$zero #somando a multiplicacao com o endereco
#ARMZENANDO A SENHA A SER TESTADA
li		$v0,8 		#SYSCALL DE LEITURA DE TIME 
la		$a0,0($t4) 		#ENDERECO DE ARMAZENAGEM
syscall

li $v0,4
la $a0, TEXTOSENHA		
syscall



li		$v0,5 		
syscall


add		$t5, $zero, $v0		#PASSANDO V0 PARA T5 SENHA A SER COMPARADA



la $s2,loginDefaut
la $s3, loginusuario
li		$s4,6 		 



cmploop:
#COMPARANDO BYTE A BYTE O USUARIO, CASO NAO SEJA IGUAL PASSA PARA cmpne
    lb      $t2,($s2)                  
    lb      $t3,($s3)                  
    bne     $t2,$t3,cmpne               
    #SE CHEGAR EM T2 EM 0 QUER DIZER QUE JA ACABOU A STRING E TODOS SAO IGUAIS
    beq     $t2,$zero,cmpeq            
#ADICIONA 1 EM CADA ENDERECO E CONTINUA O LOOP
    addi    $s2,$s2,1                   
    addi    $s3,$s3,1                   
    j       cmploop

cmpne:
#CASO NAO SEJA IGUAL ZERA O VALOR DAS STRINGS DE COMPARACAO E RETORNA A LOGIN
    li      $v0,4   
    la      $a0,ErroNoLogin
    syscall
    addi	$s0,$zero, 0			
    la $s3, loginusuario
    target:
     lb      $t2,($s2)
     addi	$t2,$zero, 0			


    addi	$s0,$s0,1			

    bne	$s0, $s4, target	
    

    j       login


cmpeq:

    # CASO A COMPARACAO  SEJA IGUAL, COMPARA OS VALORES DE T5 QUE É O VALOR QUE TESTADO PELO USUARIO COM T6 QUE É O VALOR DEFAULT DA SENHA CASO
    # NAO SEJA IGUAL SAI CASO SEJA VOLTA A MAIN

    bne $t6,$t5,cmpne
    li      $v0,4
    la      $a0,LoginEfetuado
    syscall
    jr		$ra					# jump to $ra