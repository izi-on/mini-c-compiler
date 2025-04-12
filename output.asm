.data
label_5_str:
.asciiz "Base"
.align 3
label_6_str:
.asciiz "Derived"
label_7_str:
.asciiz "DerivedExtra"
.align 3
label_8_str:
.asciiz "MoreDerived"
label_9_str:
.asciiz "MoreDerivedExtra"
.align 3
label_38_Base_vtable:
.word label_0_info
label_45_Derived_vtable:
.word label_1_info
.word label_2_extra
label_52_MoreDerived_vtable:
.word label_3_info
.word label_4_extra
# Allocated labels for virtual registers
# Allocated labels for virtual registers
label_57_v0:
.space 4
# Allocated labels for virtual registers
label_59_v1:
.space 4
# Allocated labels for virtual registers
label_61_v2:
.space 4
# Allocated labels for virtual registers
label_63_v3:
.space 4
# Allocated labels for virtual registers
label_65_v4:
.space 4
# Allocated labels for virtual registers
label_67_v5:
.space 4
# Allocated labels for virtual registers
label_74_v6:
.space 4
label_71_v7:
.space 4
label_73_v9:
.space 4
label_72_v8:
.space 4
# Allocated labels for virtual registers
label_78_v11:
.space 4
label_81_v10:
.space 4
label_79_v12:
.space 4
label_80_v13:
.space 4
# Allocated labels for virtual registers
label_86_v16:
.space 4
label_85_v15:
.space 4
label_88_v14:
.space 4
label_87_v17:
.space 4
# Allocated labels for virtual registers
label_94_v21:
.space 4
label_92_v19:
.space 4
label_95_v18:
.space 4
label_93_v20:
.space 4
# Allocated labels for virtual registers
label_99_v23:
.space 4
label_100_v24:
.space 4
label_102_v22:
.space 4
label_101_v25:
.space 4
# Allocated labels for virtual registers
label_115_v32:
.space 4
label_114_v31:
.space 4
label_145_v45:
.space 4
label_123_v33:
.space 4
label_125_v36:
.space 4
label_146_v26:
.space 4
label_131_v39:
.space 4
label_144_v44:
.space 4
label_124_v35:
.space 4
label_139_v40:
.space 4
label_137_v41:
.space 4
label_105_v27:
.space 4
label_109_v29:
.space 4
label_141_v43:
.space 4
label_111_v30:
.space 4
label_130_v38:
.space 4
label_127_v37:
.space 4
label_121_v34:
.space 4
label_140_v42:
.space 4
label_108_v28:
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
la $t0,label_57_v0
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v0,$sp,0
addi $t5,$sp,0
la $t0,label_57_v0
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
la $t5,label_57_v0
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_57_v0
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
la $t0,label_59_v1
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v1,$sp,0
addi $t5,$sp,0
la $t0,label_59_v1
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
la $t5,label_59_v1
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_59_v1
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
la $t0,label_61_v2
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v2,$sp,0
addi $t5,$sp,0
la $t0,label_61_v2
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
la $t5,label_61_v2
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_61_v2
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
la $t0,label_63_v3
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v3,$sp,0
addi $t5,$sp,0
la $t0,label_63_v3
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
la $t5,label_63_v3
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_63_v3
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
label_28_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_28_clean_loop
bne $t2,$zero,label_28_clean_loop
label_29_clean_loop_end:
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
la $t0,label_65_v4
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v4,$sp,0
addi $t5,$sp,0
la $t0,label_65_v4
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
la $t5,label_65_v4
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_65_v4
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
label_32_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_32_clean_loop
bne $t2,$zero,label_32_clean_loop
label_33_clean_loop_end:
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
la $t0,label_67_v5
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v5,$sp,0
addi $t5,$sp,0
la $t0,label_67_v5
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
la $t5,label_67_v5
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_67_v5
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
label_0_info:
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
label_35_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_35_clean_loop
bne $t2,$zero,label_35_clean_loop
label_36_clean_loop_end:
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
la $t0,label_74_v6
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_71_v7
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_73_v9
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_72_v8
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v6,$sp,0
addi $t5,$sp,0
la $t0,label_74_v6
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v7,label_5_str
la $t5,label_5_str
la $t0,label_71_v7
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v8,$sp,0
addi $t5,$sp,0
la $t0,label_72_v8
sw $t5,0($t0)
# Loading from v7 from reg into v8
# Original instruction: sw v7,0(v8)
la $t5,label_71_v7
lw $t5,0($t5)
la $t4,label_72_v8
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# Original instruction: addi v9,$sp,0
addi $t5,$sp,0
la $t0,label_73_v9
sw $t5,0($t0)
# BEGIN EPILOGUE
label_0_infoEND:
# Original instruction: addi $sp,v6,0
la $t5,label_74_v6
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_72_v8
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_73_v9
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_71_v7
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_74_v6
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
label_1_info:
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
la $t0,label_78_v11
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_81_v10
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_79_v12
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_80_v13
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v10,$sp,0
addi $t5,$sp,0
la $t0,label_81_v10
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v11,label_6_str
la $t5,label_6_str
la $t0,label_78_v11
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v12,$sp,0
addi $t5,$sp,0
la $t0,label_79_v12
sw $t5,0($t0)
# Loading from v11 from reg into v12
# Original instruction: sw v11,0(v12)
la $t5,label_78_v11
lw $t5,0($t5)
la $t4,label_79_v12
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
la $t0,label_80_v13
sw $t5,0($t0)
# BEGIN EPILOGUE
label_1_infoEND:
# Original instruction: addi $sp,v10,0
la $t5,label_81_v10
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_80_v13
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_79_v12
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_81_v10
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_78_v11
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
label_2_extra:
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
label_42_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_42_clean_loop
bne $t2,$zero,label_42_clean_loop
label_43_clean_loop_end:
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
la $t0,label_86_v16
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_85_v15
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_88_v14
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_87_v17
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v14,$sp,0
addi $t5,$sp,0
la $t0,label_88_v14
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v15,label_7_str
la $t5,label_7_str
la $t0,label_85_v15
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v16,$sp,0
addi $t5,$sp,0
la $t0,label_86_v16
sw $t5,0($t0)
# Loading from v15 from reg into v16
# Original instruction: sw v15,0(v16)
la $t5,label_85_v15
lw $t5,0($t5)
la $t4,label_86_v16
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# Original instruction: addi v17,$sp,0
addi $t5,$sp,0
la $t0,label_87_v17
sw $t5,0($t0)
# BEGIN EPILOGUE
label_2_extraEND:
# Original instruction: addi $sp,v14,0
la $t5,label_88_v14
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_87_v17
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_88_v14
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_85_v15
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_86_v16
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
label_3_info:
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
label_46_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_46_clean_loop
bne $t2,$zero,label_46_clean_loop
label_47_clean_loop_end:
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
la $t0,label_94_v21
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_92_v19
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_95_v18
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_93_v20
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v18,$sp,0
addi $t5,$sp,0
la $t0,label_95_v18
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v19,label_8_str
la $t5,label_8_str
la $t0,label_92_v19
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v20,$sp,0
addi $t5,$sp,0
la $t0,label_93_v20
sw $t5,0($t0)
# Loading from v19 from reg into v20
# Original instruction: sw v19,0(v20)
la $t5,label_92_v19
lw $t5,0($t5)
la $t4,label_93_v20
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# Original instruction: addi v21,$sp,0
addi $t5,$sp,0
la $t0,label_94_v21
sw $t5,0($t0)
# BEGIN EPILOGUE
label_3_infoEND:
# Original instruction: addi $sp,v18,0
la $t5,label_95_v18
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_93_v20
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_95_v18
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_92_v19
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_94_v21
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
label_4_extra:
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
label_49_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_49_clean_loop
bne $t2,$zero,label_49_clean_loop
label_50_clean_loop_end:
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
la $t0,label_99_v23
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_100_v24
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_102_v22
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_101_v25
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v22,$sp,0
addi $t5,$sp,0
la $t0,label_102_v22
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v23,label_9_str
la $t5,label_9_str
la $t0,label_99_v23
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v24,$sp,0
addi $t5,$sp,0
la $t0,label_100_v24
sw $t5,0($t0)
# Loading from v23 from reg into v24
# Original instruction: sw v23,0(v24)
la $t5,label_99_v23
lw $t5,0($t5)
la $t4,label_100_v24
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_s
jal print_s
# BACK FROM FUNCTION
# Original instruction: addi v25,$sp,0
addi $t5,$sp,0
la $t0,label_101_v25
sw $t5,0($t0)
# BEGIN EPILOGUE
label_4_extraEND:
# Original instruction: addi $sp,v22,0
la $t5,label_102_v22
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_101_v25
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_102_v22
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_100_v24
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_99_v23
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
# Clearing entire allocated stack frame of size 20
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
label_53_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,21
slti $t2,$t0,21
# Original instruction: bne $t2,$zero,label_53_clean_loop
bne $t2,$zero,label_53_clean_loop
label_54_clean_loop_end:
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
# Original instruction: addiu $sp,$fp,-20
addiu $sp,$fp,-20
# Original instruction: pushRegisters
la $t0,label_115_v32
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_114_v31
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_145_v45
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_123_v33
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_125_v36
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_146_v26
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_131_v39
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_144_v44
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_124_v35
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_139_v40
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_137_v41
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_105_v27
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_109_v29
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_141_v43
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_111_v30
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_130_v38
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_127_v37
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_121_v34
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_140_v42
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_108_v28
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v26,$sp,0
addi $t5,$sp,0
la $t0,label_146_v26
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: la v27,label_52_MoreDerived_vtable
la $t5,label_52_MoreDerived_vtable
la $t0,label_105_v27
sw $t5,0($t0)
# Original instruction: addiu $sp,$sp,-12
addiu $sp,$sp,-12
# Original instruction: sw v27,0($sp)
la $t5,label_105_v27
lw $t5,0($t5)
sw $t5,0($sp)
# Original instruction: addiu v28,$sp,0
addiu $t5,$sp,0
la $t0,label_108_v28
sw $t5,0($t0)
# Original instruction: addiu v29,$fp,-12
addiu $t5,$fp,-12
la $t0,label_109_v29
sw $t5,0($t0)
# Loading from v28 from reg into v29
# Original instruction: sw v28,0(v29)
la $t5,label_108_v28
lw $t5,0($t5)
la $t4,label_109_v29
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addiu v30,$fp,-12
addiu $t5,$fp,-12
la $t0,label_111_v30
sw $t5,0($t0)
# Original instruction: lw v31,0(v30)
la $t5,label_111_v30
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_114_v31
sw $t4,0($t0)
# Original instruction: addiu v32,$fp,-16
addiu $t5,$fp,-16
la $t0,label_115_v32
sw $t5,0($t0)
# Loading from v31 from reg into v32
# Original instruction: sw v31,0(v32)
la $t5,label_114_v31
lw $t5,0($t5)
la $t4,label_115_v32
lw $t4,0($t4)
sw $t5,0($t4)
# BEGIN INSTANCE FUNCALL EXPR FOR info
# Original instruction: addiu v33,$fp,-16
addiu $t5,$fp,-16
la $t0,label_123_v33
sw $t5,0($t0)
# Original instruction: lw v34,0(v33)
la $t5,label_123_v33
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_121_v34
sw $t4,0($t0)
# Original instruction: lw v34,0(v34)
la $t4,label_121_v34
lw $t4,0($t4)
lw $t4,0($t4)
la $t0,label_121_v34
sw $t4,0($t0)
# Original instruction: lw v35,0(v34)
la $t5,label_121_v34
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_124_v35
sw $t4,0($t0)
# Pass the pointer as first arg
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw v33,0($sp)
la $t5,label_123_v33
lw $t5,0($t5)
sw $t5,0($sp)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jalr v35
la $t5,label_124_v35
lw $t5,0($t5)
jalr $t5
# BACK FROM FUNCTION
# Original instruction: addi v36,$sp,0
addi $t5,$sp,0
la $t0,label_125_v36
sw $t5,0($t0)
# END INSTANCE FUNCALL EXPR FOR info
# Original instruction: addiu v37,$fp,-12
addiu $t5,$fp,-12
la $t0,label_127_v37
sw $t5,0($t0)
# Original instruction: lw v38,0(v37)
la $t5,label_127_v37
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_130_v38
sw $t4,0($t0)
# Original instruction: addiu v39,$fp,-20
addiu $t5,$fp,-20
la $t0,label_131_v39
sw $t5,0($t0)
# Loading from v38 from reg into v39
# Original instruction: sw v38,0(v39)
la $t5,label_130_v38
lw $t5,0($t5)
la $t4,label_131_v39
lw $t4,0($t4)
sw $t5,0($t4)
# BEGIN INSTANCE FUNCALL EXPR FOR extra
# Original instruction: addiu v40,$fp,-20
addiu $t5,$fp,-20
la $t0,label_139_v40
sw $t5,0($t0)
# Original instruction: lw v41,0(v40)
la $t5,label_139_v40
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_137_v41
sw $t4,0($t0)
# Original instruction: lw v41,0(v41)
la $t4,label_137_v41
lw $t4,0($t4)
lw $t4,0($t4)
la $t0,label_137_v41
sw $t4,0($t0)
# Original instruction: lw v42,4(v41)
la $t5,label_137_v41
lw $t5,0($t5)
lw $t4,4($t5)
la $t0,label_140_v42
sw $t4,0($t0)
# Pass the pointer as first arg
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw v40,0($sp)
la $t5,label_139_v40
lw $t5,0($t5)
sw $t5,0($sp)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jalr v42
la $t5,label_140_v42
lw $t5,0($t5)
jalr $t5
# BACK FROM FUNCTION
# Original instruction: addi v43,$sp,0
addi $t5,$sp,0
la $t0,label_141_v43
sw $t5,0($t0)
# END INSTANCE FUNCALL EXPR FOR extra
# Return statement start
# Original instruction: addi v44,$zero,0
addi $t5,$zero,0
la $t0,label_144_v44
sw $t5,0($t0)
# Original instruction: addiu v45,$fp,0
addiu $t5,$fp,0
la $t0,label_145_v45
sw $t5,0($t0)
# Loading from v44 from reg into v45
# Original instruction: sw v44,0(v45)
la $t5,label_144_v44
lw $t5,0($t5)
la $t4,label_145_v45
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: jal mainEND
jal mainEND
# Return statement end
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v26,0
la $t5,label_146_v26
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_108_v28
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_140_v42
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_121_v34
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_127_v37
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_130_v38
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_111_v30
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_141_v43
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_109_v29
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_105_v27
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_137_v41
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_139_v40
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_124_v35
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_144_v44
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_131_v39
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_146_v26
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_125_v36
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_123_v33
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_145_v45
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_114_v31
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_115_v32
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

