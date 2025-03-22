.data
label_0_a11:
.word 0
label_1_a12:
.word 0
label_2_a13:
.word 0
label_3_a21:
.word 0
label_4_a22:
.word 0
label_5_a23:
.word 0
label_6_a31:
.word 0
label_7_a32:
.word 0
label_8_a33:
.word 0
label_9_empty:
.word 0
label_10_str:
.asciiz "\n"
.align 2
label_11_str:
.asciiz "     1   2   3\n"
label_12_str:
.asciiz "   +---+---+---+\n"
.align 2
label_13_str:
.asciiz "a  | "
.align 2
label_14_str:
.asciiz " | "
label_15_str:
.asciiz " | "
label_16_str:
.asciiz " |\n"
label_17_str:
.asciiz "   +---+---+---+\n"
.align 2
label_18_str:
.asciiz "b  | "
.align 2
label_19_str:
.asciiz " | "
label_20_str:
.asciiz " | "
label_21_str:
.asciiz " |\n"
label_22_str:
.asciiz "   +---+---+---+\n"
.align 2
label_23_str:
.asciiz "c  | "
.align 2
label_24_str:
.asciiz " | "
label_25_str:
.asciiz " | "
label_26_str:
.asciiz " |\n"
label_27_str:
.asciiz "   +---+---+---+\n"
.align 2
label_28_str:
.asciiz "\n"
.align 2
label_29_str:
.asciiz "Player "
label_30_str:
.asciiz " has won!\n"
.align 1
label_31_str:
.asciiz "Player "
label_32_str:
.asciiz " select move (e.g. a2)>"
label_33_str:
.asciiz "That is not a valid move!\n"
.align 1
label_34_str:
.asciiz "That move is not possible!\n"
label_35_str:
.asciiz "It's a draw!\n"
.align 2
label_36_str:
.asciiz "Play again? (y/n)> "

.text
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: jal main
jal main
# Original instruction: li $v0,10
li $v0,10
# Original instruction: syscall
syscall

.text
# BEGIN PROLOGUE
mcmalloc:
# Clearing entire allocated stack frame of size 8
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_39_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_39_clean_loop
bne $t2,$zero,label_39_clean_loop
label_40_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-8
addiu $sp,$fp,-8
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v0,$sp,0
addi $t0,$sp,0
# END PROLOGUE
# Original instruction: lw $a0,4($fp)
lw $a0,4($fp)
# Original instruction: addi $v0,$zero,9
addi $v0,$zero,9
# Original instruction: syscall
syscall
# Original instruction: sw $v0,0($fp)
sw $v0,0($fp)
# BEGIN EPILOGUE
mcmallocEND:
# Original instruction: addi $sp,v0,0
addi $sp,$t0,0
# Original instruction: popRegisters
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
read_i:
# Clearing entire allocated stack frame of size 8
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_43_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_43_clean_loop
bne $t2,$zero,label_43_clean_loop
label_44_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-8
addiu $sp,$fp,-8
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v1,$sp,0
addi $t0,$sp,0
# END PROLOGUE
# Original instruction: addi $v0,$zero,5
addi $v0,$zero,5
# Original instruction: syscall
syscall
# Original instruction: sw $v0,0($fp)
sw $v0,0($fp)
# BEGIN EPILOGUE
read_iEND:
# Original instruction: addi $sp,v1,0
addi $sp,$t0,0
# Original instruction: popRegisters
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
read_c:
# Clearing entire allocated stack frame of size 8
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_47_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_47_clean_loop
bne $t2,$zero,label_47_clean_loop
label_48_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-8
addiu $sp,$fp,-8
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v2,$sp,0
addi $t0,$sp,0
# END PROLOGUE
# Original instruction: addi $v0,$zero,12
addi $v0,$zero,12
# Original instruction: syscall
syscall
# Original instruction: sw $v0,0($fp)
sw $v0,0($fp)
# BEGIN EPILOGUE
read_cEND:
# Original instruction: addi $sp,v2,0
addi $sp,$t0,0
# Original instruction: popRegisters
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
print_c:
# Clearing entire allocated stack frame of size 8
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_51_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_51_clean_loop
bne $t2,$zero,label_51_clean_loop
label_52_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-8
addiu $sp,$fp,-8
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v3,$sp,0
addi $t0,$sp,0
# END PROLOGUE
# Original instruction: lb $a0,0($fp)
lb $a0,0($fp)
# Original instruction: addi $v0,$zero,11
addi $v0,$zero,11
# Original instruction: syscall
syscall
# BEGIN EPILOGUE
print_cEND:
# Original instruction: addi $sp,v3,0
addi $sp,$t0,0
# Original instruction: popRegisters
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
print_i:
# Clearing entire allocated stack frame of size 8
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_55_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_55_clean_loop
bne $t2,$zero,label_55_clean_loop
label_56_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-8
addiu $sp,$fp,-8
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v4,$sp,0
addi $t0,$sp,0
# END PROLOGUE
# Original instruction: lw $a0,0($fp)
lw $a0,0($fp)
# Original instruction: addi $v0,$zero,1
addi $v0,$zero,1
# Original instruction: syscall
syscall
# BEGIN EPILOGUE
print_iEND:
# Original instruction: addi $sp,v4,0
addi $sp,$t0,0
# Original instruction: popRegisters
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
print_s:
# Clearing entire allocated stack frame of size 8
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_59_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_59_clean_loop
bne $t2,$zero,label_59_clean_loop
label_60_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-8
addiu $sp,$fp,-8
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v5,$sp,0
addi $t0,$sp,0
# END PROLOGUE
# Original instruction: lw $a0,0($fp)
lw $a0,0($fp)
# Original instruction: addi $v0,$zero,4
addi $v0,$zero,4
# Original instruction: syscall
syscall
# BEGIN EPILOGUE
print_sEND:
# Original instruction: addi $sp,v5,0
addi $sp,$t0,0
# Original instruction: popRegisters
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
reset:
# Clearing entire allocated stack frame of size 8
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_63_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_63_clean_loop
bne $t2,$zero,label_63_clean_loop
label_64_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-8
addiu $sp,$fp,-8
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v6,$sp,0
addi $t3,$sp,0
# END PROLOGUE
# Original instruction: la v7,label_9_empty
la $t6,label_9_empty
# Original instruction: la v8,label_0_a11
la $t4,label_0_a11
# 
# Loading from v7 from stack into v8
# Original instruction: li v9,1
li $t2,1
# Original instruction: li v10,0
li $t5,0
label_65_mem_copy_loop:
# Original instruction: beq v10,v9,label_66_mem_copy_end
beq $t5,$t2,label_66_mem_copy_end
# Original instruction: add v11,v7,v10
add $t0,$t6,$t5
# Original instruction: lb v13,0(v11)
lb $t0,0($t0)
# Original instruction: add v12,v8,v10
add $t1,$t4,$t5
# Original instruction: sb v13,0(v12)
sb $t0,0($t1)
# Original instruction: addi v10,v10,1
addi $t5,$t5,1
# Original instruction: j label_65_mem_copy_loop
j label_65_mem_copy_loop
label_66_mem_copy_end:
# 
# Original instruction: la v14,label_9_empty
la $t1,label_9_empty
# Original instruction: la v15,label_1_a12
la $t2,label_1_a12
# 
# Loading from v14 from stack into v15
# Original instruction: li v16,1
li $t6,1
# Original instruction: li v17,0
li $t4,0
label_67_mem_copy_loop:
# Original instruction: beq v17,v16,label_68_mem_copy_end
beq $t4,$t6,label_68_mem_copy_end
# Original instruction: add v18,v14,v17
add $t0,$t1,$t4
# Original instruction: lb v20,0(v18)
lb $t5,0($t0)
# Original instruction: add v19,v15,v17
add $t0,$t2,$t4
# Original instruction: sb v20,0(v19)
sb $t5,0($t0)
# Original instruction: addi v17,v17,1
addi $t4,$t4,1
# Original instruction: j label_67_mem_copy_loop
j label_67_mem_copy_loop
label_68_mem_copy_end:
# 
# Original instruction: la v21,label_9_empty
la $t2,label_9_empty
# Original instruction: la v22,label_2_a13
la $t0,label_2_a13
# 
# Loading from v21 from stack into v22
# Original instruction: li v23,1
li $t1,1
# Original instruction: li v24,0
li $t5,0
label_69_mem_copy_loop:
# Original instruction: beq v24,v23,label_70_mem_copy_end
beq $t5,$t1,label_70_mem_copy_end
# Original instruction: add v25,v21,v24
add $t4,$t2,$t5
# Original instruction: lb v27,0(v25)
lb $t6,0($t4)
# Original instruction: add v26,v22,v24
add $t4,$t0,$t5
# Original instruction: sb v27,0(v26)
sb $t6,0($t4)
# Original instruction: addi v24,v24,1
addi $t5,$t5,1
# Original instruction: j label_69_mem_copy_loop
j label_69_mem_copy_loop
label_70_mem_copy_end:
# 
# Original instruction: la v28,label_9_empty
la $t1,label_9_empty
# Original instruction: la v29,label_3_a21
la $t4,label_3_a21
# 
# Loading from v28 from stack into v29
# Original instruction: li v30,1
li $t2,1
# Original instruction: li v31,0
li $t6,0
label_71_mem_copy_loop:
# Original instruction: beq v31,v30,label_72_mem_copy_end
beq $t6,$t2,label_72_mem_copy_end
# Original instruction: add v32,v28,v31
add $t0,$t1,$t6
# Original instruction: lb v34,0(v32)
lb $t5,0($t0)
# Original instruction: add v33,v29,v31
add $t0,$t4,$t6
# Original instruction: sb v34,0(v33)
sb $t5,0($t0)
# Original instruction: addi v31,v31,1
addi $t6,$t6,1
# Original instruction: j label_71_mem_copy_loop
j label_71_mem_copy_loop
label_72_mem_copy_end:
# 
# Original instruction: la v35,label_9_empty
la $t0,label_9_empty
# Original instruction: la v36,label_4_a22
la $t5,label_4_a22
# 
# Loading from v35 from stack into v36
# Original instruction: li v37,1
li $t4,1
# Original instruction: li v38,0
li $t1,0
label_73_mem_copy_loop:
# Original instruction: beq v38,v37,label_74_mem_copy_end
beq $t1,$t4,label_74_mem_copy_end
# Original instruction: add v39,v35,v38
add $t2,$t0,$t1
# Original instruction: lb v41,0(v39)
lb $t2,0($t2)
# Original instruction: add v40,v36,v38
add $t6,$t5,$t1
# Original instruction: sb v41,0(v40)
sb $t2,0($t6)
# Original instruction: addi v38,v38,1
addi $t1,$t1,1
# Original instruction: j label_73_mem_copy_loop
j label_73_mem_copy_loop
label_74_mem_copy_end:
# 
# Original instruction: la v42,label_9_empty
la $t5,label_9_empty
# Original instruction: la v43,label_5_a23
la $t4,label_5_a23
# 
# Loading from v42 from stack into v43
# Original instruction: li v44,1
li $t1,1
# Original instruction: li v45,0
li $t2,0
label_75_mem_copy_loop:
# Original instruction: beq v45,v44,label_76_mem_copy_end
beq $t2,$t1,label_76_mem_copy_end
# Original instruction: add v46,v42,v45
add $t0,$t5,$t2
# Original instruction: lb v48,0(v46)
lb $t6,0($t0)
# Original instruction: add v47,v43,v45
add $t0,$t4,$t2
# Original instruction: sb v48,0(v47)
sb $t6,0($t0)
# Original instruction: addi v45,v45,1
addi $t2,$t2,1
# Original instruction: j label_75_mem_copy_loop
j label_75_mem_copy_loop
label_76_mem_copy_end:
# 
# Original instruction: la v49,label_9_empty
la $t5,label_9_empty
# Original instruction: la v50,label_6_a31
la $t4,label_6_a31
# 
# Loading from v49 from stack into v50
# Original instruction: li v51,1
li $t0,1
# Original instruction: li v52,0
li $t6,0
label_77_mem_copy_loop:
# Original instruction: beq v52,v51,label_78_mem_copy_end
beq $t6,$t0,label_78_mem_copy_end
# Original instruction: add v53,v49,v52
add $t1,$t5,$t6
# Original instruction: lb v55,0(v53)
lb $t1,0($t1)
# Original instruction: add v54,v50,v52
add $t2,$t4,$t6
# Original instruction: sb v55,0(v54)
sb $t1,0($t2)
# Original instruction: addi v52,v52,1
addi $t6,$t6,1
# Original instruction: j label_77_mem_copy_loop
j label_77_mem_copy_loop
label_78_mem_copy_end:
# 
# Original instruction: la v56,label_9_empty
la $t2,label_9_empty
# Original instruction: la v57,label_7_a32
la $t1,label_7_a32
# 
# Loading from v56 from stack into v57
# Original instruction: li v58,1
li $t6,1
# Original instruction: li v59,0
li $t5,0
label_79_mem_copy_loop:
# Original instruction: beq v59,v58,label_80_mem_copy_end
beq $t5,$t6,label_80_mem_copy_end
# Original instruction: add v60,v56,v59
add $t0,$t2,$t5
# Original instruction: lb v62,0(v60)
lb $t0,0($t0)
# Original instruction: add v61,v57,v59
add $t4,$t1,$t5
# Original instruction: sb v62,0(v61)
sb $t0,0($t4)
# Original instruction: addi v59,v59,1
addi $t5,$t5,1
# Original instruction: j label_79_mem_copy_loop
j label_79_mem_copy_loop
label_80_mem_copy_end:
# 
# Original instruction: la v63,label_9_empty
la $t6,label_9_empty
# Original instruction: la v64,label_8_a33
la $t2,label_8_a33
# 
# Loading from v63 from stack into v64
# Original instruction: li v65,1
li $t4,1
# Original instruction: li v66,0
li $t0,0
label_81_mem_copy_loop:
# Original instruction: beq v66,v65,label_82_mem_copy_end
beq $t0,$t4,label_82_mem_copy_end
# Original instruction: add v67,v63,v66
add $t1,$t6,$t0
# Original instruction: lb v69,0(v67)
lb $t5,0($t1)
# Original instruction: add v68,v64,v66
add $t1,$t2,$t0
# Original instruction: sb v69,0(v68)
sb $t5,0($t1)
# Original instruction: addi v66,v66,1
addi $t0,$t0,1
# Original instruction: j label_81_mem_copy_loop
j label_81_mem_copy_loop
label_82_mem_copy_end:
# 
# BEGIN EPILOGUE
resetEND:
# Original instruction: addi $sp,v6,0
addi $sp,$t3,0
# Original instruction: popRegisters
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
full:
# Clearing entire allocated stack frame of size 12
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_85_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,13
slti $t2,$t0,13
# Original instruction: bne $t2,$zero,label_85_clean_loop
bne $t2,$zero,label_85_clean_loop
label_86_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-12
addiu $sp,$fp,-12
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
# Original instruction: addi v70,$sp,0
addi $t1,$sp,0
# END PROLOGUE
# Original instruction: addi v71,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v72,$fp,-12
addiu $t2,$fp,-12
# Loading from v71 from reg into v72
# Original instruction: sw v71,0(v72)
sw $t0,0($t2)
# Original instruction: la v73,label_0_a11
la $t0,label_0_a11
# Original instruction: lb v74,0(v73)
lb $t2,0($t0)
# Original instruction: la v75,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v76,0(v75)
lb $t0,0($t0)
# Original instruction: slt v77,v74,v76
slt $t3,$t2,$t0
# Original instruction: slt v78,v76,v74
slt $t0,$t0,$t2
# Original instruction: or v77,v77,v78
or $t3,$t3,$t0
# Original instruction: beqz v77,label_87_else
beqz $t3,label_87_else
# Original instruction: addiu v79,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v80,0(v79)
lw $t0,0($t0)
# Original instruction: addi v81,$zero,1
addi $t2,$zero,1
# Original instruction: add v82,v80,v81
add $t0,$t0,$t2
# Original instruction: addiu v83,$fp,-12
addiu $t2,$fp,-12
# Loading from v82 from reg into v83
# Original instruction: sw v82,0(v83)
sw $t0,0($t2)
# Original instruction: j label_88_end
j label_88_end
label_87_else:
label_88_end:
# Original instruction: la v84,label_3_a21
la $t0,label_3_a21
# Original instruction: lb v85,0(v84)
lb $t2,0($t0)
# Original instruction: la v86,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v87,0(v86)
lb $t0,0($t0)
# Original instruction: slt v88,v85,v87
slt $t3,$t2,$t0
# Original instruction: slt v89,v87,v85
slt $t0,$t0,$t2
# Original instruction: or v88,v88,v89
or $t3,$t3,$t0
# Original instruction: beqz v88,label_89_else
beqz $t3,label_89_else
# Original instruction: addiu v90,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v91,0(v90)
lw $t0,0($t0)
# Original instruction: addi v92,$zero,1
addi $t2,$zero,1
# Original instruction: add v93,v91,v92
add $t2,$t0,$t2
# Original instruction: addiu v94,$fp,-12
addiu $t0,$fp,-12
# Loading from v93 from reg into v94
# Original instruction: sw v93,0(v94)
sw $t2,0($t0)
# Original instruction: j label_90_end
j label_90_end
label_89_else:
label_90_end:
# Original instruction: la v95,label_6_a31
la $t0,label_6_a31
# Original instruction: lb v96,0(v95)
lb $t3,0($t0)
# Original instruction: la v97,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v98,0(v97)
lb $t0,0($t0)
# Original instruction: slt v99,v96,v98
slt $t2,$t3,$t0
# Original instruction: slt v100,v98,v96
slt $t0,$t0,$t3
# Original instruction: or v99,v99,v100
or $t2,$t2,$t0
# Original instruction: beqz v99,label_91_else
beqz $t2,label_91_else
# Original instruction: addiu v101,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v102,0(v101)
lw $t0,0($t0)
# Original instruction: addi v103,$zero,1
addi $t2,$zero,1
# Original instruction: add v104,v102,v103
add $t2,$t0,$t2
# Original instruction: addiu v105,$fp,-12
addiu $t0,$fp,-12
# Loading from v104 from reg into v105
# Original instruction: sw v104,0(v105)
sw $t2,0($t0)
# Original instruction: j label_92_end
j label_92_end
label_91_else:
label_92_end:
# Original instruction: la v106,label_1_a12
la $t0,label_1_a12
# Original instruction: lb v107,0(v106)
lb $t3,0($t0)
# Original instruction: la v108,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v109,0(v108)
lb $t2,0($t0)
# Original instruction: slt v110,v107,v109
slt $t0,$t3,$t2
# Original instruction: slt v111,v109,v107
slt $t2,$t2,$t3
# Original instruction: or v110,v110,v111
or $t0,$t0,$t2
# Original instruction: beqz v110,label_93_else
beqz $t0,label_93_else
# Original instruction: addiu v112,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v113,0(v112)
lw $t2,0($t0)
# Original instruction: addi v114,$zero,1
addi $t0,$zero,1
# Original instruction: add v115,v113,v114
add $t0,$t2,$t0
# Original instruction: addiu v116,$fp,-12
addiu $t2,$fp,-12
# Loading from v115 from reg into v116
# Original instruction: sw v115,0(v116)
sw $t0,0($t2)
# Original instruction: j label_94_end
j label_94_end
label_93_else:
label_94_end:
# Original instruction: la v117,label_4_a22
la $t0,label_4_a22
# Original instruction: lb v118,0(v117)
lb $t0,0($t0)
# Original instruction: la v119,label_9_empty
la $t2,label_9_empty
# Original instruction: lb v120,0(v119)
lb $t2,0($t2)
# Original instruction: slt v121,v118,v120
slt $t3,$t0,$t2
# Original instruction: slt v122,v120,v118
slt $t0,$t2,$t0
# Original instruction: or v121,v121,v122
or $t3,$t3,$t0
# Original instruction: beqz v121,label_95_else
beqz $t3,label_95_else
# Original instruction: addiu v123,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v124,0(v123)
lw $t0,0($t0)
# Original instruction: addi v125,$zero,1
addi $t2,$zero,1
# Original instruction: add v126,v124,v125
add $t2,$t0,$t2
# Original instruction: addiu v127,$fp,-12
addiu $t0,$fp,-12
# Loading from v126 from reg into v127
# Original instruction: sw v126,0(v127)
sw $t2,0($t0)
# Original instruction: j label_96_end
j label_96_end
label_95_else:
label_96_end:
# Original instruction: la v128,label_7_a32
la $t0,label_7_a32
# Original instruction: lb v129,0(v128)
lb $t0,0($t0)
# Original instruction: la v130,label_9_empty
la $t2,label_9_empty
# Original instruction: lb v131,0(v130)
lb $t3,0($t2)
# Original instruction: slt v132,v129,v131
slt $t2,$t0,$t3
# Original instruction: slt v133,v131,v129
slt $t0,$t3,$t0
# Original instruction: or v132,v132,v133
or $t2,$t2,$t0
# Original instruction: beqz v132,label_97_else
beqz $t2,label_97_else
# Original instruction: addiu v134,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v135,0(v134)
lw $t2,0($t0)
# Original instruction: addi v136,$zero,1
addi $t0,$zero,1
# Original instruction: add v137,v135,v136
add $t2,$t2,$t0
# Original instruction: addiu v138,$fp,-12
addiu $t0,$fp,-12
# Loading from v137 from reg into v138
# Original instruction: sw v137,0(v138)
sw $t2,0($t0)
# Original instruction: j label_98_end
j label_98_end
label_97_else:
label_98_end:
# Original instruction: la v139,label_2_a13
la $t0,label_2_a13
# Original instruction: lb v140,0(v139)
lb $t2,0($t0)
# Original instruction: la v141,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v142,0(v141)
lb $t3,0($t0)
# Original instruction: slt v143,v140,v142
slt $t0,$t2,$t3
# Original instruction: slt v144,v142,v140
slt $t2,$t3,$t2
# Original instruction: or v143,v143,v144
or $t0,$t0,$t2
# Original instruction: beqz v143,label_99_else
beqz $t0,label_99_else
# Original instruction: addiu v145,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v146,0(v145)
lw $t2,0($t0)
# Original instruction: addi v147,$zero,1
addi $t0,$zero,1
# Original instruction: add v148,v146,v147
add $t2,$t2,$t0
# Original instruction: addiu v149,$fp,-12
addiu $t0,$fp,-12
# Loading from v148 from reg into v149
# Original instruction: sw v148,0(v149)
sw $t2,0($t0)
# Original instruction: j label_100_end
j label_100_end
label_99_else:
label_100_end:
# Original instruction: la v150,label_5_a23
la $t0,label_5_a23
# Original instruction: lb v151,0(v150)
lb $t3,0($t0)
# Original instruction: la v152,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v153,0(v152)
lb $t0,0($t0)
# Original instruction: slt v154,v151,v153
slt $t2,$t3,$t0
# Original instruction: slt v155,v153,v151
slt $t0,$t0,$t3
# Original instruction: or v154,v154,v155
or $t2,$t2,$t0
# Original instruction: beqz v154,label_101_else
beqz $t2,label_101_else
# Original instruction: addiu v156,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v157,0(v156)
lw $t2,0($t0)
# Original instruction: addi v158,$zero,1
addi $t0,$zero,1
# Original instruction: add v159,v157,v158
add $t0,$t2,$t0
# Original instruction: addiu v160,$fp,-12
addiu $t2,$fp,-12
# Loading from v159 from reg into v160
# Original instruction: sw v159,0(v160)
sw $t0,0($t2)
# Original instruction: j label_102_end
j label_102_end
label_101_else:
label_102_end:
# Original instruction: la v161,label_8_a33
la $t0,label_8_a33
# Original instruction: lb v162,0(v161)
lb $t0,0($t0)
# Original instruction: la v163,label_9_empty
la $t2,label_9_empty
# Original instruction: lb v164,0(v163)
lb $t2,0($t2)
# Original instruction: slt v165,v162,v164
slt $t3,$t0,$t2
# Original instruction: slt v166,v164,v162
slt $t0,$t2,$t0
# Original instruction: or v165,v165,v166
or $t3,$t3,$t0
# Original instruction: beqz v165,label_103_else
beqz $t3,label_103_else
# Original instruction: addiu v167,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v168,0(v167)
lw $t2,0($t0)
# Original instruction: addi v169,$zero,1
addi $t0,$zero,1
# Original instruction: add v170,v168,v169
add $t0,$t2,$t0
# Original instruction: addiu v171,$fp,-12
addiu $t2,$fp,-12
# Loading from v170 from reg into v171
# Original instruction: sw v170,0(v171)
sw $t0,0($t2)
# Original instruction: j label_104_end
j label_104_end
label_103_else:
label_104_end:
# Original instruction: addiu v172,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v173,0(v172)
lw $t3,0($t0)
# Original instruction: addi v174,$zero,9
addi $t2,$zero,9
# Original instruction: slt v176,v173,v174
slt $t0,$t3,$t2
# Original instruction: slt v177,v174,v173
slt $t2,$t2,$t3
# Original instruction: or v178,v176,v177
or $t2,$t0,$t2
# Original instruction: addi v179,$zero,1
addi $t0,$zero,1
# Original instruction: sub v175,v179,v178
sub $t0,$t0,$t2
# Original instruction: beqz v175,label_105_else
beqz $t0,label_105_else
# Return statement start
# Original instruction: addi v180,$zero,1
addi $t2,$zero,1
# Original instruction: addiu v181,$fp,0
addiu $t0,$fp,0
# Loading from v180 from reg into v181
# Original instruction: sw v180,0(v181)
sw $t2,0($t0)
# Original instruction: jal fullEND
jal fullEND
# Return statement end
# Original instruction: j label_106_end
j label_106_end
label_105_else:
# Return statement start
# Original instruction: addi v182,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v183,$fp,0
addiu $t2,$fp,0
# Loading from v182 from reg into v183
# Original instruction: sw v182,0(v183)
sw $t0,0($t2)
# Original instruction: jal fullEND
jal fullEND
# Return statement end
label_106_end:
# BEGIN EPILOGUE
fullEND:
# Original instruction: addi $sp,v70,0
addi $sp,$t1,0
# Original instruction: popRegisters
# Registers:
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
set:
# Clearing entire allocated stack frame of size 12
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_109_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,13
slti $t2,$t0,13
# Original instruction: bne $t2,$zero,label_109_clean_loop
bne $t2,$zero,label_109_clean_loop
label_110_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-12
addiu $sp,$fp,-12
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v184,$sp,0
addi $t2,$sp,0
# END PROLOGUE
# Original instruction: addi v185,$zero,1
addi $t0,$zero,1
# Original instruction: addiu v186,$fp,-12
addiu $t1,$fp,-12
# Loading from v185 from reg into v186
# Original instruction: sw v185,0(v186)
sw $t0,0($t1)
# Original instruction: addiu v187,$fp,12
addiu $t0,$fp,12
# Original instruction: lb v188,0(v187)
lb $t3,0($t0)
# Original instruction: addi v189,$zero,97
addi $t0,$zero,97
# Original instruction: slt v191,v188,v189
slt $t1,$t3,$t0
# Original instruction: slt v192,v189,v188
slt $t0,$t0,$t3
# Original instruction: or v193,v191,v192
or $t0,$t1,$t0
# Original instruction: addi v194,$zero,1
addi $t1,$zero,1
# Original instruction: sub v190,v194,v193
sub $t0,$t1,$t0
# Original instruction: beqz v190,label_111_else
beqz $t0,label_111_else
# Original instruction: addiu v195,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v196,0(v195)
lw $t0,0($t0)
# Original instruction: addi v197,$zero,1
addi $t3,$zero,1
# Original instruction: slt v199,v196,v197
slt $t1,$t0,$t3
# Original instruction: slt v200,v197,v196
slt $t0,$t3,$t0
# Original instruction: or v201,v199,v200
or $t0,$t1,$t0
# Original instruction: addi v202,$zero,1
addi $t1,$zero,1
# Original instruction: sub v198,v202,v201
sub $t0,$t1,$t0
# Original instruction: beqz v198,label_113_else
beqz $t0,label_113_else
# Original instruction: la v203,label_0_a11
la $t0,label_0_a11
# Original instruction: lb v204,0(v203)
lb $t3,0($t0)
# Original instruction: la v205,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v206,0(v205)
lb $t1,0($t0)
# Original instruction: slt v208,v204,v206
slt $t0,$t3,$t1
# Original instruction: slt v209,v206,v204
slt $t1,$t1,$t3
# Original instruction: or v210,v208,v209
or $t1,$t0,$t1
# Original instruction: addi v211,$zero,1
addi $t0,$zero,1
# Original instruction: sub v207,v211,v210
sub $t0,$t0,$t1
# Original instruction: beqz v207,label_115_else
beqz $t0,label_115_else
# Original instruction: addiu v212,$fp,4
addiu $t1,$fp,4
# Original instruction: la v213,label_0_a11
la $t3,label_0_a11
# 
# Loading from v212 from stack into v213
# Original instruction: li v214,1
li $t5,1
# Original instruction: li v215,0
li $t6,0
label_117_mem_copy_loop:
# Original instruction: beq v215,v214,label_118_mem_copy_end
beq $t6,$t5,label_118_mem_copy_end
# Original instruction: add v216,v212,v215
add $t0,$t1,$t6
# Original instruction: lb v218,0(v216)
lb $t0,0($t0)
# Original instruction: add v217,v213,v215
add $t4,$t3,$t6
# Original instruction: sb v218,0(v217)
sb $t0,0($t4)
# Original instruction: addi v215,v215,1
addi $t6,$t6,1
# Original instruction: j label_117_mem_copy_loop
j label_117_mem_copy_loop
label_118_mem_copy_end:
# 
# Original instruction: j label_116_end
j label_116_end
label_115_else:
# Original instruction: addi v219,$zero,0
addi $t1,$zero,0
# Original instruction: addi v220,$zero,1
addi $t0,$zero,1
# Original instruction: sub v221,v219,v220
sub $t0,$t1,$t0
# Original instruction: addiu v222,$fp,-12
addiu $t1,$fp,-12
# Loading from v221 from reg into v222
# Original instruction: sw v221,0(v222)
sw $t0,0($t1)
label_116_end:
# Original instruction: j label_114_end
j label_114_end
label_113_else:
# Original instruction: addiu v223,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v224,0(v223)
lw $t1,0($t0)
# Original instruction: addi v225,$zero,2
addi $t3,$zero,2
# Original instruction: slt v227,v224,v225
slt $t0,$t1,$t3
# Original instruction: slt v228,v225,v224
slt $t1,$t3,$t1
# Original instruction: or v229,v227,v228
or $t1,$t0,$t1
# Original instruction: addi v230,$zero,1
addi $t0,$zero,1
# Original instruction: sub v226,v230,v229
sub $t0,$t0,$t1
# Original instruction: beqz v226,label_119_else
beqz $t0,label_119_else
# Original instruction: la v231,label_1_a12
la $t0,label_1_a12
# Original instruction: lb v232,0(v231)
lb $t1,0($t0)
# Original instruction: la v233,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v234,0(v233)
lb $t3,0($t0)
# Original instruction: slt v236,v232,v234
slt $t0,$t1,$t3
# Original instruction: slt v237,v234,v232
slt $t1,$t3,$t1
# Original instruction: or v238,v236,v237
or $t0,$t0,$t1
# Original instruction: addi v239,$zero,1
addi $t1,$zero,1
# Original instruction: sub v235,v239,v238
sub $t0,$t1,$t0
# Original instruction: beqz v235,label_121_else
beqz $t0,label_121_else
# Original instruction: addiu v240,$fp,4
addiu $t4,$fp,4
# Original instruction: la v241,label_1_a12
la $t1,label_1_a12
# 
# Loading from v240 from stack into v241
# Original instruction: li v242,1
li $t3,1
# Original instruction: li v243,0
li $t6,0
label_123_mem_copy_loop:
# Original instruction: beq v243,v242,label_124_mem_copy_end
beq $t6,$t3,label_124_mem_copy_end
# Original instruction: add v244,v240,v243
add $t0,$t4,$t6
# Original instruction: lb v246,0(v244)
lb $t5,0($t0)
# Original instruction: add v245,v241,v243
add $t0,$t1,$t6
# Original instruction: sb v246,0(v245)
sb $t5,0($t0)
# Original instruction: addi v243,v243,1
addi $t6,$t6,1
# Original instruction: j label_123_mem_copy_loop
j label_123_mem_copy_loop
label_124_mem_copy_end:
# 
# Original instruction: j label_122_end
j label_122_end
label_121_else:
# Original instruction: addi v247,$zero,0
addi $t1,$zero,0
# Original instruction: addi v248,$zero,1
addi $t0,$zero,1
# Original instruction: sub v249,v247,v248
sub $t0,$t1,$t0
# Original instruction: addiu v250,$fp,-12
addiu $t1,$fp,-12
# Loading from v249 from reg into v250
# Original instruction: sw v249,0(v250)
sw $t0,0($t1)
label_122_end:
# Original instruction: j label_120_end
j label_120_end
label_119_else:
# Original instruction: addiu v251,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v252,0(v251)
lw $t1,0($t0)
# Original instruction: addi v253,$zero,3
addi $t0,$zero,3
# Original instruction: slt v255,v252,v253
slt $t3,$t1,$t0
# Original instruction: slt v256,v253,v252
slt $t0,$t0,$t1
# Original instruction: or v257,v255,v256
or $t0,$t3,$t0
# Original instruction: addi v258,$zero,1
addi $t1,$zero,1
# Original instruction: sub v254,v258,v257
sub $t0,$t1,$t0
# Original instruction: beqz v254,label_125_else
beqz $t0,label_125_else
# Original instruction: la v259,label_2_a13
la $t0,label_2_a13
# Original instruction: lb v260,0(v259)
lb $t1,0($t0)
# Original instruction: la v261,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v262,0(v261)
lb $t0,0($t0)
# Original instruction: slt v264,v260,v262
slt $t3,$t1,$t0
# Original instruction: slt v265,v262,v260
slt $t0,$t0,$t1
# Original instruction: or v266,v264,v265
or $t0,$t3,$t0
# Original instruction: addi v267,$zero,1
addi $t1,$zero,1
# Original instruction: sub v263,v267,v266
sub $t0,$t1,$t0
# Original instruction: beqz v263,label_127_else
beqz $t0,label_127_else
# Original instruction: addiu v268,$fp,4
addiu $t4,$fp,4
# Original instruction: la v269,label_2_a13
la $t0,label_2_a13
# 
# Loading from v268 from stack into v269
# Original instruction: li v270,1
li $t5,1
# Original instruction: li v271,0
li $t6,0
label_129_mem_copy_loop:
# Original instruction: beq v271,v270,label_130_mem_copy_end
beq $t6,$t5,label_130_mem_copy_end
# Original instruction: add v272,v268,v271
add $t1,$t4,$t6
# Original instruction: lb v274,0(v272)
lb $t1,0($t1)
# Original instruction: add v273,v269,v271
add $t3,$t0,$t6
# Original instruction: sb v274,0(v273)
sb $t1,0($t3)
# Original instruction: addi v271,v271,1
addi $t6,$t6,1
# Original instruction: j label_129_mem_copy_loop
j label_129_mem_copy_loop
label_130_mem_copy_end:
# 
# Original instruction: j label_128_end
j label_128_end
label_127_else:
# Original instruction: addi v275,$zero,0
addi $t0,$zero,0
# Original instruction: addi v276,$zero,1
addi $t1,$zero,1
# Original instruction: sub v277,v275,v276
sub $t1,$t0,$t1
# Original instruction: addiu v278,$fp,-12
addiu $t0,$fp,-12
# Loading from v277 from reg into v278
# Original instruction: sw v277,0(v278)
sw $t1,0($t0)
label_128_end:
# Original instruction: j label_126_end
j label_126_end
label_125_else:
# Original instruction: addi v279,$zero,0
addi $t1,$zero,0
# Original instruction: addiu v280,$fp,-12
addiu $t0,$fp,-12
# Loading from v279 from reg into v280
# Original instruction: sw v279,0(v280)
sw $t1,0($t0)
label_126_end:
label_120_end:
label_114_end:
# Original instruction: j label_112_end
j label_112_end
label_111_else:
# Original instruction: addiu v281,$fp,12
addiu $t0,$fp,12
# Original instruction: lb v282,0(v281)
lb $t3,0($t0)
# Original instruction: addi v283,$zero,98
addi $t1,$zero,98
# Original instruction: slt v285,v282,v283
slt $t0,$t3,$t1
# Original instruction: slt v286,v283,v282
slt $t1,$t1,$t3
# Original instruction: or v287,v285,v286
or $t1,$t0,$t1
# Original instruction: addi v288,$zero,1
addi $t0,$zero,1
# Original instruction: sub v284,v288,v287
sub $t0,$t0,$t1
# Original instruction: beqz v284,label_131_else
beqz $t0,label_131_else
# Original instruction: addiu v289,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v290,0(v289)
lw $t0,0($t0)
# Original instruction: addi v291,$zero,1
addi $t1,$zero,1
# Original instruction: slt v293,v290,v291
slt $t3,$t0,$t1
# Original instruction: slt v294,v291,v290
slt $t0,$t1,$t0
# Original instruction: or v295,v293,v294
or $t1,$t3,$t0
# Original instruction: addi v296,$zero,1
addi $t0,$zero,1
# Original instruction: sub v292,v296,v295
sub $t0,$t0,$t1
# Original instruction: beqz v292,label_133_else
beqz $t0,label_133_else
# Original instruction: la v297,label_3_a21
la $t0,label_3_a21
# Original instruction: lb v298,0(v297)
lb $t3,0($t0)
# Original instruction: la v299,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v300,0(v299)
lb $t1,0($t0)
# Original instruction: slt v302,v298,v300
slt $t0,$t3,$t1
# Original instruction: slt v303,v300,v298
slt $t1,$t1,$t3
# Original instruction: or v304,v302,v303
or $t1,$t0,$t1
# Original instruction: addi v305,$zero,1
addi $t0,$zero,1
# Original instruction: sub v301,v305,v304
sub $t0,$t0,$t1
# Original instruction: beqz v301,label_135_else
beqz $t0,label_135_else
# Original instruction: addiu v306,$fp,4
addiu $t5,$fp,4
# Original instruction: la v307,label_3_a21
la $t4,label_3_a21
# 
# Loading from v306 from stack into v307
# Original instruction: li v308,1
li $t0,1
# Original instruction: li v309,0
li $t6,0
label_137_mem_copy_loop:
# Original instruction: beq v309,v308,label_138_mem_copy_end
beq $t6,$t0,label_138_mem_copy_end
# Original instruction: add v310,v306,v309
add $t1,$t5,$t6
# Original instruction: lb v312,0(v310)
lb $t3,0($t1)
# Original instruction: add v311,v307,v309
add $t1,$t4,$t6
# Original instruction: sb v312,0(v311)
sb $t3,0($t1)
# Original instruction: addi v309,v309,1
addi $t6,$t6,1
# Original instruction: j label_137_mem_copy_loop
j label_137_mem_copy_loop
label_138_mem_copy_end:
# 
# Original instruction: j label_136_end
j label_136_end
label_135_else:
# Original instruction: addi v313,$zero,0
addi $t0,$zero,0
# Original instruction: addi v314,$zero,1
addi $t1,$zero,1
# Original instruction: sub v315,v313,v314
sub $t0,$t0,$t1
# Original instruction: addiu v316,$fp,-12
addiu $t1,$fp,-12
# Loading from v315 from reg into v316
# Original instruction: sw v315,0(v316)
sw $t0,0($t1)
label_136_end:
# Original instruction: j label_134_end
j label_134_end
label_133_else:
# Original instruction: addiu v317,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v318,0(v317)
lw $t0,0($t0)
# Original instruction: addi v319,$zero,2
addi $t1,$zero,2
# Original instruction: slt v321,v318,v319
slt $t3,$t0,$t1
# Original instruction: slt v322,v319,v318
slt $t0,$t1,$t0
# Original instruction: or v323,v321,v322
or $t0,$t3,$t0
# Original instruction: addi v324,$zero,1
addi $t1,$zero,1
# Original instruction: sub v320,v324,v323
sub $t0,$t1,$t0
# Original instruction: beqz v320,label_139_else
beqz $t0,label_139_else
# Original instruction: la v325,label_4_a22
la $t0,label_4_a22
# Original instruction: lb v326,0(v325)
lb $t1,0($t0)
# Original instruction: la v327,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v328,0(v327)
lb $t0,0($t0)
# Original instruction: slt v330,v326,v328
slt $t3,$t1,$t0
# Original instruction: slt v331,v328,v326
slt $t0,$t0,$t1
# Original instruction: or v332,v330,v331
or $t1,$t3,$t0
# Original instruction: addi v333,$zero,1
addi $t0,$zero,1
# Original instruction: sub v329,v333,v332
sub $t0,$t0,$t1
# Original instruction: beqz v329,label_141_else
beqz $t0,label_141_else
# Original instruction: addiu v334,$fp,4
addiu $t5,$fp,4
# Original instruction: la v335,label_4_a22
la $t4,label_4_a22
# 
# Loading from v334 from stack into v335
# Original instruction: li v336,1
li $t0,1
# Original instruction: li v337,0
li $t1,0
label_143_mem_copy_loop:
# Original instruction: beq v337,v336,label_144_mem_copy_end
beq $t1,$t0,label_144_mem_copy_end
# Original instruction: add v338,v334,v337
add $t3,$t5,$t1
# Original instruction: lb v340,0(v338)
lb $t6,0($t3)
# Original instruction: add v339,v335,v337
add $t3,$t4,$t1
# Original instruction: sb v340,0(v339)
sb $t6,0($t3)
# Original instruction: addi v337,v337,1
addi $t1,$t1,1
# Original instruction: j label_143_mem_copy_loop
j label_143_mem_copy_loop
label_144_mem_copy_end:
# 
# Original instruction: j label_142_end
j label_142_end
label_141_else:
# Original instruction: addi v341,$zero,0
addi $t1,$zero,0
# Original instruction: addi v342,$zero,1
addi $t0,$zero,1
# Original instruction: sub v343,v341,v342
sub $t0,$t1,$t0
# Original instruction: addiu v344,$fp,-12
addiu $t1,$fp,-12
# Loading from v343 from reg into v344
# Original instruction: sw v343,0(v344)
sw $t0,0($t1)
label_142_end:
# Original instruction: j label_140_end
j label_140_end
label_139_else:
# Original instruction: addiu v345,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v346,0(v345)
lw $t1,0($t0)
# Original instruction: addi v347,$zero,3
addi $t0,$zero,3
# Original instruction: slt v349,v346,v347
slt $t3,$t1,$t0
# Original instruction: slt v350,v347,v346
slt $t0,$t0,$t1
# Original instruction: or v351,v349,v350
or $t1,$t3,$t0
# Original instruction: addi v352,$zero,1
addi $t0,$zero,1
# Original instruction: sub v348,v352,v351
sub $t0,$t0,$t1
# Original instruction: beqz v348,label_145_else
beqz $t0,label_145_else
# Original instruction: la v353,label_5_a23
la $t0,label_5_a23
# Original instruction: lb v354,0(v353)
lb $t0,0($t0)
# Original instruction: la v355,label_9_empty
la $t1,label_9_empty
# Original instruction: lb v356,0(v355)
lb $t3,0($t1)
# Original instruction: slt v358,v354,v356
slt $t1,$t0,$t3
# Original instruction: slt v359,v356,v354
slt $t0,$t3,$t0
# Original instruction: or v360,v358,v359
or $t1,$t1,$t0
# Original instruction: addi v361,$zero,1
addi $t0,$zero,1
# Original instruction: sub v357,v361,v360
sub $t0,$t0,$t1
# Original instruction: beqz v357,label_147_else
beqz $t0,label_147_else
# Original instruction: addiu v362,$fp,4
addiu $t3,$fp,4
# Original instruction: la v363,label_5_a23
la $t1,label_5_a23
# 
# Loading from v362 from stack into v363
# Original instruction: li v364,1
li $t6,1
# Original instruction: li v365,0
li $t0,0
label_149_mem_copy_loop:
# Original instruction: beq v365,v364,label_150_mem_copy_end
beq $t0,$t6,label_150_mem_copy_end
# Original instruction: add v366,v362,v365
add $t4,$t3,$t0
# Original instruction: lb v368,0(v366)
lb $t5,0($t4)
# Original instruction: add v367,v363,v365
add $t4,$t1,$t0
# Original instruction: sb v368,0(v367)
sb $t5,0($t4)
# Original instruction: addi v365,v365,1
addi $t0,$t0,1
# Original instruction: j label_149_mem_copy_loop
j label_149_mem_copy_loop
label_150_mem_copy_end:
# 
# Original instruction: j label_148_end
j label_148_end
label_147_else:
# Original instruction: addi v369,$zero,0
addi $t1,$zero,0
# Original instruction: addi v370,$zero,1
addi $t0,$zero,1
# Original instruction: sub v371,v369,v370
sub $t0,$t1,$t0
# Original instruction: addiu v372,$fp,-12
addiu $t1,$fp,-12
# Loading from v371 from reg into v372
# Original instruction: sw v371,0(v372)
sw $t0,0($t1)
label_148_end:
# Original instruction: j label_146_end
j label_146_end
label_145_else:
# Original instruction: addi v373,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v374,$fp,-12
addiu $t1,$fp,-12
# Loading from v373 from reg into v374
# Original instruction: sw v373,0(v374)
sw $t0,0($t1)
label_146_end:
label_140_end:
label_134_end:
# Original instruction: j label_132_end
j label_132_end
label_131_else:
# Original instruction: addiu v375,$fp,12
addiu $t0,$fp,12
# Original instruction: lb v376,0(v375)
lb $t1,0($t0)
# Original instruction: addi v377,$zero,99
addi $t0,$zero,99
# Original instruction: slt v379,v376,v377
slt $t3,$t1,$t0
# Original instruction: slt v380,v377,v376
slt $t0,$t0,$t1
# Original instruction: or v381,v379,v380
or $t0,$t3,$t0
# Original instruction: addi v382,$zero,1
addi $t1,$zero,1
# Original instruction: sub v378,v382,v381
sub $t0,$t1,$t0
# Original instruction: beqz v378,label_151_else
beqz $t0,label_151_else
# Original instruction: addiu v383,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v384,0(v383)
lw $t3,0($t0)
# Original instruction: addi v385,$zero,1
addi $t0,$zero,1
# Original instruction: slt v387,v384,v385
slt $t1,$t3,$t0
# Original instruction: slt v388,v385,v384
slt $t0,$t0,$t3
# Original instruction: or v389,v387,v388
or $t0,$t1,$t0
# Original instruction: addi v390,$zero,1
addi $t1,$zero,1
# Original instruction: sub v386,v390,v389
sub $t0,$t1,$t0
# Original instruction: beqz v386,label_153_else
beqz $t0,label_153_else
# Original instruction: la v391,label_6_a31
la $t0,label_6_a31
# Original instruction: lb v392,0(v391)
lb $t1,0($t0)
# Original instruction: la v393,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v394,0(v393)
lb $t0,0($t0)
# Original instruction: slt v396,v392,v394
slt $t3,$t1,$t0
# Original instruction: slt v397,v394,v392
slt $t0,$t0,$t1
# Original instruction: or v398,v396,v397
or $t1,$t3,$t0
# Original instruction: addi v399,$zero,1
addi $t0,$zero,1
# Original instruction: sub v395,v399,v398
sub $t0,$t0,$t1
# Original instruction: beqz v395,label_155_else
beqz $t0,label_155_else
# Original instruction: addiu v400,$fp,4
addiu $t1,$fp,4
# Original instruction: la v401,label_6_a31
la $t6,label_6_a31
# 
# Loading from v400 from stack into v401
# Original instruction: li v402,1
li $t3,1
# Original instruction: li v403,0
li $t4,0
label_157_mem_copy_loop:
# Original instruction: beq v403,v402,label_158_mem_copy_end
beq $t4,$t3,label_158_mem_copy_end
# Original instruction: add v404,v400,v403
add $t0,$t1,$t4
# Original instruction: lb v406,0(v404)
lb $t0,0($t0)
# Original instruction: add v405,v401,v403
add $t5,$t6,$t4
# Original instruction: sb v406,0(v405)
sb $t0,0($t5)
# Original instruction: addi v403,v403,1
addi $t4,$t4,1
# Original instruction: j label_157_mem_copy_loop
j label_157_mem_copy_loop
label_158_mem_copy_end:
# 
# Original instruction: j label_156_end
j label_156_end
label_155_else:
# Original instruction: addi v407,$zero,0
addi $t1,$zero,0
# Original instruction: addi v408,$zero,1
addi $t0,$zero,1
# Original instruction: sub v409,v407,v408
sub $t1,$t1,$t0
# Original instruction: addiu v410,$fp,-12
addiu $t0,$fp,-12
# Loading from v409 from reg into v410
# Original instruction: sw v409,0(v410)
sw $t1,0($t0)
label_156_end:
# Original instruction: j label_154_end
j label_154_end
label_153_else:
# Original instruction: addiu v411,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v412,0(v411)
lw $t0,0($t0)
# Original instruction: addi v413,$zero,2
addi $t3,$zero,2
# Original instruction: slt v415,v412,v413
slt $t1,$t0,$t3
# Original instruction: slt v416,v413,v412
slt $t0,$t3,$t0
# Original instruction: or v417,v415,v416
or $t1,$t1,$t0
# Original instruction: addi v418,$zero,1
addi $t0,$zero,1
# Original instruction: sub v414,v418,v417
sub $t0,$t0,$t1
# Original instruction: beqz v414,label_159_else
beqz $t0,label_159_else
# Original instruction: la v419,label_7_a32
la $t0,label_7_a32
# Original instruction: lb v420,0(v419)
lb $t1,0($t0)
# Original instruction: la v421,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v422,0(v421)
lb $t3,0($t0)
# Original instruction: slt v424,v420,v422
slt $t0,$t1,$t3
# Original instruction: slt v425,v422,v420
slt $t1,$t3,$t1
# Original instruction: or v426,v424,v425
or $t0,$t0,$t1
# Original instruction: addi v427,$zero,1
addi $t1,$zero,1
# Original instruction: sub v423,v427,v426
sub $t0,$t1,$t0
# Original instruction: beqz v423,label_161_else
beqz $t0,label_161_else
# Original instruction: addiu v428,$fp,4
addiu $t5,$fp,4
# Original instruction: la v429,label_7_a32
la $t0,label_7_a32
# 
# Loading from v428 from stack into v429
# Original instruction: li v430,1
li $t6,1
# Original instruction: li v431,0
li $t1,0
label_163_mem_copy_loop:
# Original instruction: beq v431,v430,label_164_mem_copy_end
beq $t1,$t6,label_164_mem_copy_end
# Original instruction: add v432,v428,v431
add $t3,$t5,$t1
# Original instruction: lb v434,0(v432)
lb $t3,0($t3)
# Original instruction: add v433,v429,v431
add $t4,$t0,$t1
# Original instruction: sb v434,0(v433)
sb $t3,0($t4)
# Original instruction: addi v431,v431,1
addi $t1,$t1,1
# Original instruction: j label_163_mem_copy_loop
j label_163_mem_copy_loop
label_164_mem_copy_end:
# 
# Original instruction: j label_162_end
j label_162_end
label_161_else:
# Original instruction: addi v435,$zero,0
addi $t1,$zero,0
# Original instruction: addi v436,$zero,1
addi $t0,$zero,1
# Original instruction: sub v437,v435,v436
sub $t0,$t1,$t0
# Original instruction: addiu v438,$fp,-12
addiu $t1,$fp,-12
# Loading from v437 from reg into v438
# Original instruction: sw v437,0(v438)
sw $t0,0($t1)
label_162_end:
# Original instruction: j label_160_end
j label_160_end
label_159_else:
# Original instruction: addiu v439,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v440,0(v439)
lw $t0,0($t0)
# Original instruction: addi v441,$zero,3
addi $t3,$zero,3
# Original instruction: slt v443,v440,v441
slt $t1,$t0,$t3
# Original instruction: slt v444,v441,v440
slt $t0,$t3,$t0
# Original instruction: or v445,v443,v444
or $t1,$t1,$t0
# Original instruction: addi v446,$zero,1
addi $t0,$zero,1
# Original instruction: sub v442,v446,v445
sub $t0,$t0,$t1
# Original instruction: beqz v442,label_165_else
beqz $t0,label_165_else
# Original instruction: la v447,label_8_a33
la $t0,label_8_a33
# Original instruction: lb v448,0(v447)
lb $t3,0($t0)
# Original instruction: la v449,label_9_empty
la $t0,label_9_empty
# Original instruction: lb v450,0(v449)
lb $t1,0($t0)
# Original instruction: slt v452,v448,v450
slt $t0,$t3,$t1
# Original instruction: slt v453,v450,v448
slt $t1,$t1,$t3
# Original instruction: or v454,v452,v453
or $t0,$t0,$t1
# Original instruction: addi v455,$zero,1
addi $t1,$zero,1
# Original instruction: sub v451,v455,v454
sub $t0,$t1,$t0
# Original instruction: beqz v451,label_167_else
beqz $t0,label_167_else
# Original instruction: addiu v456,$fp,4
addiu $t5,$fp,4
# Original instruction: la v457,label_8_a33
la $t1,label_8_a33
# 
# Loading from v456 from stack into v457
# Original instruction: li v458,1
li $t3,1
# Original instruction: li v459,0
li $t6,0
label_169_mem_copy_loop:
# Original instruction: beq v459,v458,label_170_mem_copy_end
beq $t6,$t3,label_170_mem_copy_end
# Original instruction: add v460,v456,v459
add $t0,$t5,$t6
# Original instruction: lb v462,0(v460)
lb $t0,0($t0)
# Original instruction: add v461,v457,v459
add $t4,$t1,$t6
# Original instruction: sb v462,0(v461)
sb $t0,0($t4)
# Original instruction: addi v459,v459,1
addi $t6,$t6,1
# Original instruction: j label_169_mem_copy_loop
j label_169_mem_copy_loop
label_170_mem_copy_end:
# 
# Original instruction: j label_168_end
j label_168_end
label_167_else:
# Original instruction: addi v463,$zero,0
addi $t0,$zero,0
# Original instruction: addi v464,$zero,1
addi $t1,$zero,1
# Original instruction: sub v465,v463,v464
sub $t0,$t0,$t1
# Original instruction: addiu v466,$fp,-12
addiu $t1,$fp,-12
# Loading from v465 from reg into v466
# Original instruction: sw v465,0(v466)
sw $t0,0($t1)
label_168_end:
# Original instruction: j label_166_end
j label_166_end
label_165_else:
# Original instruction: addi v467,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v468,$fp,-12
addiu $t1,$fp,-12
# Loading from v467 from reg into v468
# Original instruction: sw v467,0(v468)
sw $t0,0($t1)
label_166_end:
label_160_end:
label_154_end:
# Original instruction: j label_152_end
j label_152_end
label_151_else:
# Original instruction: addi v469,$zero,0
addi $t1,$zero,0
# Original instruction: addiu v470,$fp,-12
addiu $t0,$fp,-12
# Loading from v469 from reg into v470
# Original instruction: sw v469,0(v470)
sw $t1,0($t0)
label_152_end:
label_132_end:
label_112_end:
# Return statement start
# Original instruction: addiu v471,$fp,-12
addiu $t4,$fp,-12
# Original instruction: addiu v472,$fp,0
addiu $t0,$fp,0
# 
# Loading from v471 from stack into v472
# Original instruction: li v473,4
li $t1,4
# Original instruction: li v474,0
li $t6,0
label_171_mem_copy_loop:
# Original instruction: beq v474,v473,label_172_mem_copy_end
beq $t6,$t1,label_172_mem_copy_end
# Original instruction: add v475,v471,v474
add $t3,$t4,$t6
# Original instruction: lb v477,0(v475)
lb $t5,0($t3)
# Original instruction: add v476,v472,v474
add $t3,$t0,$t6
# Original instruction: sb v477,0(v476)
sb $t5,0($t3)
# Original instruction: addi v474,v474,1
addi $t6,$t6,1
# Original instruction: j label_171_mem_copy_loop
j label_171_mem_copy_loop
label_172_mem_copy_end:
# 
# Original instruction: jal setEND
jal setEND
# Return statement end
# BEGIN EPILOGUE
setEND:
# Original instruction: addi $sp,v184,0
addi $sp,$t2,0
# Original instruction: popRegisters
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
printGame:
# Clearing entire allocated stack frame of size 8
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_175_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_175_clean_loop
bne $t2,$zero,label_175_clean_loop
label_176_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-8
addiu $sp,$fp,-8
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v478,$sp,0
addi $t3,$sp,0
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v479,label_10_str
la $t0,label_10_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v480,$sp,0
addi $t1,$sp,0
# Loading from v479 from reg into v480
# Original instruction: sw v479,0(v480)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v482,label_11_str
la $t1,label_11_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v483,$sp,0
addi $t0,$sp,0
# Loading from v482 from reg into v483
# Original instruction: sw v482,0(v483)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v485,label_12_str
la $t1,label_12_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v486,$sp,0
addi $t0,$sp,0
# Loading from v485 from reg into v486
# Original instruction: sw v485,0(v486)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v488,label_13_str
la $t0,label_13_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v489,$sp,0
addi $t1,$sp,0
# Loading from v488 from reg into v489
# Original instruction: sw v488,0(v489)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: la v491,label_0_a11
la $t6,label_0_a11
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v492,$sp,0
addi $t4,$sp,0
# 
# Loading from v491 from stack into v492
# Original instruction: li v493,1
li $t0,1
# Original instruction: li v494,0
li $t2,0
label_177_mem_copy_loop:
# Original instruction: beq v494,v493,label_178_mem_copy_end
beq $t2,$t0,label_178_mem_copy_end
# Original instruction: add v495,v491,v494
add $t1,$t6,$t2
# Original instruction: lb v497,0(v495)
lb $t1,0($t1)
# Original instruction: add v496,v492,v494
add $t5,$t4,$t2
# Original instruction: sb v497,0(v496)
sb $t1,0($t5)
# Original instruction: addi v494,v494,1
addi $t2,$t2,1
# Original instruction: j label_177_mem_copy_loop
j label_177_mem_copy_loop
label_178_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v499,label_14_str
la $t0,label_14_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v500,$sp,0
addi $t1,$sp,0
# Loading from v499 from reg into v500
# Original instruction: sw v499,0(v500)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: la v502,label_1_a12
la $t1,label_1_a12
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v503,$sp,0
addi $t4,$sp,0
# 
# Loading from v502 from stack into v503
# Original instruction: li v504,1
li $t5,1
# Original instruction: li v505,0
li $t6,0
label_179_mem_copy_loop:
# Original instruction: beq v505,v504,label_180_mem_copy_end
beq $t6,$t5,label_180_mem_copy_end
# Original instruction: add v506,v502,v505
add $t0,$t1,$t6
# Original instruction: lb v508,0(v506)
lb $t2,0($t0)
# Original instruction: add v507,v503,v505
add $t0,$t4,$t6
# Original instruction: sb v508,0(v507)
sb $t2,0($t0)
# Original instruction: addi v505,v505,1
addi $t6,$t6,1
# Original instruction: j label_179_mem_copy_loop
j label_179_mem_copy_loop
label_180_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v510,label_15_str
la $t0,label_15_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v511,$sp,0
addi $t1,$sp,0
# Loading from v510 from reg into v511
# Original instruction: sw v510,0(v511)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: la v513,label_2_a13
la $t1,label_2_a13
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v514,$sp,0
addi $t2,$sp,0
# 
# Loading from v513 from stack into v514
# Original instruction: li v515,1
li $t6,1
# Original instruction: li v516,0
li $t5,0
label_181_mem_copy_loop:
# Original instruction: beq v516,v515,label_182_mem_copy_end
beq $t5,$t6,label_182_mem_copy_end
# Original instruction: add v517,v513,v516
add $t0,$t1,$t5
# Original instruction: lb v519,0(v517)
lb $t0,0($t0)
# Original instruction: add v518,v514,v516
add $t4,$t2,$t5
# Original instruction: sb v519,0(v518)
sb $t0,0($t4)
# Original instruction: addi v516,v516,1
addi $t5,$t5,1
# Original instruction: j label_181_mem_copy_loop
j label_181_mem_copy_loop
label_182_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v521,label_16_str
la $t1,label_16_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v522,$sp,0
addi $t0,$sp,0
# Loading from v521 from reg into v522
# Original instruction: sw v521,0(v522)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v524,label_17_str
la $t0,label_17_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v525,$sp,0
addi $t1,$sp,0
# Loading from v524 from reg into v525
# Original instruction: sw v524,0(v525)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v527,label_18_str
la $t1,label_18_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v528,$sp,0
addi $t0,$sp,0
# Loading from v527 from reg into v528
# Original instruction: sw v527,0(v528)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: la v530,label_3_a21
la $t5,label_3_a21
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v531,$sp,0
addi $t6,$sp,0
# 
# Loading from v530 from stack into v531
# Original instruction: li v532,1
li $t2,1
# Original instruction: li v533,0
li $t0,0
label_183_mem_copy_loop:
# Original instruction: beq v533,v532,label_184_mem_copy_end
beq $t0,$t2,label_184_mem_copy_end
# Original instruction: add v534,v530,v533
add $t1,$t5,$t0
# Original instruction: lb v536,0(v534)
lb $t4,0($t1)
# Original instruction: add v535,v531,v533
add $t1,$t6,$t0
# Original instruction: sb v536,0(v535)
sb $t4,0($t1)
# Original instruction: addi v533,v533,1
addi $t0,$t0,1
# Original instruction: j label_183_mem_copy_loop
j label_183_mem_copy_loop
label_184_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v538,label_19_str
la $t0,label_19_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v539,$sp,0
addi $t1,$sp,0
# Loading from v538 from reg into v539
# Original instruction: sw v538,0(v539)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: la v541,label_4_a22
la $t4,label_4_a22
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v542,$sp,0
addi $t5,$sp,0
# 
# Loading from v541 from stack into v542
# Original instruction: li v543,1
li $t0,1
# Original instruction: li v544,0
li $t2,0
label_185_mem_copy_loop:
# Original instruction: beq v544,v543,label_186_mem_copy_end
beq $t2,$t0,label_186_mem_copy_end
# Original instruction: add v545,v541,v544
add $t1,$t4,$t2
# Original instruction: lb v547,0(v545)
lb $t6,0($t1)
# Original instruction: add v546,v542,v544
add $t1,$t5,$t2
# Original instruction: sb v547,0(v546)
sb $t6,0($t1)
# Original instruction: addi v544,v544,1
addi $t2,$t2,1
# Original instruction: j label_185_mem_copy_loop
j label_185_mem_copy_loop
label_186_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v549,label_20_str
la $t1,label_20_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v550,$sp,0
addi $t0,$sp,0
# Loading from v549 from reg into v550
# Original instruction: sw v549,0(v550)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: la v552,label_5_a23
la $t0,label_5_a23
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v553,$sp,0
addi $t1,$sp,0
# 
# Loading from v552 from stack into v553
# Original instruction: li v554,1
li $t5,1
# Original instruction: li v555,0
li $t4,0
label_187_mem_copy_loop:
# Original instruction: beq v555,v554,label_188_mem_copy_end
beq $t4,$t5,label_188_mem_copy_end
# Original instruction: add v556,v552,v555
add $t2,$t0,$t4
# Original instruction: lb v558,0(v556)
lb $t6,0($t2)
# Original instruction: add v557,v553,v555
add $t2,$t1,$t4
# Original instruction: sb v558,0(v557)
sb $t6,0($t2)
# Original instruction: addi v555,v555,1
addi $t4,$t4,1
# Original instruction: j label_187_mem_copy_loop
j label_187_mem_copy_loop
label_188_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v560,label_21_str
la $t1,label_21_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v561,$sp,0
addi $t0,$sp,0
# Loading from v560 from reg into v561
# Original instruction: sw v560,0(v561)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v563,label_22_str
la $t1,label_22_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v564,$sp,0
addi $t0,$sp,0
# Loading from v563 from reg into v564
# Original instruction: sw v563,0(v564)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v566,label_23_str
la $t0,label_23_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v567,$sp,0
addi $t1,$sp,0
# Loading from v566 from reg into v567
# Original instruction: sw v566,0(v567)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: la v569,label_6_a31
la $t2,label_6_a31
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v570,$sp,0
addi $t6,$sp,0
# 
# Loading from v569 from stack into v570
# Original instruction: li v571,1
li $t4,1
# Original instruction: li v572,0
li $t0,0
label_189_mem_copy_loop:
# Original instruction: beq v572,v571,label_190_mem_copy_end
beq $t0,$t4,label_190_mem_copy_end
# Original instruction: add v573,v569,v572
add $t1,$t2,$t0
# Original instruction: lb v575,0(v573)
lb $t5,0($t1)
# Original instruction: add v574,v570,v572
add $t1,$t6,$t0
# Original instruction: sb v575,0(v574)
sb $t5,0($t1)
# Original instruction: addi v572,v572,1
addi $t0,$t0,1
# Original instruction: j label_189_mem_copy_loop
j label_189_mem_copy_loop
label_190_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v577,label_24_str
la $t0,label_24_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v578,$sp,0
addi $t1,$sp,0
# Loading from v577 from reg into v578
# Original instruction: sw v577,0(v578)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: la v580,label_7_a32
la $t6,label_7_a32
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v581,$sp,0
addi $t5,$sp,0
# 
# Loading from v580 from stack into v581
# Original instruction: li v582,1
li $t1,1
# Original instruction: li v583,0
li $t4,0
label_191_mem_copy_loop:
# Original instruction: beq v583,v582,label_192_mem_copy_end
beq $t4,$t1,label_192_mem_copy_end
# Original instruction: add v584,v580,v583
add $t0,$t6,$t4
# Original instruction: lb v586,0(v584)
lb $t0,0($t0)
# Original instruction: add v585,v581,v583
add $t2,$t5,$t4
# Original instruction: sb v586,0(v585)
sb $t0,0($t2)
# Original instruction: addi v583,v583,1
addi $t4,$t4,1
# Original instruction: j label_191_mem_copy_loop
j label_191_mem_copy_loop
label_192_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v588,label_25_str
la $t0,label_25_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v589,$sp,0
addi $t1,$sp,0
# Loading from v588 from reg into v589
# Original instruction: sw v588,0(v589)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: la v591,label_8_a33
la $t4,label_8_a33
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v592,$sp,0
addi $t0,$sp,0
# 
# Loading from v591 from stack into v592
# Original instruction: li v593,1
li $t1,1
# Original instruction: li v594,0
li $t2,0
label_193_mem_copy_loop:
# Original instruction: beq v594,v593,label_194_mem_copy_end
beq $t2,$t1,label_194_mem_copy_end
# Original instruction: add v595,v591,v594
add $t5,$t4,$t2
# Original instruction: lb v597,0(v595)
lb $t6,0($t5)
# Original instruction: add v596,v592,v594
add $t5,$t0,$t2
# Original instruction: sb v597,0(v596)
sb $t6,0($t5)
# Original instruction: addi v594,v594,1
addi $t2,$t2,1
# Original instruction: j label_193_mem_copy_loop
j label_193_mem_copy_loop
label_194_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v599,label_26_str
la $t1,label_26_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v600,$sp,0
addi $t0,$sp,0
# Loading from v599 from reg into v600
# Original instruction: sw v599,0(v600)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v602,label_27_str
la $t0,label_27_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v603,$sp,0
addi $t1,$sp,0
# Loading from v602 from reg into v603
# Original instruction: sw v602,0(v603)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v605,label_28_str
la $t1,label_28_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v606,$sp,0
addi $t0,$sp,0
# Loading from v605 from reg into v606
# Original instruction: sw v605,0(v606)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN EPILOGUE
printGameEND:
# Original instruction: addi $sp,v478,0
addi $sp,$t3,0
# Original instruction: popRegisters
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
printWinner:
# Clearing entire allocated stack frame of size 8
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_197_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_197_clean_loop
bne $t2,$zero,label_197_clean_loop
label_198_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-8
addiu $sp,$fp,-8
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v608,$sp,0
addi $t1,$sp,0
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v609,label_29_str
la $t0,label_29_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v610,$sp,0
addi $t2,$sp,0
# Loading from v609 from reg into v610
# Original instruction: sw v609,0(v610)
sw $t0,0($t2)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v612,$fp,0
addiu $t5,$fp,0
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v613,$sp,0
addi $t2,$sp,0
# 
# Loading from v612 from stack into v613
# Original instruction: li v614,4
li $t6,4
# Original instruction: li v615,0
li $t4,0
label_199_mem_copy_loop:
# Original instruction: beq v615,v614,label_200_mem_copy_end
beq $t4,$t6,label_200_mem_copy_end
# Original instruction: add v616,v612,v615
add $t0,$t5,$t4
# Original instruction: lb v618,0(v616)
lb $t3,0($t0)
# Original instruction: add v617,v613,v615
add $t0,$t2,$t4
# Original instruction: sb v618,0(v617)
sb $t3,0($t0)
# Original instruction: addi v615,v615,1
addi $t4,$t4,1
# Original instruction: j label_199_mem_copy_loop
j label_199_mem_copy_loop
label_200_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v620,label_30_str
la $t2,label_30_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v621,$sp,0
addi $t0,$sp,0
# Loading from v620 from reg into v621
# Original instruction: sw v620,0(v621)
sw $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN EPILOGUE
printWinnerEND:
# Original instruction: addi $sp,v608,0
addi $sp,$t1,0
# Original instruction: popRegisters
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
switchPlayer:
# Clearing entire allocated stack frame of size 8
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_203_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_203_clean_loop
bne $t2,$zero,label_203_clean_loop
label_204_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-8
addiu $sp,$fp,-8
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
# Original instruction: addi v623,$sp,0
addi $t3,$sp,0
# END PROLOGUE
# Original instruction: addiu v624,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v625,0(v624)
lw $t1,0($t0)
# Original instruction: addi v626,$zero,1
addi $t0,$zero,1
# Original instruction: slt v628,v625,v626
slt $t2,$t1,$t0
# Original instruction: slt v629,v626,v625
slt $t0,$t0,$t1
# Original instruction: or v630,v628,v629
or $t0,$t2,$t0
# Original instruction: addi v631,$zero,1
addi $t1,$zero,1
# Original instruction: sub v627,v631,v630
sub $t0,$t1,$t0
# Original instruction: beqz v627,label_205_else
beqz $t0,label_205_else
# Return statement start
# Original instruction: addi v632,$zero,2
addi $t0,$zero,2
# Original instruction: addiu v633,$fp,0
addiu $t1,$fp,0
# Loading from v632 from reg into v633
# Original instruction: sw v632,0(v633)
sw $t0,0($t1)
# Original instruction: jal switchPlayerEND
jal switchPlayerEND
# Return statement end
# Original instruction: j label_206_end
j label_206_end
label_205_else:
# Return statement start
# Original instruction: addi v634,$zero,1
addi $t0,$zero,1
# Original instruction: addiu v635,$fp,0
addiu $t1,$fp,0
# Loading from v634 from reg into v635
# Original instruction: sw v634,0(v635)
sw $t0,0($t1)
# Original instruction: jal switchPlayerEND
jal switchPlayerEND
# Return statement end
label_206_end:
# BEGIN EPILOGUE
switchPlayerEND:
# Original instruction: addi $sp,v623,0
addi $sp,$t3,0
# Original instruction: popRegisters
# Registers:
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
get_mark:
# Clearing entire allocated stack frame of size 8
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_209_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_209_clean_loop
bne $t2,$zero,label_209_clean_loop
label_210_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-8
addiu $sp,$fp,-8
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
# Original instruction: addi v636,$sp,0
addi $t1,$sp,0
# END PROLOGUE
# Original instruction: addiu v637,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v638,0(v637)
lw $t0,0($t0)
# Original instruction: addi v639,$zero,1
addi $t2,$zero,1
# Original instruction: slt v641,v638,v639
slt $t3,$t0,$t2
# Original instruction: slt v642,v639,v638
slt $t0,$t2,$t0
# Original instruction: or v643,v641,v642
or $t0,$t3,$t0
# Original instruction: addi v644,$zero,1
addi $t2,$zero,1
# Original instruction: sub v640,v644,v643
sub $t0,$t2,$t0
# Original instruction: beqz v640,label_211_else
beqz $t0,label_211_else
# Return statement start
# Original instruction: addi v645,$zero,88
addi $t0,$zero,88
# Original instruction: addiu v646,$fp,0
addiu $t2,$fp,0
# Loading from v645 from reg into v646
# Original instruction: sb v645,0(v646)
sb $t0,0($t2)
# Original instruction: jal get_markEND
jal get_markEND
# Return statement end
# Original instruction: j label_212_end
j label_212_end
label_211_else:
# Return statement start
# Original instruction: addi v647,$zero,79
addi $t0,$zero,79
# Original instruction: addiu v648,$fp,0
addiu $t2,$fp,0
# Loading from v647 from reg into v648
# Original instruction: sb v647,0(v648)
sb $t0,0($t2)
# Original instruction: jal get_markEND
jal get_markEND
# Return statement end
label_212_end:
# BEGIN EPILOGUE
get_markEND:
# Original instruction: addi $sp,v636,0
addi $sp,$t1,0
# Original instruction: popRegisters
# Registers:
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
selectmove:
# Clearing entire allocated stack frame of size 28
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_215_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,29
slti $t2,$t0,29
# Original instruction: bne $t2,$zero,label_215_clean_loop
bne $t2,$zero,label_215_clean_loop
label_216_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-28
addiu $sp,$fp,-28
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v649,$sp,0
addi $t2,$sp,0
# END PROLOGUE
# Original instruction: addi v650,$zero,1
addi $t1,$zero,1
# Original instruction: addiu v651,$fp,-20
addiu $t0,$fp,-20
# Loading from v650 from reg into v651
# Original instruction: sw v650,0(v651)
sw $t1,0($t0)
label_217_while_start:
# Original instruction: addiu v652,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v653,0(v652)
lw $t0,0($t0)
# Original instruction: beqz v653,label_218_while_end
beqz $t0,label_218_while_end
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v654,label_31_str
la $t0,label_31_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v655,$sp,0
addi $t1,$sp,0
# Loading from v654 from reg into v655
# Original instruction: sw v654,0(v655)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v657,$fp,0
addiu $t1,$fp,0
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v658,$sp,0
addi $t3,$sp,0
# 
# Loading from v657 from stack into v658
# Original instruction: li v659,4
li $t6,4
# Original instruction: li v660,0
li $t4,0
label_219_mem_copy_loop:
# Original instruction: beq v660,v659,label_220_mem_copy_end
beq $t4,$t6,label_220_mem_copy_end
# Original instruction: add v661,v657,v660
add $t0,$t1,$t4
# Original instruction: lb v663,0(v661)
lb $t0,0($t0)
# Original instruction: add v662,v658,v660
add $t5,$t3,$t4
# Original instruction: sb v663,0(v662)
sb $t0,0($t5)
# Original instruction: addi v660,v660,1
addi $t4,$t4,1
# Original instruction: j label_219_mem_copy_loop
j label_219_mem_copy_loop
label_220_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v665,label_32_str
la $t0,label_32_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v666,$sp,0
addi $t1,$sp,0
# Loading from v665 from reg into v666
# Original instruction: sw v665,0(v666)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR read_c
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal read_c
jal read_c
# BACK FROM FUNCTION
# Original instruction: addi v668,$sp,0
addi $t1,$sp,0
# Original instruction: addiu v669,$fp,-12
addiu $t3,$fp,-12
# 
# Loading from v668 from stack into v669
# Original instruction: li v670,1
li $t5,1
# Original instruction: li v671,0
li $t6,0
label_221_mem_copy_loop:
# Original instruction: beq v671,v670,label_222_mem_copy_end
beq $t6,$t5,label_222_mem_copy_end
# Original instruction: add v672,v668,v671
add $t0,$t1,$t6
# Original instruction: lb v674,0(v672)
lb $t0,0($t0)
# Original instruction: add v673,v669,v671
add $t4,$t3,$t6
# Original instruction: sb v674,0(v673)
sb $t0,0($t4)
# Original instruction: addi v671,v671,1
addi $t6,$t6,1
# Original instruction: j label_221_mem_copy_loop
j label_221_mem_copy_loop
label_222_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR read_i
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal read_i
jal read_i
# BACK FROM FUNCTION
# Original instruction: addi v675,$sp,0
addi $t1,$sp,0
# Original instruction: addiu v676,$fp,-16
addiu $t4,$fp,-16
# 
# Loading from v675 from stack into v676
# Original instruction: li v677,4
li $t0,4
# Original instruction: li v678,0
li $t5,0
label_223_mem_copy_loop:
# Original instruction: beq v678,v677,label_224_mem_copy_end
beq $t5,$t0,label_224_mem_copy_end
# Original instruction: add v679,v675,v678
add $t3,$t1,$t5
# Original instruction: lb v681,0(v679)
lb $t3,0($t3)
# Original instruction: add v680,v676,v678
add $t6,$t4,$t5
# Original instruction: sb v681,0(v680)
sb $t3,0($t6)
# Original instruction: addi v678,v678,1
addi $t5,$t5,1
# Original instruction: j label_223_mem_copy_loop
j label_223_mem_copy_loop
label_224_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR get_mark
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v682,$fp,0
addiu $t3,$fp,0
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v683,$sp,0
addi $t4,$sp,0
# 
# Loading from v682 from stack into v683
# Original instruction: li v684,4
li $t5,4
# Original instruction: li v685,0
li $t1,0
label_225_mem_copy_loop:
# Original instruction: beq v685,v684,label_226_mem_copy_end
beq $t1,$t5,label_226_mem_copy_end
# Original instruction: add v686,v682,v685
add $t0,$t3,$t1
# Original instruction: lb v688,0(v686)
lb $t6,0($t0)
# Original instruction: add v687,v683,v685
add $t0,$t4,$t1
# Original instruction: sb v688,0(v687)
sb $t6,0($t0)
# Original instruction: addi v685,v685,1
addi $t1,$t1,1
# Original instruction: j label_225_mem_copy_loop
j label_225_mem_copy_loop
label_226_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal get_mark
jal get_mark
# BACK FROM FUNCTION
# Original instruction: addi v689,$sp,0
addi $t5,$sp,0
# Original instruction: addiu v690,$fp,-28
addiu $t3,$fp,-28
# 
# Loading from v689 from stack into v690
# Original instruction: li v691,1
li $t6,1
# Original instruction: li v692,0
li $t1,0
label_227_mem_copy_loop:
# Original instruction: beq v692,v691,label_228_mem_copy_end
beq $t1,$t6,label_228_mem_copy_end
# Original instruction: add v693,v689,v692
add $t0,$t5,$t1
# Original instruction: lb v695,0(v693)
lb $t0,0($t0)
# Original instruction: add v694,v690,v692
add $t4,$t3,$t1
# Original instruction: sb v695,0(v694)
sb $t0,0($t4)
# Original instruction: addi v692,v692,1
addi $t1,$t1,1
# Original instruction: j label_227_mem_copy_loop
j label_227_mem_copy_loop
label_228_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR set
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addiu v696,$fp,-12
addiu $t4,$fp,-12
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v697,$sp,0
addi $t0,$sp,0
# 
# Loading from v696 from stack into v697
# Original instruction: li v698,1
li $t6,1
# Original instruction: li v699,0
li $t3,0
label_229_mem_copy_loop:
# Original instruction: beq v699,v698,label_230_mem_copy_end
beq $t3,$t6,label_230_mem_copy_end
# Original instruction: add v700,v696,v699
add $t1,$t4,$t3
# Original instruction: lb v702,0(v700)
lb $t1,0($t1)
# Original instruction: add v701,v697,v699
add $t5,$t0,$t3
# Original instruction: sb v702,0(v701)
sb $t1,0($t5)
# Original instruction: addi v699,v699,1
addi $t3,$t3,1
# Original instruction: j label_229_mem_copy_loop
j label_229_mem_copy_loop
label_230_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v703,$fp,-16
addiu $t3,$fp,-16
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v704,$sp,0
addi $t5,$sp,0
# 
# Loading from v703 from stack into v704
# Original instruction: li v705,4
li $t1,4
# Original instruction: li v706,0
li $t4,0
label_231_mem_copy_loop:
# Original instruction: beq v706,v705,label_232_mem_copy_end
beq $t4,$t1,label_232_mem_copy_end
# Original instruction: add v707,v703,v706
add $t0,$t3,$t4
# Original instruction: lb v709,0(v707)
lb $t0,0($t0)
# Original instruction: add v708,v704,v706
add $t6,$t5,$t4
# Original instruction: sb v709,0(v708)
sb $t0,0($t6)
# Original instruction: addi v706,v706,1
addi $t4,$t4,1
# Original instruction: j label_231_mem_copy_loop
j label_231_mem_copy_loop
label_232_mem_copy_end:
# 
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addiu v710,$fp,-28
addiu $t1,$fp,-28
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v711,$sp,0
addi $t5,$sp,0
# 
# Loading from v710 from stack into v711
# Original instruction: li v712,1
li $t6,1
# Original instruction: li v713,0
li $t0,0
label_233_mem_copy_loop:
# Original instruction: beq v713,v712,label_234_mem_copy_end
beq $t0,$t6,label_234_mem_copy_end
# Original instruction: add v714,v710,v713
add $t3,$t1,$t0
# Original instruction: lb v716,0(v714)
lb $t3,0($t3)
# Original instruction: add v715,v711,v713
add $t4,$t5,$t0
# Original instruction: sb v716,0(v715)
sb $t3,0($t4)
# Original instruction: addi v713,v713,1
addi $t0,$t0,1
# Original instruction: j label_233_mem_copy_loop
j label_233_mem_copy_loop
label_234_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal set
jal set
# BACK FROM FUNCTION
# Original instruction: addi v717,$sp,0
addi $t5,$sp,0
# Original instruction: addiu v718,$fp,-24
addiu $t1,$fp,-24
# 
# Loading from v717 from stack into v718
# Original instruction: li v719,4
li $t6,4
# Original instruction: li v720,0
li $t0,0
label_235_mem_copy_loop:
# Original instruction: beq v720,v719,label_236_mem_copy_end
beq $t0,$t6,label_236_mem_copy_end
# Original instruction: add v721,v717,v720
add $t3,$t5,$t0
# Original instruction: lb v723,0(v721)
lb $t4,0($t3)
# Original instruction: add v722,v718,v720
add $t3,$t1,$t0
# Original instruction: sb v723,0(v722)
sb $t4,0($t3)
# Original instruction: addi v720,v720,1
addi $t0,$t0,1
# Original instruction: j label_235_mem_copy_loop
j label_235_mem_copy_loop
label_236_mem_copy_end:
# 
# Original instruction: addiu v724,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v725,0(v724)
lw $t3,0($t0)
# Original instruction: addi v726,$zero,0
addi $t1,$zero,0
# Original instruction: slt v728,v725,v726
slt $t0,$t3,$t1
# Original instruction: slt v729,v726,v725
slt $t1,$t1,$t3
# Original instruction: or v730,v728,v729
or $t1,$t0,$t1
# Original instruction: addi v731,$zero,1
addi $t0,$zero,1
# Original instruction: sub v727,v731,v730
sub $t0,$t0,$t1
# Original instruction: beqz v727,label_237_else
beqz $t0,label_237_else
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v732,label_33_str
la $t0,label_33_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v733,$sp,0
addi $t1,$sp,0
# Loading from v732 from reg into v733
# Original instruction: sw v732,0(v733)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# Original instruction: j label_238_end
j label_238_end
label_237_else:
# Original instruction: addiu v735,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v736,0(v735)
lw $t0,0($t0)
# Original instruction: addi v737,$zero,0
addi $t1,$zero,0
# Original instruction: addi v738,$zero,1
addi $t3,$zero,1
# Original instruction: sub v739,v737,v738
sub $t1,$t1,$t3
# Original instruction: slt v741,v736,v739
slt $t3,$t0,$t1
# Original instruction: slt v742,v739,v736
slt $t0,$t1,$t0
# Original instruction: or v743,v741,v742
or $t0,$t3,$t0
# Original instruction: addi v744,$zero,1
addi $t1,$zero,1
# Original instruction: sub v740,v744,v743
sub $t0,$t1,$t0
# Original instruction: beqz v740,label_239_else
beqz $t0,label_239_else
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v745,label_34_str
la $t1,label_34_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v746,$sp,0
addi $t0,$sp,0
# Loading from v745 from reg into v746
# Original instruction: sw v745,0(v746)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# Original instruction: j label_240_end
j label_240_end
label_239_else:
# Original instruction: addi v748,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v749,$fp,-20
addiu $t1,$fp,-20
# Loading from v748 from reg into v749
# Original instruction: sw v748,0(v749)
sw $t0,0($t1)
label_240_end:
label_238_end:
# Original instruction: j label_217_while_start
j label_217_while_start
label_218_while_end:
# BEGIN EPILOGUE
selectmoveEND:
# Original instruction: addi $sp,v649,0
addi $sp,$t2,0
# Original instruction: popRegisters
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
won:
# Clearing entire allocated stack frame of size 12
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_243_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,13
slti $t2,$t0,13
# Original instruction: bne $t2,$zero,label_243_clean_loop
bne $t2,$zero,label_243_clean_loop
label_244_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-12
addiu $sp,$fp,-12
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v750,$sp,0
addi $t1,$sp,0
# END PROLOGUE
# Original instruction: addi v751,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v752,$fp,-12
addiu $t2,$fp,-12
# Loading from v751 from reg into v752
# Original instruction: sw v751,0(v752)
sw $t0,0($t2)
# Original instruction: la v753,label_0_a11
la $t0,label_0_a11
# Original instruction: lb v754,0(v753)
lb $t3,0($t0)
# Original instruction: addiu v755,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v756,0(v755)
lb $t0,0($t0)
# Original instruction: slt v758,v754,v756
slt $t2,$t3,$t0
# Original instruction: slt v759,v756,v754
slt $t0,$t0,$t3
# Original instruction: or v760,v758,v759
or $t0,$t2,$t0
# Original instruction: addi v761,$zero,1
addi $t2,$zero,1
# Original instruction: sub v757,v761,v760
sub $t0,$t2,$t0
# Original instruction: beqz v757,label_245_else
beqz $t0,label_245_else
# Original instruction: la v762,label_3_a21
la $t0,label_3_a21
# Original instruction: lb v763,0(v762)
lb $t2,0($t0)
# Original instruction: addiu v764,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v765,0(v764)
lb $t0,0($t0)
# Original instruction: slt v767,v763,v765
slt $t3,$t2,$t0
# Original instruction: slt v768,v765,v763
slt $t0,$t0,$t2
# Original instruction: or v769,v767,v768
or $t0,$t3,$t0
# Original instruction: addi v770,$zero,1
addi $t2,$zero,1
# Original instruction: sub v766,v770,v769
sub $t0,$t2,$t0
# Original instruction: beqz v766,label_247_else
beqz $t0,label_247_else
# Original instruction: la v771,label_6_a31
la $t0,label_6_a31
# Original instruction: lb v772,0(v771)
lb $t0,0($t0)
# Original instruction: addiu v773,$fp,4
addiu $t2,$fp,4
# Original instruction: lb v774,0(v773)
lb $t2,0($t2)
# Original instruction: slt v776,v772,v774
slt $t3,$t0,$t2
# Original instruction: slt v777,v774,v772
slt $t0,$t2,$t0
# Original instruction: or v778,v776,v777
or $t0,$t3,$t0
# Original instruction: addi v779,$zero,1
addi $t2,$zero,1
# Original instruction: sub v775,v779,v778
sub $t0,$t2,$t0
# Original instruction: beqz v775,label_249_else
beqz $t0,label_249_else
# Original instruction: addi v780,$zero,1
addi $t0,$zero,1
# Original instruction: addiu v781,$fp,-12
addiu $t2,$fp,-12
# Loading from v780 from reg into v781
# Original instruction: sw v780,0(v781)
sw $t0,0($t2)
# Original instruction: j label_250_end
j label_250_end
label_249_else:
label_250_end:
# Original instruction: j label_248_end
j label_248_end
label_247_else:
# Original instruction: la v782,label_4_a22
la $t0,label_4_a22
# Original instruction: lb v783,0(v782)
lb $t0,0($t0)
# Original instruction: addiu v784,$fp,4
addiu $t2,$fp,4
# Original instruction: lb v785,0(v784)
lb $t3,0($t2)
# Original instruction: slt v787,v783,v785
slt $t2,$t0,$t3
# Original instruction: slt v788,v785,v783
slt $t0,$t3,$t0
# Original instruction: or v789,v787,v788
or $t2,$t2,$t0
# Original instruction: addi v790,$zero,1
addi $t0,$zero,1
# Original instruction: sub v786,v790,v789
sub $t0,$t0,$t2
# Original instruction: beqz v786,label_251_else
beqz $t0,label_251_else
# Original instruction: la v791,label_8_a33
la $t0,label_8_a33
# Original instruction: lb v792,0(v791)
lb $t2,0($t0)
# Original instruction: addiu v793,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v794,0(v793)
lb $t3,0($t0)
# Original instruction: slt v796,v792,v794
slt $t0,$t2,$t3
# Original instruction: slt v797,v794,v792
slt $t2,$t3,$t2
# Original instruction: or v798,v796,v797
or $t2,$t0,$t2
# Original instruction: addi v799,$zero,1
addi $t0,$zero,1
# Original instruction: sub v795,v799,v798
sub $t0,$t0,$t2
# Original instruction: beqz v795,label_253_else
beqz $t0,label_253_else
# Original instruction: addi v800,$zero,1
addi $t2,$zero,1
# Original instruction: addiu v801,$fp,-12
addiu $t0,$fp,-12
# Loading from v800 from reg into v801
# Original instruction: sw v800,0(v801)
sw $t2,0($t0)
# Original instruction: j label_254_end
j label_254_end
label_253_else:
label_254_end:
# Original instruction: j label_252_end
j label_252_end
label_251_else:
# Original instruction: la v802,label_1_a12
la $t0,label_1_a12
# Original instruction: lb v803,0(v802)
lb $t2,0($t0)
# Original instruction: addiu v804,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v805,0(v804)
lb $t0,0($t0)
# Original instruction: slt v807,v803,v805
slt $t3,$t2,$t0
# Original instruction: slt v808,v805,v803
slt $t0,$t0,$t2
# Original instruction: or v809,v807,v808
or $t2,$t3,$t0
# Original instruction: addi v810,$zero,1
addi $t0,$zero,1
# Original instruction: sub v806,v810,v809
sub $t0,$t0,$t2
# Original instruction: beqz v806,label_255_else
beqz $t0,label_255_else
# Original instruction: la v811,label_2_a13
la $t0,label_2_a13
# Original instruction: lb v812,0(v811)
lb $t3,0($t0)
# Original instruction: addiu v813,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v814,0(v813)
lb $t0,0($t0)
# Original instruction: slt v816,v812,v814
slt $t2,$t3,$t0
# Original instruction: slt v817,v814,v812
slt $t0,$t0,$t3
# Original instruction: or v818,v816,v817
or $t2,$t2,$t0
# Original instruction: addi v819,$zero,1
addi $t0,$zero,1
# Original instruction: sub v815,v819,v818
sub $t0,$t0,$t2
# Original instruction: beqz v815,label_257_else
beqz $t0,label_257_else
# Original instruction: addi v820,$zero,1
addi $t0,$zero,1
# Original instruction: addiu v821,$fp,-12
addiu $t2,$fp,-12
# Loading from v820 from reg into v821
# Original instruction: sw v820,0(v821)
sw $t0,0($t2)
# Original instruction: j label_258_end
j label_258_end
label_257_else:
label_258_end:
# Original instruction: j label_256_end
j label_256_end
label_255_else:
label_256_end:
label_252_end:
label_248_end:
# Original instruction: j label_246_end
j label_246_end
label_245_else:
label_246_end:
# Original instruction: la v822,label_1_a12
la $t0,label_1_a12
# Original instruction: lb v823,0(v822)
lb $t2,0($t0)
# Original instruction: addiu v824,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v825,0(v824)
lb $t3,0($t0)
# Original instruction: slt v827,v823,v825
slt $t0,$t2,$t3
# Original instruction: slt v828,v825,v823
slt $t2,$t3,$t2
# Original instruction: or v829,v827,v828
or $t2,$t0,$t2
# Original instruction: addi v830,$zero,1
addi $t0,$zero,1
# Original instruction: sub v826,v830,v829
sub $t0,$t0,$t2
# Original instruction: beqz v826,label_259_else
beqz $t0,label_259_else
# Original instruction: la v831,label_4_a22
la $t0,label_4_a22
# Original instruction: lb v832,0(v831)
lb $t2,0($t0)
# Original instruction: addiu v833,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v834,0(v833)
lb $t3,0($t0)
# Original instruction: slt v836,v832,v834
slt $t0,$t2,$t3
# Original instruction: slt v837,v834,v832
slt $t2,$t3,$t2
# Original instruction: or v838,v836,v837
or $t2,$t0,$t2
# Original instruction: addi v839,$zero,1
addi $t0,$zero,1
# Original instruction: sub v835,v839,v838
sub $t0,$t0,$t2
# Original instruction: beqz v835,label_261_else
beqz $t0,label_261_else
# Original instruction: la v840,label_7_a32
la $t0,label_7_a32
# Original instruction: lb v841,0(v840)
lb $t2,0($t0)
# Original instruction: addiu v842,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v843,0(v842)
lb $t3,0($t0)
# Original instruction: slt v845,v841,v843
slt $t0,$t2,$t3
# Original instruction: slt v846,v843,v841
slt $t2,$t3,$t2
# Original instruction: or v847,v845,v846
or $t2,$t0,$t2
# Original instruction: addi v848,$zero,1
addi $t0,$zero,1
# Original instruction: sub v844,v848,v847
sub $t0,$t0,$t2
# Original instruction: beqz v844,label_263_else
beqz $t0,label_263_else
# Original instruction: addi v849,$zero,1
addi $t0,$zero,1
# Original instruction: addiu v850,$fp,-12
addiu $t2,$fp,-12
# Loading from v849 from reg into v850
# Original instruction: sw v849,0(v850)
sw $t0,0($t2)
# Original instruction: j label_264_end
j label_264_end
label_263_else:
label_264_end:
# Original instruction: j label_262_end
j label_262_end
label_261_else:
label_262_end:
# Original instruction: j label_260_end
j label_260_end
label_259_else:
label_260_end:
# Original instruction: la v851,label_2_a13
la $t0,label_2_a13
# Original instruction: lb v852,0(v851)
lb $t0,0($t0)
# Original instruction: addiu v853,$fp,4
addiu $t2,$fp,4
# Original instruction: lb v854,0(v853)
lb $t2,0($t2)
# Original instruction: slt v856,v852,v854
slt $t3,$t0,$t2
# Original instruction: slt v857,v854,v852
slt $t0,$t2,$t0
# Original instruction: or v858,v856,v857
or $t2,$t3,$t0
# Original instruction: addi v859,$zero,1
addi $t0,$zero,1
# Original instruction: sub v855,v859,v858
sub $t0,$t0,$t2
# Original instruction: beqz v855,label_265_else
beqz $t0,label_265_else
# Original instruction: la v860,label_5_a23
la $t0,label_5_a23
# Original instruction: lb v861,0(v860)
lb $t3,0($t0)
# Original instruction: addiu v862,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v863,0(v862)
lb $t2,0($t0)
# Original instruction: slt v865,v861,v863
slt $t0,$t3,$t2
# Original instruction: slt v866,v863,v861
slt $t2,$t2,$t3
# Original instruction: or v867,v865,v866
or $t0,$t0,$t2
# Original instruction: addi v868,$zero,1
addi $t2,$zero,1
# Original instruction: sub v864,v868,v867
sub $t0,$t2,$t0
# Original instruction: beqz v864,label_267_else
beqz $t0,label_267_else
# Original instruction: la v869,label_8_a33
la $t0,label_8_a33
# Original instruction: lb v870,0(v869)
lb $t0,0($t0)
# Original instruction: addiu v871,$fp,4
addiu $t2,$fp,4
# Original instruction: lb v872,0(v871)
lb $t3,0($t2)
# Original instruction: slt v874,v870,v872
slt $t2,$t0,$t3
# Original instruction: slt v875,v872,v870
slt $t0,$t3,$t0
# Original instruction: or v876,v874,v875
or $t2,$t2,$t0
# Original instruction: addi v877,$zero,1
addi $t0,$zero,1
# Original instruction: sub v873,v877,v876
sub $t0,$t0,$t2
# Original instruction: beqz v873,label_269_else
beqz $t0,label_269_else
# Original instruction: addi v878,$zero,1
addi $t2,$zero,1
# Original instruction: addiu v879,$fp,-12
addiu $t0,$fp,-12
# Loading from v878 from reg into v879
# Original instruction: sw v878,0(v879)
sw $t2,0($t0)
# Original instruction: j label_270_end
j label_270_end
label_269_else:
label_270_end:
# Original instruction: j label_268_end
j label_268_end
label_267_else:
# Original instruction: la v880,label_4_a22
la $t0,label_4_a22
# Original instruction: lb v881,0(v880)
lb $t3,0($t0)
# Original instruction: addiu v882,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v883,0(v882)
lb $t0,0($t0)
# Original instruction: slt v885,v881,v883
slt $t2,$t3,$t0
# Original instruction: slt v886,v883,v881
slt $t0,$t0,$t3
# Original instruction: or v887,v885,v886
or $t2,$t2,$t0
# Original instruction: addi v888,$zero,1
addi $t0,$zero,1
# Original instruction: sub v884,v888,v887
sub $t0,$t0,$t2
# Original instruction: beqz v884,label_271_else
beqz $t0,label_271_else
# Original instruction: la v889,label_6_a31
la $t0,label_6_a31
# Original instruction: lb v890,0(v889)
lb $t3,0($t0)
# Original instruction: addiu v891,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v892,0(v891)
lb $t0,0($t0)
# Original instruction: slt v894,v890,v892
slt $t2,$t3,$t0
# Original instruction: slt v895,v892,v890
slt $t0,$t0,$t3
# Original instruction: or v896,v894,v895
or $t0,$t2,$t0
# Original instruction: addi v897,$zero,1
addi $t2,$zero,1
# Original instruction: sub v893,v897,v896
sub $t0,$t2,$t0
# Original instruction: beqz v893,label_273_else
beqz $t0,label_273_else
# Original instruction: addi v898,$zero,1
addi $t2,$zero,1
# Original instruction: addiu v899,$fp,-12
addiu $t0,$fp,-12
# Loading from v898 from reg into v899
# Original instruction: sw v898,0(v899)
sw $t2,0($t0)
# Original instruction: j label_274_end
j label_274_end
label_273_else:
label_274_end:
# Original instruction: j label_272_end
j label_272_end
label_271_else:
label_272_end:
label_268_end:
# Original instruction: j label_266_end
j label_266_end
label_265_else:
label_266_end:
# Original instruction: la v900,label_3_a21
la $t0,label_3_a21
# Original instruction: lb v901,0(v900)
lb $t2,0($t0)
# Original instruction: addiu v902,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v903,0(v902)
lb $t0,0($t0)
# Original instruction: slt v905,v901,v903
slt $t3,$t2,$t0
# Original instruction: slt v906,v903,v901
slt $t0,$t0,$t2
# Original instruction: or v907,v905,v906
or $t0,$t3,$t0
# Original instruction: addi v908,$zero,1
addi $t2,$zero,1
# Original instruction: sub v904,v908,v907
sub $t0,$t2,$t0
# Original instruction: beqz v904,label_275_else
beqz $t0,label_275_else
# Original instruction: la v909,label_4_a22
la $t0,label_4_a22
# Original instruction: lb v910,0(v909)
lb $t2,0($t0)
# Original instruction: addiu v911,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v912,0(v911)
lb $t3,0($t0)
# Original instruction: slt v914,v910,v912
slt $t0,$t2,$t3
# Original instruction: slt v915,v912,v910
slt $t2,$t3,$t2
# Original instruction: or v916,v914,v915
or $t2,$t0,$t2
# Original instruction: addi v917,$zero,1
addi $t0,$zero,1
# Original instruction: sub v913,v917,v916
sub $t0,$t0,$t2
# Original instruction: beqz v913,label_277_else
beqz $t0,label_277_else
# Original instruction: la v918,label_5_a23
la $t0,label_5_a23
# Original instruction: lb v919,0(v918)
lb $t3,0($t0)
# Original instruction: addiu v920,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v921,0(v920)
lb $t0,0($t0)
# Original instruction: slt v923,v919,v921
slt $t2,$t3,$t0
# Original instruction: slt v924,v921,v919
slt $t0,$t0,$t3
# Original instruction: or v925,v923,v924
or $t0,$t2,$t0
# Original instruction: addi v926,$zero,1
addi $t2,$zero,1
# Original instruction: sub v922,v926,v925
sub $t0,$t2,$t0
# Original instruction: beqz v922,label_279_else
beqz $t0,label_279_else
# Original instruction: addi v927,$zero,1
addi $t0,$zero,1
# Original instruction: addiu v928,$fp,-12
addiu $t2,$fp,-12
# Loading from v927 from reg into v928
# Original instruction: sw v927,0(v928)
sw $t0,0($t2)
# Original instruction: j label_280_end
j label_280_end
label_279_else:
label_280_end:
# Original instruction: j label_278_end
j label_278_end
label_277_else:
label_278_end:
# Original instruction: j label_276_end
j label_276_end
label_275_else:
label_276_end:
# Original instruction: la v929,label_6_a31
la $t0,label_6_a31
# Original instruction: lb v930,0(v929)
lb $t2,0($t0)
# Original instruction: addiu v931,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v932,0(v931)
lb $t3,0($t0)
# Original instruction: slt v934,v930,v932
slt $t0,$t2,$t3
# Original instruction: slt v935,v932,v930
slt $t2,$t3,$t2
# Original instruction: or v936,v934,v935
or $t2,$t0,$t2
# Original instruction: addi v937,$zero,1
addi $t0,$zero,1
# Original instruction: sub v933,v937,v936
sub $t0,$t0,$t2
# Original instruction: beqz v933,label_281_else
beqz $t0,label_281_else
# Original instruction: la v938,label_7_a32
la $t0,label_7_a32
# Original instruction: lb v939,0(v938)
lb $t3,0($t0)
# Original instruction: addiu v940,$fp,4
addiu $t0,$fp,4
# Original instruction: lb v941,0(v940)
lb $t0,0($t0)
# Original instruction: slt v943,v939,v941
slt $t2,$t3,$t0
# Original instruction: slt v944,v941,v939
slt $t0,$t0,$t3
# Original instruction: or v945,v943,v944
or $t0,$t2,$t0
# Original instruction: addi v946,$zero,1
addi $t2,$zero,1
# Original instruction: sub v942,v946,v945
sub $t0,$t2,$t0
# Original instruction: beqz v942,label_283_else
beqz $t0,label_283_else
# Original instruction: la v947,label_8_a33
la $t0,label_8_a33
# Original instruction: lb v948,0(v947)
lb $t0,0($t0)
# Original instruction: addiu v949,$fp,4
addiu $t2,$fp,4
# Original instruction: lb v950,0(v949)
lb $t2,0($t2)
# Original instruction: slt v952,v948,v950
slt $t3,$t0,$t2
# Original instruction: slt v953,v950,v948
slt $t0,$t2,$t0
# Original instruction: or v954,v952,v953
or $t0,$t3,$t0
# Original instruction: addi v955,$zero,1
addi $t2,$zero,1
# Original instruction: sub v951,v955,v954
sub $t0,$t2,$t0
# Original instruction: beqz v951,label_285_else
beqz $t0,label_285_else
# Original instruction: addi v956,$zero,1
addi $t0,$zero,1
# Original instruction: addiu v957,$fp,-12
addiu $t2,$fp,-12
# Loading from v956 from reg into v957
# Original instruction: sw v956,0(v957)
sw $t0,0($t2)
# Original instruction: j label_286_end
j label_286_end
label_285_else:
label_286_end:
# Original instruction: j label_284_end
j label_284_end
label_283_else:
label_284_end:
# Original instruction: j label_282_end
j label_282_end
label_281_else:
label_282_end:
# Return statement start
# Original instruction: addiu v958,$fp,-12
addiu $t4,$fp,-12
# Original instruction: addiu v959,$fp,0
addiu $t2,$fp,0
# 
# Loading from v958 from stack into v959
# Original instruction: li v960,4
li $t3,4
# Original instruction: li v961,0
li $t6,0
label_287_mem_copy_loop:
# Original instruction: beq v961,v960,label_288_mem_copy_end
beq $t6,$t3,label_288_mem_copy_end
# Original instruction: add v962,v958,v961
add $t0,$t4,$t6
# Original instruction: lb v964,0(v962)
lb $t0,0($t0)
# Original instruction: add v963,v959,v961
add $t5,$t2,$t6
# Original instruction: sb v964,0(v963)
sb $t0,0($t5)
# Original instruction: addi v961,v961,1
addi $t6,$t6,1
# Original instruction: j label_287_mem_copy_loop
j label_287_mem_copy_loop
label_288_mem_copy_end:
# 
# Original instruction: jal wonEND
jal wonEND
# Return statement end
# BEGIN EPILOGUE
wonEND:
# Original instruction: addi $sp,v750,0
addi $sp,$t1,0
# Original instruction: popRegisters
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

