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
	addi $sp, $sp, -44
	li $t0, 0
	sw $t0, -8($fp)
	lw $t0, -8($fp)
	sw $t0, -44($fp)
	li $t0, 10
	sw $t0, -12($fp)
	lw $t0, -12($fp)
	la $t1, retour
	sw $t0, 0($t1)
	li $t0, 32
	sw $t0, -16($fp)
	lw $t0, -16($fp)
	la $t1, espace
	sw $t0, 0($t1)
	b __lab_7
__lab_8:
	lw $t0, -44($fp)
	sw $t0, 0($sp)
	subi $sp, $sp, 4
	lw $t0, 4($fp)
	sw $t0, -20($fp)
	lw $t0, -20($fp)
	sw $t0, 0($sp)
	subi $sp, $sp, 4
	jal ligne
	la $t0, retour
	lw $t0, 0($t0)
	sw $t0, -24($fp)
	lw $t0, -24($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	lw $t0, -44($fp)
	addi $t0, $t0, 1
	sw $t0, -28($fp)
	lw $t0, -28($fp)
	sw $t0, -44($fp)
__lab_7:
	lw $t0, 4($fp)
	sw $t0, -40($fp)
	lw $t0, -40($fp)
	addi $t0, $t0, 1
	sw $t0, -36($fp)
	lw $t0, -44($fp)
	lw $t1, -36($fp)
	slt $t0, $t0, $t1
	sw $t0, -32($fp)
	lw $t0, -32($fp)
	bnez $t0, __lab_8
	li $t0, 0
	move $sp, $fp
	lw $ra, -4($fp)
	jr $ra
ligne:
	sw $fp, 0($sp)
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	subi $sp, $sp, 4
	addi $fp, $sp, 8
	addi $sp, $sp, -80
	li $t0, 0
	sw $t0, -8($fp)
	lw $t0, -8($fp)
	sw $t0, -76($fp)
	b __lab_2
__lab_3:
	lw $t0, 4($fp)
	sw $t0, -52($fp)
	lw $t0, 4($fp)
	sw $t0, -48($fp)
	lw $t0, -52($fp)
	lw $t1, -48($fp)
	mul $t0, $t0, $t1
	sw $t0, -44($fp)
	lw $t0, -76($fp)
	lw $t1, -76($fp)
	mul $t0, $t0, $t1
	sw $t0, -40($fp)
	lw $t0, -44($fp)
	lw $t1, -40($fp)
	add $t0, $t0, $t1
	sw $t0, -36($fp)
	lw $t0, 8($fp)
	sw $t0, -32($fp)
	lw $t0, 8($fp)
	sw $t0, -28($fp)
	lw $t0, -32($fp)
	lw $t1, -28($fp)
	mul $t0, $t0, $t1
	sw $t0, -24($fp)
	lw $t0, -36($fp)
	lw $t1, -24($fp)
	slt $t0, $t0, $t1
	sw $t0, -20($fp)
	lw $t0, -20($fp)
	bnez $t0, __lab_4
	li $t0, 35
	sw $t0, -16($fp)
	lw $t0, -16($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	b __lab_5
__lab_4:
	li $t0, 46
	sw $t0, -12($fp)
	lw $t0, -12($fp)
	move $a0, $t0
	li $v0, 11
	syscall
__lab_5:
	la $t0, espace
	lw $t0, 0($t0)
	sw $t0, -56($fp)
	lw $t0, -56($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	lw $t0, -76($fp)
	addi $t0, $t0, 1
	sw $t0, -60($fp)
	lw $t0, -60($fp)
	sw $t0, -76($fp)
__lab_2:
	lw $t0, 8($fp)
	sw $t0, -72($fp)
	lw $t0, -72($fp)
	addi $t0, $t0, 1
	sw $t0, -68($fp)
	lw $t0, -76($fp)
	lw $t1, -68($fp)
	slt $t0, $t0, $t1
	sw $t0, -64($fp)
	lw $t0, -64($fp)
	bnez $t0, __lab_3
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
retour:
	.word 0
espace:
	.word 0
