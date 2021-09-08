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
msg10: .asciiz "Numero do time \t Time \n"
tab: .asciiz "\t  \t  "



teste: .asciiz "\n Teste"


const : .word 10
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
li		$a1, 	8	# $a1 = 8
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

li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, msg9 # msg1 ser o objeto da escrita
syscall





P3:

P4:
