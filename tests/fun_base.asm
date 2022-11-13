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
	addi $sp, $sp, -36
	li $t0, 42
	sw $t0, -8($fp)
	lw $t0, -8($fp)
	sw $t0, -36($fp)
	b __lab_3
__lab_4:
	li $t0, 50
	sw $t0, -24($fp)
	lw $t0, -36($fp)
	lw $t1, -24($fp)
	slt $t0, $t0, $t1
	sw $t0, -20($fp)
	lw $t0, -20($fp)
	bnez $t0, __lab_5
	lw $t0, -36($fp)
	sw $t0, 0($sp)
	subi $sp, $sp, 4
	li $t0, 1
	sw $t0, -16($fp)
	lw $t0, -16($fp)
	sw $t0, 0($sp)
	subi $sp, $sp, 4
	jal add
	sw $v0, -36($fp)
	b __lab_6
__lab_5:
	lw $t0, -36($fp)
	sw $t0, 0($sp)
	subi $sp, $sp, 4
	li $t0, 2
	sw $t0, -12($fp)
	lw $t0, -12($fp)
	sw $t0, 0($sp)
	subi $sp, $sp, 4
	jal add
	sw $v0, -36($fp)
__lab_6:
	lw $t0, -36($fp)
	move $a0, $t0
	li $v0, 11
	syscall
__lab_3:
	li $t0, 55
	sw $t0, -32($fp)
	lw $t0, -36($fp)
	lw $t1, -32($fp)
	slt $t0, $t0, $t1
	sw $t0, -28($fp)
	lw $t0, -28($fp)
	bnez $t0, __lab_4
	li $t0, 0
	move $sp, $fp
	lw $ra, -4($fp)
	jr $ra
add:
	sw $fp, 0($sp)
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	subi $sp, $sp, 4
	addi $fp, $sp, 8
	addi $sp, $sp, -20
	lw $t0, 4($fp)
	sw $t0, -16($fp)
	lw $t0, 8($fp)
	sw $t0, -12($fp)
	lw $t0, -16($fp)
	lw $t1, -12($fp)
	add $t0, $t0, $t1
	sw $t0, -8($fp)
	lw $t1, -8($fp)
	move $v0, $t1
	move $sp, $fp
	lw $ra, -4($fp)
	lw $fp, 0($fp)
	jr $ra
	li $t0, 0
	move $sp, $fp
	lw $ra, -4($fp)
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
