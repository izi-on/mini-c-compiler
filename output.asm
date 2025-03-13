.data
label_0_str:
.asciiz " "
.align 2
label_1_str:
.asciiz "\n"
.align 2
# Allocated labels for virtual registers
# Allocated labels for virtual registers
label_37_v0:
.space 4
# Allocated labels for virtual registers
label_39_v1:
.space 4
# Allocated labels for virtual registers
label_41_v2:
.space 4
# Allocated labels for virtual registers
label_43_v3:
.space 4
# Allocated labels for virtual registers
label_45_v4:
.space 4
# Allocated labels for virtual registers
label_47_v5:
.space 4
# Allocated labels for virtual registers
label_80_v17:
.space 4
label_109_v26:
.space 4
label_107_v25:
.space 4
label_70_v11:
.space 4
label_86_v20:
.space 4
label_71_v12:
.space 4
label_85_v19:
.space 4
label_66_v8:
.space 4
label_65_v9:
.space 4
label_77_v16:
.space 4
label_82_v18:
.space 4
label_72_v13:
.space 4
label_105_v23:
.space 4
label_89_v21:
.space 4
label_63_v7:
.space 4
label_108_v24:
.space 4
label_110_v6:
.space 4
label_74_v14:
.space 4
label_78_v15:
.space 4
label_90_v22:
.space 4
label_67_v10:
.space 4
# Allocated labels for virtual registers
label_140_v36:
.space 4
label_115_v29:
.space 4
label_114_v28:
.space 4
label_145_v27:
.space 4
label_144_v39:
.space 4
label_119_v31:
.space 4
label_120_v32:
.space 4
label_123_v33:
.space 4
label_142_v38:
.space 4
label_118_v30:
.space 4
label_124_v34:
.space 4
label_125_v35:
.space 4
label_143_v37:
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
# Original instruction: li $t0,1
li $t0,1
label_4_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_4_clean_loop
bne $t2,$zero,label_4_clean_loop
label_5_clean_loop_end:
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
la $t0,label_37_v0
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v0,$sp,0
addi $t5,$sp,0
la $t0,label_37_v0
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
la $t5,label_37_v0
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_37_v0
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
# Original instruction: li $t0,1
li $t0,1
label_8_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_8_clean_loop
bne $t2,$zero,label_8_clean_loop
label_9_clean_loop_end:
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
la $t0,label_39_v1
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v1,$sp,0
addi $t5,$sp,0
la $t0,label_39_v1
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
# Original instruction: addi $sp,v1,0
la $t5,label_39_v1
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_39_v1
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
# Original instruction: li $t0,1
li $t0,1
label_12_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_12_clean_loop
bne $t2,$zero,label_12_clean_loop
label_13_clean_loop_end:
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
la $t0,label_41_v2
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v2,$sp,0
addi $t5,$sp,0
la $t0,label_41_v2
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
# Original instruction: addi $sp,v2,0
la $t5,label_41_v2
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_41_v2
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
# Original instruction: li $t0,1
li $t0,1
label_16_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_16_clean_loop
bne $t2,$zero,label_16_clean_loop
label_17_clean_loop_end:
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
la $t0,label_43_v3
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v3,$sp,0
addi $t5,$sp,0
la $t0,label_43_v3
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
# Original instruction: addi $sp,v3,0
la $t5,label_43_v3
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_43_v3
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
# Original instruction: li $t0,1
li $t0,1
label_20_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_20_clean_loop
bne $t2,$zero,label_20_clean_loop
label_21_clean_loop_end:
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
la $t0,label_45_v4
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v4,$sp,0
addi $t5,$sp,0
la $t0,label_45_v4
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
# Original instruction: addi $sp,v4,0
la $t5,label_45_v4
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_45_v4
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
# Original instruction: li $t0,1
li $t0,1
label_24_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_24_clean_loop
bne $t2,$zero,label_24_clean_loop
label_25_clean_loop_end:
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
la $t0,label_47_v5
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v5,$sp,0
addi $t5,$sp,0
la $t0,label_47_v5
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
# Original instruction: addi $sp,v5,0
la $t5,label_47_v5
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_47_v5
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
count_down:
# Clearing entire allocated stack frame of size 12
# Original instruction: li $t0,1
li $t0,1
label_28_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,13
slti $t2,$t0,13
# Original instruction: bne $t2,$zero,label_28_clean_loop
bne $t2,$zero,label_28_clean_loop
label_29_clean_loop_end:
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
la $t0,label_80_v17
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_109_v26
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_107_v25
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_70_v11
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_86_v20
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_71_v12
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_85_v19
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_66_v8
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_65_v9
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_77_v16
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_82_v18
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_72_v13
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_105_v23
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_89_v21
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_63_v7
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_108_v24
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_110_v6
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_74_v14
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_78_v15
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_90_v22
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_67_v10
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v6,$sp,0
addi $t5,$sp,0
la $t0,label_110_v6
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v7,$fp,0
addiu $t5,$fp,0
la $t0,label_63_v7
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v8,$sp,0
addi $t5,$sp,0
la $t0,label_66_v8
sw $t5,0($t0)
# 
# Loading from v7 from stack into v8
# Original instruction: lb v9,0(v7)
la $t5,label_63_v7
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_65_v9
sw $t4,0($t0)
# Original instruction: sb v9,0(v8)
la $t5,label_65_v9
lw $t5,0($t5)
la $t4,label_66_v8
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v9,1(v7)
la $t5,label_63_v7
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_65_v9
sw $t4,0($t0)
# Original instruction: sb v9,1(v8)
la $t5,label_65_v9
lw $t5,0($t5)
la $t4,label_66_v8
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v9,2(v7)
la $t5,label_63_v7
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_65_v9
sw $t4,0($t0)
# Original instruction: sb v9,2(v8)
la $t5,label_65_v9
lw $t5,0($t5)
la $t4,label_66_v8
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v9,3(v7)
la $t5,label_63_v7
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_65_v9
sw $t4,0($t0)
# Original instruction: sb v9,3(v8)
la $t5,label_65_v9
lw $t5,0($t5)
la $t4,label_66_v8
lw $t4,0($t4)
sb $t5,3($t4)
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# Original instruction: addi v10,$sp,0
addi $t5,$sp,0
la $t0,label_67_v10
sw $t5,0($t0)
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v11,label_0_str
la $t5,label_0_str
la $t0,label_70_v11
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v12,$sp,0
addi $t5,$sp,0
la $t0,label_71_v12
sw $t5,0($t0)
# Loading from v11 from reg into v12
# Original instruction: sw v11,0(v12)
la $t5,label_70_v11
lw $t5,0($t5)
la $t4,label_71_v12
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# Original instruction: addi v13,$sp,0
addi $t5,$sp,0
la $t0,label_72_v13
sw $t5,0($t0)
# Original instruction: addiu v14,$fp,0
addiu $t5,$fp,0
la $t0,label_74_v14
sw $t5,0($t0)
# Original instruction: lw v15,0(v14)
la $t5,label_74_v14
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_78_v15
sw $t4,0($t0)
# Original instruction: addi v16,$zero,1
addi $t5,$zero,1
la $t0,label_77_v16
sw $t5,0($t0)
# Original instruction: slt v17,v16,v15
la $t5,label_77_v16
lw $t5,0($t5)
la $t4,label_78_v15
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t0,label_80_v17
sw $t3,0($t0)
# Original instruction: beqz v17,label_30_else
la $t5,label_80_v17
lw $t5,0($t5)
beqz $t5,label_30_else
# Original instruction: addiu v18,$fp,0
addiu $t5,$fp,0
la $t0,label_82_v18
sw $t5,0($t0)
# Original instruction: lw v19,0(v18)
la $t5,label_82_v18
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_85_v19
sw $t4,0($t0)
# Original instruction: addi v20,$zero,1
addi $t5,$zero,1
la $t0,label_86_v20
sw $t5,0($t0)
# Original instruction: sub v21,v19,v20
la $t5,label_85_v19
lw $t5,0($t5)
la $t4,label_86_v20
lw $t4,0($t4)
sub $t3,$t5,$t4
la $t0,label_89_v21
sw $t3,0($t0)
# Original instruction: addiu v22,$fp,-12
addiu $t5,$fp,-12
la $t0,label_90_v22
sw $t5,0($t0)
# Loading from v21 from reg into v22
# Original instruction: sw v21,0(v22)
la $t5,label_89_v21
lw $t5,0($t5)
la $t4,label_90_v22
lw $t4,0($t4)
sw $t5,0($t4)
# BEGIN FUNCALL EXPR FOR count_down
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v23,$fp,-12
addiu $t5,$fp,-12
la $t0,label_105_v23
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v24,$sp,0
addi $t5,$sp,0
la $t0,label_108_v24
sw $t5,0($t0)
# 
# Loading from v23 from stack into v24
# Original instruction: lb v25,0(v23)
la $t5,label_105_v23
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_107_v25
sw $t4,0($t0)
# Original instruction: sb v25,0(v24)
la $t5,label_107_v25
lw $t5,0($t5)
la $t4,label_108_v24
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v25,1(v23)
la $t5,label_105_v23
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_107_v25
sw $t4,0($t0)
# Original instruction: sb v25,1(v24)
la $t5,label_107_v25
lw $t5,0($t5)
la $t4,label_108_v24
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v25,2(v23)
la $t5,label_105_v23
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_107_v25
sw $t4,0($t0)
# Original instruction: sb v25,2(v24)
la $t5,label_107_v25
lw $t5,0($t5)
la $t4,label_108_v24
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v25,3(v23)
la $t5,label_105_v23
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_107_v25
sw $t4,0($t0)
# Original instruction: sb v25,3(v24)
la $t5,label_107_v25
lw $t5,0($t5)
la $t4,label_108_v24
lw $t4,0($t4)
sb $t5,3($t4)
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal count_down
jal count_down
# BACK FROM FUNCTION
# Original instruction: addi v26,$sp,0
addi $t5,$sp,0
la $t0,label_109_v26
sw $t5,0($t0)
# Original instruction: j label_31_end
j label_31_end
label_30_else:
label_31_end:
# BEGIN EPILOGUE
count_downEND:
# Original instruction: addi $sp,v6,0
la $t5,label_110_v6
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_67_v10
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_90_v22
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_78_v15
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_74_v14
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_110_v6
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_108_v24
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_63_v7
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_89_v21
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_105_v23
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_72_v13
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_82_v18
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_77_v16
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_65_v9
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_66_v8
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_85_v19
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_71_v12
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_86_v20
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_70_v11
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_107_v25
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_109_v26
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_80_v17
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
# Clearing entire allocated stack frame of size 12
# Original instruction: li $t0,1
li $t0,1
label_33_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,13
slti $t2,$t0,13
# Original instruction: bne $t2,$zero,label_33_clean_loop
bne $t2,$zero,label_33_clean_loop
label_34_clean_loop_end:
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
la $t0,label_140_v36
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_115_v29
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_114_v28
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_145_v27
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_144_v39
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_119_v31
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_120_v32
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_123_v33
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_142_v38
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_118_v30
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_124_v34
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_125_v35
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_143_v37
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v27,$sp,0
addi $t5,$sp,0
la $t0,label_145_v27
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: addi v28,$zero,100
addi $t5,$zero,100
la $t0,label_114_v28
sw $t5,0($t0)
# Original instruction: addiu v29,$fp,-12
addiu $t5,$fp,-12
la $t0,label_115_v29
sw $t5,0($t0)
# Loading from v28 from reg into v29
# Original instruction: sw v28,0(v29)
la $t5,label_114_v28
lw $t5,0($t5)
la $t4,label_115_v29
lw $t4,0($t4)
sw $t5,0($t4)
# BEGIN FUNCALL EXPR FOR count_down
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v30,$zero,5
addi $t5,$zero,5
la $t0,label_118_v30
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v31,$sp,0
addi $t5,$sp,0
la $t0,label_119_v31
sw $t5,0($t0)
# Loading from v30 from reg into v31
# Original instruction: sw v30,0(v31)
la $t5,label_118_v30
lw $t5,0($t5)
la $t4,label_119_v31
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal count_down
jal count_down
# BACK FROM FUNCTION
# Original instruction: addi v32,$sp,0
addi $t5,$sp,0
la $t0,label_120_v32
sw $t5,0($t0)
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v33,label_1_str
la $t5,label_1_str
la $t0,label_123_v33
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v34,$sp,0
addi $t5,$sp,0
la $t0,label_124_v34
sw $t5,0($t0)
# Loading from v33 from reg into v34
# Original instruction: sw v33,0(v34)
la $t5,label_123_v33
lw $t5,0($t5)
la $t4,label_124_v34
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# Original instruction: addi v35,$sp,0
addi $t5,$sp,0
la $t0,label_125_v35
sw $t5,0($t0)
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v36,$fp,-12
addiu $t5,$fp,-12
la $t0,label_140_v36
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v37,$sp,0
addi $t5,$sp,0
la $t0,label_143_v37
sw $t5,0($t0)
# 
# Loading from v36 from stack into v37
# Original instruction: lb v38,0(v36)
la $t5,label_140_v36
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_142_v38
sw $t4,0($t0)
# Original instruction: sb v38,0(v37)
la $t5,label_142_v38
lw $t5,0($t5)
la $t4,label_143_v37
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v38,1(v36)
la $t5,label_140_v36
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_142_v38
sw $t4,0($t0)
# Original instruction: sb v38,1(v37)
la $t5,label_142_v38
lw $t5,0($t5)
la $t4,label_143_v37
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v38,2(v36)
la $t5,label_140_v36
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_142_v38
sw $t4,0($t0)
# Original instruction: sb v38,2(v37)
la $t5,label_142_v38
lw $t5,0($t5)
la $t4,label_143_v37
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v38,3(v36)
la $t5,label_140_v36
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_142_v38
sw $t4,0($t0)
# Original instruction: sb v38,3(v37)
la $t5,label_142_v38
lw $t5,0($t5)
la $t4,label_143_v37
lw $t4,0($t4)
sb $t5,3($t4)
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# Original instruction: addi v39,$sp,0
addi $t5,$sp,0
la $t0,label_144_v39
sw $t5,0($t0)
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v27,0
la $t5,label_145_v27
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_143_v37
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_125_v35
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_124_v34
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_118_v30
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_142_v38
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_123_v33
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_120_v32
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_119_v31
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_144_v39
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_145_v27
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_114_v28
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_115_v29
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_140_v36
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

