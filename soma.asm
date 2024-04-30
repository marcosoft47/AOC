.text
.globl main

main:
	addiu $a0, $zero, 4
	jal soma
	
	addu $a0, $zero, $v0
	addiu $v0, $zero, 1
	syscall
	
end:
	addiu $v0, $zero, 10
	syscall

soma:
	bne $a0, $zero, soma.corpo
	addiu $v0, $zero, 0
	jr $ra

soma.corpo:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	
	addu $s0, $zero, $a0
	addi $a0, $a0, -1
	jal soma
	add $v0, $v0, $s0
	
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	
	jr $ra
