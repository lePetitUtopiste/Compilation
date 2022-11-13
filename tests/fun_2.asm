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
	sw $s0, 0($sp)
	subi $sp, $sp, 4
	sw $s1, 0($sp)
	subi $sp, $sp, 4
	sw $s2, 0($sp)
	subi $sp, $sp, 4
	sw $s3, 0($sp)
	subi $sp, $sp, 4
	sw $s4, 0($sp)
	subi $sp, $sp, 4
	sw $s5, 0($sp)
	subi $sp, $sp, 4
	sw $s6, 0($sp)
	subi $sp, $sp, 4
	sw $s7, 0($sp)
	subi $sp, $sp, 4
	li $t0, 4
	sw $t0, -8($fp)
	lw $t0, -8($fp)
	sw $t0, -24($fp)
	li $t0, 42
	sw $t0, -12($fp)
	lw $t0, -12($fp)
	sw $t0, -20($fp)
	lw $t1, -24($fp)
	move $a2, $t1
	lw $t1, -20($fp)
	move $a1, $t1
	move $s7, $a0
	move $s6, $a1
	move $s5, $a2
	move $s4, $a3
	jal add
	addi $sp, $sp, -4
	sw $v0, -24($fp)
	lw $t0, -24($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	li $t0, 1
	sw $t0, -16($fp)
	lw $t1, -16($fp)
	move $a2, $t1
	lw $t1, -20($fp)
	move $a1, $t1
	move $s7, $a0
	move $s6, $a1
	move $s5, $a2
	move $s4, $a3
	jal add
	addi $sp, $sp, -4
	sw $v0, -24($fp)
	lw $t0, -24($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	li $v0, 0
__lab_2:
	addi $sp, $sp, 4
	lw $s7, 0($sp)
	addi $sp, $sp, 4
	lw $s6, 0($sp)
	addi $sp, $sp, 4
	lw $s5, 0($sp)
	addi $sp, $sp, 4
	lw $s4, 0($sp)
	addi $sp, $sp, 4
	lw $s3, 0($sp)
	addi $sp, $sp, 4
	lw $s2, 0($sp)
	addi $sp, $sp, 4
	lw $s1, 0($sp)
	addi $sp, $sp, 4
	lw $s0, 0($sp)
	move $sp, $fp
	lw $ra, -4($fp)
	lw $fp, 0($fp)
	jr $ra
add:
	sw $fp, 0($sp)
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	subi $sp, $sp, 4
	addi $fp, $sp, 8
	addi $sp, $sp, -12
	sw $s0, 0($sp)
	subi $sp, $sp, 4
	sw $s1, 0($sp)
	subi $sp, $sp, 4
	sw $s2, 0($sp)
	subi $sp, $sp, 4
	sw $s3, 0($sp)
	subi $sp, $sp, 4
	sw $s4, 0($sp)
	subi $sp, $sp, 4
	sw $s5, 0($sp)
	subi $sp, $sp, 4
	sw $s6, 0($sp)
	subi $sp, $sp, 4
	sw $s7, 0($sp)
	subi $sp, $sp, 4
	move $t0, $a1
	sw $t0, -16($fp)
	move $t0, $a2
	sw $t0, -12($fp)
	lw $t0, -16($fp)
	lw $t1, -12($fp)
	add $t0, $t0, $t1
	sw $t0, -8($fp)
	lw $t1, -8($fp)
	move $v0, $t1
	move $sp, $fp
	b __lab_1
	li $v0, 0
__lab_1:
	addi $sp, $sp, 4
	lw $s7, 0($sp)
	addi $sp, $sp, 4
	lw $s6, 0($sp)
	addi $sp, $sp, 4
	lw $s5, 0($sp)
	addi $sp, $sp, 4
	lw $s4, 0($sp)
	addi $sp, $sp, 4
	lw $s3, 0($sp)
	addi $sp, $sp, 4
	lw $s2, 0($sp)
	addi $sp, $sp, 4
	lw $s1, 0($sp)
	addi $sp, $sp, 4
	lw $s0, 0($sp)
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
