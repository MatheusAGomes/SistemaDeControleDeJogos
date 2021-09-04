.data

msg1: .asciiz "\n 1 - para registrar times "
msg2: .asciiz "\n 2 - para registrar resultados "
msg3: .asciiz "\n 3 - editar times  "
msg4: .asciiz "\n 4 - para gerar resultados "
msg5: .asciiz "\n Escolha: "
msg6: .asciiz "\n O numero escolhido nao e uma escolha"
teste: .asciiz "\n Teste"
const : .word 10
jogos: .word  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
vitorias: .word  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
derrotas: .word  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0


.text
.globl main 
main:

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



li $v0,5
syscall


P1:


li $v0, 4 # codigo para passar texto atraves do console syscall
la $a0, teste # msg1 ser o objeto da escrita
syscall


li $v0,5
syscall


P2:

P3:

P4:
