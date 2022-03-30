.data

.text

main:
	li $a0, 5  #argumento 
	li $t0, 1  #auxiliar
	li $v0, 1  #fatorial
	
	jal fatorial
	
	move $t0, $v0
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 10
	syscall

fatorial:
		
	addi $sp, $sp, -12
	sw $a0, 12($sp)
	sw $s0, 8($sp)
	sw $ra, 4($sp)
	
	beq $a0, $t0, saida
	slti $s0, $a0, 1         #se (n<1)
	bne $s0, $zero, saida    
	
	addi $a0, $a0, -1
	jal fatorial
	
	lw $a0, 12($sp)
	lw $s0, 8($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 12
	
	mul $v0, $v0, $a0
saida:
	jr $ra	
