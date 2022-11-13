.text
	beqz $a0, init_end
	lw $a0, 0($a1)
	jal atoi
init_end:
	move $a0, $v0
	jal main
	li $v0, 10
	syscall
main:
	sw $fp, 0($sp)
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	subi $sp, $sp, 4
	addi $fp, $sp, 8
	addi $sp, $sp, -20
	li $t0, 44
	sw $t0, -8($fp)
	lw $t0, -8($fp)
	sw $t0, 0($sp)
	subi $sp, $sp, 4
	li $t0, 43
	sw $t0, -12($fp)
	lw $t0, -12($fp)
	sw $t0, 0($sp)
	subi $sp, $sp, 4
	li $t0, 42
	sw $t0, -16($fp)
	lw $t0, -16($fp)
	sw $t0, 0($sp)
	subi $sp, $sp, 4
	jal ordre
	addi $sp, $sp, 12
	li $t0, 0
	sw $t0, -20($fp)
	lw $t1, -20($fp)
	move $v0, $t1
	move $sp, $fp
	lw $ra, -4($fp)
	lw $fp, 0($fp)
	jr $ra
	li $v0, 0
	move $sp, $fp
	lw $ra, -4($fp)
	lw $fp, 0($fp)
	jr $ra
ordre:
	sw $fp, 0($sp)
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	subi $sp, $sp, 4
	addi $fp, $sp, 8
	addi $sp, $sp, -28
	lw $t0, 4($fp)
	sw $t0, -8($fp)
	lw $t0, -8($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	lw $t0, 8($fp)
	sw $t0, -12($fp)
	lw $t0, -12($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	lw $t0, 12($fp)
	sw $t0, -16($fp)
	lw $t0, -16($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	li $t0, 0
	sw $t0, -20($fp)
	lw $t1, -20($fp)
	move $v0, $t1
	move $sp, $fp
	lw $ra, -4($fp)
	lw $fp, 0($fp)
	jr $ra
	li $v0, 0
	move $sp, $fp
	lw $ra, -4($fp)
	lw $fp, 0($fp)
	jr $ra
#built-in atoi
atoi:
	li $v0, 0
atoi_loop:
	lbu $t0, 0($a0)
	beqz $t0, atoi_end
	addi $t0, $t0, -48
	bltz $t0, atoi_error
	bge $t0, 10, atoi_error
	mul $v0, $v0, 10
	add $v0, $v0, $t0
	addi $a0, $a0, 1
	b atoi_loop
atoi_error:
	li $v0, 10
	syscall
atoi_end:
	jr $ra
.data
