.data
# Allocated labels for virtual registers
# Allocated labels for virtual registers
# Allocated labels for virtual registers
# Allocated labels for virtual registers
# Allocated labels for virtual registers
# Allocated labels for virtual registers
# Allocated labels for virtual registers
# Allocated labels for virtual registers
label_49_v10:
.space 4
label_37_v4:
.space 4
label_35_v2:
.space 4
label_42_v6:
.space 4
label_46_v8:
.space 4
label_38_v5:
.space 4
label_41_v7:
.space 4
label_44_v1:
.space 4
label_45_v0:
.space 4
label_34_v3:
.space 4
label_50_v9:
.space 4

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
mcmalloc:
# Clearing entire allocated stack frame of size 8
# Original instruction: li $t0,1
li $t0,1
label_2_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_2_clean_loop
bne $t2,$zero,label_2_clean_loop
label_3_clean_loop_end:
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
# Original instruction: lw $a0,4($fp)
lw $a0,4($fp)
# Original instruction: addi $v0,$zero,9
addi $v0,$zero,9
# Original instruction: syscall
syscall
# Original instruction: sw $v0,0($fp)
sw $v0,0($fp)
mcmallocEND:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

.text
read_i:
# Clearing entire allocated stack frame of size 8
# Original instruction: li $t0,1
li $t0,1
label_6_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_6_clean_loop
bne $t2,$zero,label_6_clean_loop
label_7_clean_loop_end:
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
# Original instruction: addi $v0,$zero,5
addi $v0,$zero,5
# Original instruction: syscall
syscall
# Original instruction: sw $v0,0($fp)
sw $v0,0($fp)
read_iEND:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

.text
read_c:
# Clearing entire allocated stack frame of size 8
# Original instruction: li $t0,1
li $t0,1
label_10_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_10_clean_loop
bne $t2,$zero,label_10_clean_loop
label_11_clean_loop_end:
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
# Original instruction: addi $v0,$zero,12
addi $v0,$zero,12
# Original instruction: syscall
syscall
# Original instruction: sw $v0,0($fp)
sw $v0,0($fp)
read_cEND:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

.text
print_c:
# Clearing entire allocated stack frame of size 8
# Original instruction: li $t0,1
li $t0,1
label_14_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_14_clean_loop
bne $t2,$zero,label_14_clean_loop
label_15_clean_loop_end:
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
# Original instruction: lb $a0,0($fp)
lb $a0,0($fp)
# Original instruction: addi $v0,$zero,11
addi $v0,$zero,11
# Original instruction: syscall
syscall
print_cEND:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

.text
print_i:
# Clearing entire allocated stack frame of size 8
# Original instruction: li $t0,1
li $t0,1
label_18_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_18_clean_loop
bne $t2,$zero,label_18_clean_loop
label_19_clean_loop_end:
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
# Original instruction: lw $a0,0($fp)
lw $a0,0($fp)
# Original instruction: addi $v0,$zero,1
addi $v0,$zero,1
# Original instruction: syscall
syscall
print_iEND:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

.text
print_s:
# Clearing entire allocated stack frame of size 8
# Original instruction: li $t0,1
li $t0,1
label_22_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_22_clean_loop
bne $t2,$zero,label_22_clean_loop
label_23_clean_loop_end:
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
# Original instruction: lw $a0,0($fp)
lw $a0,0($fp)
# Original instruction: addi $v0,$zero,4
addi $v0,$zero,4
# Original instruction: syscall
syscall
print_sEND:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

.text
main:
# Clearing entire allocated stack frame of size 8
# Original instruction: li $t0,1
li $t0,1
label_25_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_25_clean_loop
bne $t2,$zero,label_25_clean_loop
label_26_clean_loop_end:
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
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v0,$sp,0
addi $t5,$sp,0
la $t0,label_45_v0
sw $t5,0($t0)
# Original instruction: addi v2,$zero,42
addi $t5,$zero,42
la $t0,label_35_v2
sw $t5,0($t0)
# Original instruction: addi v3,$zero,43
addi $t5,$zero,43
la $t0,label_34_v3
sw $t5,0($t0)
# Original instruction: slt v4,v2,v3
la $t5,label_35_v2
lw $t5,0($t5)
la $t4,label_34_v3
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t0,label_37_v4
sw $t3,0($t0)
# Original instruction: slt v5,v3,v2
la $t5,label_34_v3
lw $t5,0($t5)
la $t4,label_35_v2
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t0,label_38_v5
sw $t3,0($t0)
# Original instruction: or v6,v4,v5
la $t5,label_37_v4
lw $t5,0($t5)
la $t4,label_38_v5
lw $t4,0($t4)
or $t3,$t5,$t4
la $t0,label_42_v6
sw $t3,0($t0)
# Original instruction: addi v7,$zero,1
addi $t5,$zero,1
la $t0,label_41_v7
sw $t5,0($t0)
# Original instruction: sub v1,v7,v6
la $t5,label_41_v7
lw $t5,0($t5)
la $t4,label_42_v6
lw $t4,0($t4)
sub $t3,$t5,$t4
la $t0,label_44_v1
sw $t3,0($t0)
# Original instruction: sw v1,0(v0)
la $t5,label_44_v1
lw $t5,0($t5)
la $t4,label_45_v0
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# Original instruction: jal print_i
jal print_i
# Original instruction: addi v8,$sp,0
addi $t5,$sp,0
la $t0,label_46_v8
sw $t5,0($t0)
# Return statement start
# Original instruction: addiu v9,$fp,0
addiu $t5,$fp,0
la $t0,label_50_v9
sw $t5,0($t0)
# Original instruction: addi v10,$zero,0
addi $t5,$zero,0
la $t0,label_49_v10
sw $t5,0($t0)
# Original instruction: sw v10,0(v9)
la $t5,label_49_v10
lw $t5,0($t5)
la $t4,label_50_v9
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: jal mainEND
jal mainEND
# Return statement end
mainEND:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

