.data
# Allocated labels for virtual registers
# Allocated labels for virtual registers
label_36_v3:
.space 4
label_31_v2:
.space 4
label_34_v1:
.space 4
label_38_v0:
.space 4
# Allocated labels for virtual registers
label_42_v6:
.space 4
label_45_v5:
.space 4
label_47_v7:
.space 4
label_49_v4:
.space 4
# Allocated labels for virtual registers
label_56_v9:
.space 4
label_60_v8:
.space 4
label_58_v11:
.space 4
label_53_v10:
.space 4
# Allocated labels for virtual registers
label_71_v12:
.space 4
label_64_v14:
.space 4
label_69_v15:
.space 4
label_67_v13:
.space 4
# Allocated labels for virtual registers
label_82_v16:
.space 4
label_80_v19:
.space 4
label_75_v18:
.space 4
label_78_v17:
.space 4
# Allocated labels for virtual registers
label_91_v23:
.space 4
label_93_v20:
.space 4
label_89_v21:
.space 4
label_86_v22:
.space 4
# Allocated labels for virtual registers
label_125_v37:
.space 4
label_126_v38:
.space 4
label_127_v24:
.space 4
label_109_v29:
.space 4
label_120_v30:
.space 4
label_100_v25:
.space 4
label_121_v35:
.space 4
label_110_v28:
.space 4
label_97_v26:
.space 4
label_102_v27:
.space 4
label_116_v34:
.space 4
label_117_v33:
.space 4
label_112_v31:
.space 4
label_122_v36:
.space 4
label_113_v32:
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
# BEGIN PROLOGUE
mcmalloc:
# Clearing entire allocated stack frame of size 8
# Original instruction: li v1,1
li $t5,1
la $t0,label_34_v1
sw $t5,0($t0)
label_2_clean_loop:
# Original instruction: sub v2,$sp,v1
la $t5,label_34_v1
lw $t5,0($t5)
sub $t4,$sp,$t5
la $t0,label_31_v2
sw $t4,0($t0)
# Original instruction: sb $zero,0(v2)
la $t5,label_31_v2
lw $t5,0($t5)
sb $zero,0($t5)
# Original instruction: addi v1,v1,1
la $t4,label_34_v1
lw $t4,0($t4)
addi $t4,$t4,1
la $t0,label_34_v1
sw $t4,0($t0)
# Original instruction: slti v3,v1,9
la $t5,label_34_v1
lw $t5,0($t5)
slti $t4,$t5,9
la $t0,label_36_v3
sw $t4,0($t0)
# Original instruction: bne v3,$zero,label_2_clean_loop
la $t5,label_36_v3
lw $t5,0($t5)
bne $t5,$zero,label_2_clean_loop
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
# Original instruction: pushRegisters
la $t0,label_36_v3
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_31_v2
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_34_v1
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_38_v0
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v0,$sp,0
addi $t5,$sp,0
la $t0,label_38_v0
sw $t5,0($t0)
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
la $t5,label_38_v0
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_38_v0
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_34_v1
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_31_v2
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_36_v3
sw $t0,0($t1)
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
# Original instruction: li v5,1
li $t5,1
la $t0,label_45_v5
sw $t5,0($t0)
label_6_clean_loop:
# Original instruction: sub v6,$sp,v5
la $t5,label_45_v5
lw $t5,0($t5)
sub $t4,$sp,$t5
la $t0,label_42_v6
sw $t4,0($t0)
# Original instruction: sb $zero,0(v6)
la $t5,label_42_v6
lw $t5,0($t5)
sb $zero,0($t5)
# Original instruction: addi v5,v5,1
la $t4,label_45_v5
lw $t4,0($t4)
addi $t4,$t4,1
la $t0,label_45_v5
sw $t4,0($t0)
# Original instruction: slti v7,v5,9
la $t5,label_45_v5
lw $t5,0($t5)
slti $t4,$t5,9
la $t0,label_47_v7
sw $t4,0($t0)
# Original instruction: bne v7,$zero,label_6_clean_loop
la $t5,label_47_v7
lw $t5,0($t5)
bne $t5,$zero,label_6_clean_loop
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
# Original instruction: pushRegisters
la $t0,label_42_v6
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_45_v5
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_47_v7
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_49_v4
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v4,$sp,0
addi $t5,$sp,0
la $t0,label_49_v4
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: addi $v0,$zero,5
addi $v0,$zero,5
# Original instruction: syscall
syscall
# Original instruction: sw $v0,0($fp)
sw $v0,0($fp)
# BEGIN EPILOGUE
read_iEND:
# Original instruction: addi $sp,v4,0
la $t5,label_49_v4
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_49_v4
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_47_v7
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_45_v5
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_42_v6
sw $t0,0($t1)
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
# Original instruction: li v9,1
li $t5,1
la $t0,label_56_v9
sw $t5,0($t0)
label_10_clean_loop:
# Original instruction: sub v10,$sp,v9
la $t5,label_56_v9
lw $t5,0($t5)
sub $t4,$sp,$t5
la $t0,label_53_v10
sw $t4,0($t0)
# Original instruction: sb $zero,0(v10)
la $t5,label_53_v10
lw $t5,0($t5)
sb $zero,0($t5)
# Original instruction: addi v9,v9,1
la $t4,label_56_v9
lw $t4,0($t4)
addi $t4,$t4,1
la $t0,label_56_v9
sw $t4,0($t0)
# Original instruction: slti v11,v9,9
la $t5,label_56_v9
lw $t5,0($t5)
slti $t4,$t5,9
la $t0,label_58_v11
sw $t4,0($t0)
# Original instruction: bne v11,$zero,label_10_clean_loop
la $t5,label_58_v11
lw $t5,0($t5)
bne $t5,$zero,label_10_clean_loop
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
# Original instruction: pushRegisters
la $t0,label_56_v9
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_60_v8
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_58_v11
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_53_v10
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v8,$sp,0
addi $t5,$sp,0
la $t0,label_60_v8
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: addi $v0,$zero,12
addi $v0,$zero,12
# Original instruction: syscall
syscall
# Original instruction: sw $v0,0($fp)
sw $v0,0($fp)
# BEGIN EPILOGUE
read_cEND:
# Original instruction: addi $sp,v8,0
la $t5,label_60_v8
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_53_v10
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_58_v11
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_60_v8
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_56_v9
sw $t0,0($t1)
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
# Original instruction: li v13,1
li $t5,1
la $t0,label_67_v13
sw $t5,0($t0)
label_14_clean_loop:
# Original instruction: sub v14,$sp,v13
la $t5,label_67_v13
lw $t5,0($t5)
sub $t4,$sp,$t5
la $t0,label_64_v14
sw $t4,0($t0)
# Original instruction: sb $zero,0(v14)
la $t5,label_64_v14
lw $t5,0($t5)
sb $zero,0($t5)
# Original instruction: addi v13,v13,1
la $t4,label_67_v13
lw $t4,0($t4)
addi $t4,$t4,1
la $t0,label_67_v13
sw $t4,0($t0)
# Original instruction: slti v15,v13,9
la $t5,label_67_v13
lw $t5,0($t5)
slti $t4,$t5,9
la $t0,label_69_v15
sw $t4,0($t0)
# Original instruction: bne v15,$zero,label_14_clean_loop
la $t5,label_69_v15
lw $t5,0($t5)
bne $t5,$zero,label_14_clean_loop
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
# Original instruction: pushRegisters
la $t0,label_71_v12
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_64_v14
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_69_v15
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_67_v13
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v12,$sp,0
addi $t5,$sp,0
la $t0,label_71_v12
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: lb $a0,0($fp)
lb $a0,0($fp)
# Original instruction: addi $v0,$zero,11
addi $v0,$zero,11
# Original instruction: syscall
syscall
# BEGIN EPILOGUE
print_cEND:
# Original instruction: addi $sp,v12,0
la $t5,label_71_v12
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_67_v13
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_69_v15
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_64_v14
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_71_v12
sw $t0,0($t1)
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
# Original instruction: li v17,1
li $t5,1
la $t0,label_78_v17
sw $t5,0($t0)
label_18_clean_loop:
# Original instruction: sub v18,$sp,v17
la $t5,label_78_v17
lw $t5,0($t5)
sub $t4,$sp,$t5
la $t0,label_75_v18
sw $t4,0($t0)
# Original instruction: sb $zero,0(v18)
la $t5,label_75_v18
lw $t5,0($t5)
sb $zero,0($t5)
# Original instruction: addi v17,v17,1
la $t4,label_78_v17
lw $t4,0($t4)
addi $t4,$t4,1
la $t0,label_78_v17
sw $t4,0($t0)
# Original instruction: slti v19,v17,9
la $t5,label_78_v17
lw $t5,0($t5)
slti $t4,$t5,9
la $t0,label_80_v19
sw $t4,0($t0)
# Original instruction: bne v19,$zero,label_18_clean_loop
la $t5,label_80_v19
lw $t5,0($t5)
bne $t5,$zero,label_18_clean_loop
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
# Original instruction: pushRegisters
la $t0,label_82_v16
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_80_v19
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_75_v18
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_78_v17
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v16,$sp,0
addi $t5,$sp,0
la $t0,label_82_v16
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: lw $a0,0($fp)
lw $a0,0($fp)
# Original instruction: addi $v0,$zero,1
addi $v0,$zero,1
# Original instruction: syscall
syscall
# BEGIN EPILOGUE
print_iEND:
# Original instruction: addi $sp,v16,0
la $t5,label_82_v16
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_78_v17
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_75_v18
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_80_v19
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_82_v16
sw $t0,0($t1)
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
# Original instruction: li v21,1
li $t5,1
la $t0,label_89_v21
sw $t5,0($t0)
label_22_clean_loop:
# Original instruction: sub v22,$sp,v21
la $t5,label_89_v21
lw $t5,0($t5)
sub $t4,$sp,$t5
la $t0,label_86_v22
sw $t4,0($t0)
# Original instruction: sb $zero,0(v22)
la $t5,label_86_v22
lw $t5,0($t5)
sb $zero,0($t5)
# Original instruction: addi v21,v21,1
la $t4,label_89_v21
lw $t4,0($t4)
addi $t4,$t4,1
la $t0,label_89_v21
sw $t4,0($t0)
# Original instruction: slti v23,v21,9
la $t5,label_89_v21
lw $t5,0($t5)
slti $t4,$t5,9
la $t0,label_91_v23
sw $t4,0($t0)
# Original instruction: bne v23,$zero,label_22_clean_loop
la $t5,label_91_v23
lw $t5,0($t5)
bne $t5,$zero,label_22_clean_loop
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
# Original instruction: pushRegisters
la $t0,label_91_v23
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_93_v20
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_89_v21
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_86_v22
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v20,$sp,0
addi $t5,$sp,0
la $t0,label_93_v20
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: lw $a0,0($fp)
lw $a0,0($fp)
# Original instruction: addi $v0,$zero,4
addi $v0,$zero,4
# Original instruction: syscall
syscall
# BEGIN EPILOGUE
print_sEND:
# Original instruction: addi $sp,v20,0
la $t5,label_93_v20
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_86_v22
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_89_v21
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_93_v20
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_91_v23
sw $t0,0($t1)
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
# Clearing entire allocated stack frame of size 8
# Original instruction: li v25,1
li $t5,1
la $t0,label_100_v25
sw $t5,0($t0)
label_25_clean_loop:
# Original instruction: sub v26,$sp,v25
la $t5,label_100_v25
lw $t5,0($t5)
sub $t4,$sp,$t5
la $t0,label_97_v26
sw $t4,0($t0)
# Original instruction: sb $zero,0(v26)
la $t5,label_97_v26
lw $t5,0($t5)
sb $zero,0($t5)
# Original instruction: addi v25,v25,1
la $t4,label_100_v25
lw $t4,0($t4)
addi $t4,$t4,1
la $t0,label_100_v25
sw $t4,0($t0)
# Original instruction: slti v27,v25,9
la $t5,label_100_v25
lw $t5,0($t5)
slti $t4,$t5,9
la $t0,label_102_v27
sw $t4,0($t0)
# Original instruction: bne v27,$zero,label_25_clean_loop
la $t5,label_102_v27
lw $t5,0($t5)
bne $t5,$zero,label_25_clean_loop
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
# Original instruction: pushRegisters
la $t0,label_125_v37
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_126_v38
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_127_v24
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_109_v29
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_120_v30
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_100_v25
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_121_v35
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_110_v28
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_97_v26
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_102_v27
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_116_v34
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_117_v33
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_112_v31
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_122_v36
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_113_v32
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v24,$sp,0
addi $t5,$sp,0
la $t0,label_127_v24
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v28,$zero,42
addi $t5,$zero,42
la $t0,label_110_v28
sw $t5,0($t0)
# Original instruction: addi v29,$zero,43
addi $t5,$zero,43
la $t0,label_109_v29
sw $t5,0($t0)
# Original instruction: slt v31,v28,v29
la $t5,label_110_v28
lw $t5,0($t5)
la $t4,label_109_v29
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t0,label_112_v31
sw $t3,0($t0)
# Original instruction: slt v32,v29,v28
la $t5,label_109_v29
lw $t5,0($t5)
la $t4,label_110_v28
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t0,label_113_v32
sw $t3,0($t0)
# Original instruction: or v33,v31,v32
la $t5,label_112_v31
lw $t5,0($t5)
la $t4,label_113_v32
lw $t4,0($t4)
or $t3,$t5,$t4
la $t0,label_117_v33
sw $t3,0($t0)
# Original instruction: addi v34,$zero,1
addi $t5,$zero,1
la $t0,label_116_v34
sw $t5,0($t0)
# Original instruction: sub v30,v34,v33
la $t5,label_116_v34
lw $t5,0($t5)
la $t4,label_117_v33
lw $t4,0($t4)
sub $t3,$t5,$t4
la $t0,label_120_v30
sw $t3,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v35,$sp,0
addi $t5,$sp,0
la $t0,label_121_v35
sw $t5,0($t0)
# Loading from v30 from reg into v35
# Original instruction: sw v30,0(v35)
la $t5,label_120_v30
lw $t5,0($t5)
la $t4,label_121_v35
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# Original instruction: addi v36,$sp,0
addi $t5,$sp,0
la $t0,label_122_v36
sw $t5,0($t0)
# Return statement start
# Original instruction: addi v37,$zero,0
addi $t5,$zero,0
la $t0,label_125_v37
sw $t5,0($t0)
# Original instruction: addiu v38,$fp,0
addiu $t5,$fp,0
la $t0,label_126_v38
sw $t5,0($t0)
# Loading from v37 from reg into v38
# Original instruction: sw v37,0(v38)
la $t5,label_125_v37
lw $t5,0($t5)
la $t4,label_126_v38
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: jal mainEND
jal mainEND
# Return statement end
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v24,0
la $t5,label_127_v24
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_113_v32
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_122_v36
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_112_v31
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_117_v33
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_116_v34
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_102_v27
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_97_v26
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_110_v28
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_121_v35
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_100_v25
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_120_v30
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_109_v29
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_127_v24
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_126_v38
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_125_v37
sw $t0,0($t1)
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

