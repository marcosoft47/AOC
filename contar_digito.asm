.data
	quebra: .asciiz "\n"
.text
.globl main

main:
	li $v0, 5
	syscall
	beq $v0, $zero, end
	move $a0, $v0
	
	li $v0, 5
	syscall
	move $a1, $v0
	
	jal contar
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	la $a0, quebra
	li $v0, 4
	syscall
	
	j main
end:
	li $v0, 10
	syscall

contar:
	beq $a0, $zero, contar_fim # Aparentemente beq não faz branch com $ra
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	div $a0, $a0, 10
	mfhi $t0
	seq $s0, $t0, $a1
	jal contar
	
	add $v0, $v0, $s0
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	jr $ra

contar_fim:
	li $v0, 0
	jr $ra
