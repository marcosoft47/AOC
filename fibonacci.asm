.text
.globl main

main:
	li $v0, 5
	syscall
	move $a0, $v0
	
	jal fib
	
	move $a0, $v0
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall

fib:
	beqz, $a0, fib.fim
	ble, $a0, 1, fib.umOuMenor
	# $a0 = n e n > 1
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	#fib n = fib (n-1) + fib (n-2)
	addi $a0, $a0, -1
	jal fib # fib (n-1))
	sw $v0, 8($sp) # salva fib (n-1)
	lw $a0, 4($sp) # pega o n original
	addi $a0, $a0, -2
	jal fib # fib (n-2)
	
	lw $ra, 0($sp)
	lw $t0, 8($sp) # pega fib (n-1) salvo anteriormente
	add $v0, $v0, $t0 # fib (n-2) + fib (n-1)
	addi $sp, $sp, 12
	jr $ra
fib.umOuMenor:
	move $v0, $a0
	jr $ra
fib.fim:
	li $v0, 1
	jr $ra
