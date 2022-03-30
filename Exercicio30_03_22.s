.data
	msg: .asciiz "O resultado é "
	nl: .asciiz "\n\n"

.text

main: 
	li $a0, 2
	li $a1, 5
	li $a2, 3	
	li $a3, 4
	
	jal folha            #$ra = endereço linha 11
	
	move $t0, $v0        #registrador auxiliar(salva v0para não ser modificado pelo syscall)
	
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall
	
	li $v0, 10
	syscall
	
folha:
	addi $sp, $sp, -12   #vao ser ocupados 3 espaçoes de memoria(12)
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $ra, 4($sp)
	

	add $s0, $a0, $a1
	add $s1, $a2, $a3
	sub $v0, $s0, $s1
	
	lw $s0, 12($sp)
	lw $s1, 8($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 12
	
	jr $ra	             #volta pra $ra  	
