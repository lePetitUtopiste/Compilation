.text
	beqz $a0, init_end
	lw $a0, 0($a1)
	jal atoi
init_end:
	move $a1, $v0
	jal main
	li $v0, 10
	syscall
main:
	sw $fp, 0($sp)
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	subi $sp, $sp, 4
	addi $fp, $sp, 8
	addi $sp, $sp, -24
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
	move $s5, $a1
	move $s6, $a2
	move $s7, $a3
	li $t0, 46
	sw $t0, -8($fp)
	lw $t0, -8($fp)
	sw $t0, 0($sp)
	subi $sp, $sp, 4
	li $t0, 45
	sw $t0, -12($fp)
	lw $t0, -12($fp)
	sw $t0, 0($sp)
	subi $sp, $sp, 4
	li $t0, 44
	sw $t0, -16($fp)
	lw $t0, -16($fp)
	sw $t0, 0($sp)
	subi $sp, $sp, 4
	li $t0, 43
	sw $t0, -20($fp)
	lw $t1, -20($fp)
	move $a3, $t1
	li $t0, 42
	sw $t0, -24($fp)
	lw $t1, -24($fp)
	move $a2, $t1
	li $t0, 41
	sw $t0, -28($fp)
	lw $t1, -28($fp)
	move $a1, $t1
	jal test
	move $a1, $s5
	move $a2, $s6
	move $a3, $s7
	addi $sp, $sp, 12
	move $a1, $s5
	move $a2, $s6
	move $a3, $s7
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
test:
	sw $fp, 0($sp)
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	subi $sp, $sp, 4
	addi $fp, $sp, 8
	addi $sp, $sp, -24
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
	sw $t0, -8($fp)
	lw $t0, -8($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	move $t0, $a2
	sw $t0, -12($fp)
	lw $t0, -12($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	move $t0, $a3
	sw $t0, -16($fp)
	lw $t0, -16($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	lw $t0, 4($fp)
	sw $t0, -20($fp)
	lw $t0, -20($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	lw $t0, 8($fp)
	sw $t0, -24($fp)
	lw $t0, -24($fp)
	move $a0, $t0
	li $v0, 11
	syscall
	lw $t0, 12($fp)
	sw $t0, -28($fp)
	lw $t0, -28($fp)
	move $a0, $t0
	li $v0, 11
	syscall
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