.text
# BEGIN PROLOGUE
main:
# Clearing entire allocated stack frame of size 24
# Mini push for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t0,0($sp)
sw $t0,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t1,0($sp)
sw $t1,0($sp)
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $t2,0($sp)
sw $t2,0($sp)
# Mini push END for temporary registers
# Original instruction: li $t0,1
li $t0,1
label_290_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,25
slti $t2,$t0,25
# Original instruction: bne $t2,$zero,label_290_clean_loop
bne $t2,$zero,label_290_clean_loop
label_291_clean_loop_end:
# Mini pop for temporary registers
# Original instruction: lw $t2,0($sp)
lw $t2,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t1,0($sp)
lw $t1,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Original instruction: lw $t0,0($sp)
lw $t0,0($sp)
# Original instruction: sw $zero,0($sp)
sw $zero,0($sp)
# Original instruction: addiu $sp,$sp,4
addiu $sp,$sp,4
# Mini pop END for temporary registers
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addiu $fp,$sp,4
addiu $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addiu $sp,$fp,-24
addiu $sp,$fp,-24
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v965,$sp,0
addi $t2,$sp,0
# END PROLOGUE
# Original instruction: addi v966,$zero,32
addi $t1,$zero,32
# Original instruction: la v967,label_9_empty
la $t0,label_9_empty
# Loading from v966 from reg into v967
# Original instruction: sb v966,0(v967)
sb $t1,0($t0)
# Original instruction: addi v968,$zero,1
addi $t1,$zero,1
# Original instruction: addiu v969,$fp,-12
addiu $t0,$fp,-12
# Loading from v968 from reg into v969
# Original instruction: sw v968,0(v969)
sw $t1,0($t0)
# BEGIN FUNCALL EXPR FOR reset
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal reset
jal reset
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR printGame
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal printGame
jal printGame
# BACK FROM FUNCTION
# Original instruction: addi v972,$zero,1
addi $t1,$zero,1
# Original instruction: addiu v973,$fp,-16
addiu $t0,$fp,-16
# Loading from v972 from reg into v973
# Original instruction: sw v972,0(v973)
sw $t1,0($t0)
label_292_while_start:
# Original instruction: addiu v974,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v975,0(v974)
lw $t0,0($t0)
# Original instruction: beqz v975,label_293_while_end
beqz $t0,label_293_while_end
# BEGIN FUNCALL EXPR FOR selectmove
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v976,$fp,-16
addiu $t3,$fp,-16
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v977,$sp,0
addi $t5,$sp,0
# 
# Loading from v976 from stack into v977
# Original instruction: li v978,4
li $t6,4
# Original instruction: li v979,0
li $t1,0
label_294_mem_copy_loop:
# Original instruction: beq v979,v978,label_295_mem_copy_end
beq $t1,$t6,label_295_mem_copy_end
# Original instruction: add v980,v976,v979
add $t0,$t3,$t1
# Original instruction: lb v982,0(v980)
lb $t4,0($t0)
# Original instruction: add v981,v977,v979
add $t0,$t5,$t1
# Original instruction: sb v982,0(v981)
sb $t4,0($t0)
# Original instruction: addi v979,v979,1
addi $t1,$t1,1
# Original instruction: j label_294_mem_copy_loop
j label_294_mem_copy_loop
label_295_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal selectmove
jal selectmove
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR get_mark
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v984,$fp,-16
addiu $t6,$fp,-16
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v985,$sp,0
addi $t5,$sp,0
# 
# Loading from v984 from stack into v985
# Original instruction: li v986,4
li $t4,4
# Original instruction: li v987,0
li $t3,0
label_296_mem_copy_loop:
# Original instruction: beq v987,v986,label_297_mem_copy_end
beq $t3,$t4,label_297_mem_copy_end
# Original instruction: add v988,v984,v987
add $t0,$t6,$t3
# Original instruction: lb v990,0(v988)
lb $t0,0($t0)
# Original instruction: add v989,v985,v987
add $t1,$t5,$t3
# Original instruction: sb v990,0(v989)
sb $t0,0($t1)
# Original instruction: addi v987,v987,1
addi $t3,$t3,1
# Original instruction: j label_296_mem_copy_loop
j label_296_mem_copy_loop
label_297_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal get_mark
jal get_mark
# BACK FROM FUNCTION
# Original instruction: addi v991,$sp,0
addi $t3,$sp,0
# Original instruction: addiu v992,$fp,-20
addiu $t0,$fp,-20
# 
# Loading from v991 from stack into v992
# Original instruction: li v993,1
li $t6,1
# Original instruction: li v994,0
li $t4,0
label_298_mem_copy_loop:
# Original instruction: beq v994,v993,label_299_mem_copy_end
beq $t4,$t6,label_299_mem_copy_end
# Original instruction: add v995,v991,v994
add $t1,$t3,$t4
# Original instruction: lb v997,0(v995)
lb $t1,0($t1)
# Original instruction: add v996,v992,v994
add $t5,$t0,$t4
# Original instruction: sb v997,0(v996)
sb $t1,0($t5)
# Original instruction: addi v994,v994,1
addi $t4,$t4,1
# Original instruction: j label_298_mem_copy_loop
j label_298_mem_copy_loop
label_299_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR printGame
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal printGame
jal printGame
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR won
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addiu v999,$fp,-20
addiu $t3,$fp,-20
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1000,$sp,0
addi $t4,$sp,0
# 
# Loading from v999 from stack into v1000
# Original instruction: li v1001,1
li $t5,1
# Original instruction: li v1002,0
li $t1,0
label_302_mem_copy_loop:
# Original instruction: beq v1002,v1001,label_303_mem_copy_end
beq $t1,$t5,label_303_mem_copy_end
# Original instruction: add v1003,v999,v1002
add $t0,$t3,$t1
# Original instruction: lb v1005,0(v1003)
lb $t6,0($t0)
# Original instruction: add v1004,v1000,v1002
add $t0,$t4,$t1
# Original instruction: sb v1005,0(v1004)
sb $t6,0($t0)
# Original instruction: addi v1002,v1002,1
addi $t1,$t1,1
# Original instruction: j label_302_mem_copy_loop
j label_302_mem_copy_loop
label_303_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal won
jal won
# BACK FROM FUNCTION
# Original instruction: addi v1006,$sp,0
addi $t0,$sp,0
# Original instruction: lw v1007,0(v1006)
lw $t0,0($t0)
# Original instruction: beqz v1007,label_300_else
beqz $t0,label_300_else
# BEGIN FUNCALL EXPR FOR printWinner
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1008,$fp,-16
addiu $t3,$fp,-16
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1009,$sp,0
addi $t6,$sp,0
# 
# Loading from v1008 from stack into v1009
# Original instruction: li v1010,4
li $t5,4
# Original instruction: li v1011,0
li $t1,0
label_304_mem_copy_loop:
# Original instruction: beq v1011,v1010,label_305_mem_copy_end
beq $t1,$t5,label_305_mem_copy_end
# Original instruction: add v1012,v1008,v1011
add $t0,$t3,$t1
# Original instruction: lb v1014,0(v1012)
lb $t0,0($t0)
# Original instruction: add v1013,v1009,v1011
add $t4,$t6,$t1
# Original instruction: sb v1014,0(v1013)
sb $t0,0($t4)
# Original instruction: addi v1011,v1011,1
addi $t1,$t1,1
# Original instruction: j label_304_mem_copy_loop
j label_304_mem_copy_loop
label_305_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal printWinner
jal printWinner
# BACK FROM FUNCTION
# Original instruction: addi v1016,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v1017,$fp,-12
addiu $t1,$fp,-12
# Loading from v1016 from reg into v1017
# Original instruction: sw v1016,0(v1017)
sw $t0,0($t1)
# Original instruction: j label_301_end
j label_301_end
label_300_else:
# BEGIN FUNCALL EXPR FOR full
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal full
jal full
# BACK FROM FUNCTION
# Original instruction: addi v1018,$sp,0
addi $t0,$sp,0
# Original instruction: lw v1019,0(v1018)
lw $t3,0($t0)
# Original instruction: addi v1020,$zero,1
addi $t0,$zero,1
# Original instruction: slt v1022,v1019,v1020
slt $t1,$t3,$t0
# Original instruction: slt v1023,v1020,v1019
slt $t0,$t0,$t3
# Original instruction: or v1024,v1022,v1023
or $t0,$t1,$t0
# Original instruction: addi v1025,$zero,1
addi $t1,$zero,1
# Original instruction: sub v1021,v1025,v1024
sub $t0,$t1,$t0
# Original instruction: beqz v1021,label_306_else
beqz $t0,label_306_else
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v1026,label_35_str
la $t1,label_35_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1027,$sp,0
addi $t0,$sp,0
# Loading from v1026 from reg into v1027
# Original instruction: sw v1026,0(v1027)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# Original instruction: addi v1029,$zero,0
addi $t1,$zero,0
# Original instruction: addiu v1030,$fp,-12
addiu $t0,$fp,-12
# Loading from v1029 from reg into v1030
# Original instruction: sw v1029,0(v1030)
sw $t1,0($t0)
# Original instruction: j label_307_end
j label_307_end
label_306_else:
# BEGIN FUNCALL EXPR FOR switchPlayer
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1031,$fp,-16
addiu $t4,$fp,-16
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1032,$sp,0
addi $t1,$sp,0
# 
# Loading from v1031 from stack into v1032
# Original instruction: li v1033,4
li $t6,4
# Original instruction: li v1034,0
li $t5,0
label_308_mem_copy_loop:
# Original instruction: beq v1034,v1033,label_309_mem_copy_end
beq $t5,$t6,label_309_mem_copy_end
# Original instruction: add v1035,v1031,v1034
add $t0,$t4,$t5
# Original instruction: lb v1037,0(v1035)
lb $t0,0($t0)
# Original instruction: add v1036,v1032,v1034
add $t3,$t1,$t5
# Original instruction: sb v1037,0(v1036)
sb $t0,0($t3)
# Original instruction: addi v1034,v1034,1
addi $t5,$t5,1
# Original instruction: j label_308_mem_copy_loop
j label_308_mem_copy_loop
label_309_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal switchPlayer
jal switchPlayer
# BACK FROM FUNCTION
# Original instruction: addi v1038,$sp,0
addi $t1,$sp,0
# Original instruction: addiu v1039,$fp,-16
addiu $t3,$fp,-16
# 
# Loading from v1038 from stack into v1039
# Original instruction: li v1040,4
li $t4,4
# Original instruction: li v1041,0
li $t6,0
label_310_mem_copy_loop:
# Original instruction: beq v1041,v1040,label_311_mem_copy_end
beq $t6,$t4,label_311_mem_copy_end
# Original instruction: add v1042,v1038,v1041
add $t0,$t1,$t6
# Original instruction: lb v1044,0(v1042)
lb $t5,0($t0)
# Original instruction: add v1043,v1039,v1041
add $t0,$t3,$t6
# Original instruction: sb v1044,0(v1043)
sb $t5,0($t0)
# Original instruction: addi v1041,v1041,1
addi $t6,$t6,1
# Original instruction: j label_310_mem_copy_loop
j label_310_mem_copy_loop
label_311_mem_copy_end:
# 
label_307_end:
label_301_end:
# Original instruction: addiu v1045,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v1046,0(v1045)
lw $t3,0($t0)
# Original instruction: addi v1047,$zero,0
addi $t1,$zero,0
# Original instruction: slt v1049,v1046,v1047
slt $t0,$t3,$t1
# Original instruction: slt v1050,v1047,v1046
slt $t1,$t1,$t3
# Original instruction: or v1051,v1049,v1050
or $t1,$t0,$t1
# Original instruction: addi v1052,$zero,1
addi $t0,$zero,1
# Original instruction: sub v1048,v1052,v1051
sub $t0,$t0,$t1
# Original instruction: beqz v1048,label_312_else
beqz $t0,label_312_else
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v1053,label_36_str
la $t1,label_36_str
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1054,$sp,0
addi $t0,$sp,0
# Loading from v1053 from reg into v1054
# Original instruction: sw v1053,0(v1054)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR read_c
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal read_c
jal read_c
# BACK FROM FUNCTION
# Original instruction: addi v1056,$sp,0
addi $t4,$sp,0
# Original instruction: addiu v1057,$fp,-24
addiu $t0,$fp,-24
# 
# Loading from v1056 from stack into v1057
# Original instruction: li v1058,1
li $t1,1
# Original instruction: li v1059,0
li $t6,0
label_314_mem_copy_loop:
# Original instruction: beq v1059,v1058,label_315_mem_copy_end
beq $t6,$t1,label_315_mem_copy_end
# Original instruction: add v1060,v1056,v1059
add $t3,$t4,$t6
# Original instruction: lb v1062,0(v1060)
lb $t5,0($t3)
# Original instruction: add v1061,v1057,v1059
add $t3,$t0,$t6
# Original instruction: sb v1062,0(v1061)
sb $t5,0($t3)
# Original instruction: addi v1059,v1059,1
addi $t6,$t6,1
# Original instruction: j label_314_mem_copy_loop
j label_314_mem_copy_loop
label_315_mem_copy_end:
# 
# Original instruction: addiu v1063,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lb v1064,0(v1063)
lb $t0,0($t0)
# Original instruction: addi v1065,$zero,121
addi $t3,$zero,121
# Original instruction: slt v1067,v1064,v1065
slt $t1,$t0,$t3
# Original instruction: slt v1068,v1065,v1064
slt $t0,$t3,$t0
# Original instruction: or v1069,v1067,v1068
or $t0,$t1,$t0
# Original instruction: addi v1070,$zero,1
addi $t1,$zero,1
# Original instruction: sub v1066,v1070,v1069
sub $t0,$t1,$t0
# Original instruction: beqz v1066,label_316_else
beqz $t0,label_316_else
# Original instruction: addi v1071,$zero,1
addi $t1,$zero,1
# Original instruction: addiu v1072,$fp,-12
addiu $t0,$fp,-12
# Loading from v1071 from reg into v1072
# Original instruction: sw v1071,0(v1072)
sw $t1,0($t0)
# BEGIN FUNCALL EXPR FOR reset
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal reset
jal reset
# BACK FROM FUNCTION
# Original instruction: j label_317_end
j label_317_end
label_316_else:
# Original instruction: addiu v1074,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lb v1075,0(v1074)
lb $t0,0($t0)
# Original instruction: addi v1076,$zero,89
addi $t1,$zero,89
# Original instruction: slt v1078,v1075,v1076
slt $t3,$t0,$t1
# Original instruction: slt v1079,v1076,v1075
slt $t0,$t1,$t0
# Original instruction: or v1080,v1078,v1079
or $t0,$t3,$t0
# Original instruction: addi v1081,$zero,1
addi $t1,$zero,1
# Original instruction: sub v1077,v1081,v1080
sub $t0,$t1,$t0
# Original instruction: beqz v1077,label_318_else
beqz $t0,label_318_else
# Original instruction: addi v1082,$zero,1
addi $t0,$zero,1
# Original instruction: addiu v1083,$fp,-12
addiu $t1,$fp,-12
# Loading from v1082 from reg into v1083
# Original instruction: sw v1082,0(v1083)
sw $t0,0($t1)
# BEGIN FUNCALL EXPR FOR reset
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal reset
jal reset
# BACK FROM FUNCTION
# Original instruction: j label_319_end
j label_319_end
label_318_else:
label_319_end:
label_317_end:
# Original instruction: j label_313_end
j label_313_end
label_312_else:
label_313_end:
# Original instruction: j label_292_while_start
j label_292_while_start
label_293_while_end:
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v965,0
addi $sp,$t2,0
# Original instruction: popRegisters
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

