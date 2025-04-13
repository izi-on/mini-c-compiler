.data
label_25_Author_vtable:
label_26_Book_vtable:
# Allocated labels for virtual registers
# Allocated labels for virtual registers
label_39_v0:
.space 4
# Allocated labels for virtual registers
label_41_v1:
.space 4
# Allocated labels for virtual registers
label_43_v2:
.space 4
# Allocated labels for virtual registers
label_45_v3:
.space 4
# Allocated labels for virtual registers
label_47_v4:
.space 4
# Allocated labels for virtual registers
label_49_v5:
.space 4
# Allocated labels for virtual registers
label_60_v10:
.space 4
label_59_v8:
.space 4
label_57_v9:
.space 4
label_52_v7:
.space 4
label_80_v16:
.space 4
label_79_v11:
.space 4
label_74_v18:
.space 4
label_69_v13:
.space 4
label_73_v15:
.space 4
label_77_v17:
.space 4
label_76_v14:
.space 4
label_65_v12:
.space 4
label_81_v6:
.space 4
# Allocated labels for virtual registers
label_129_v39:
.space 4
label_100_v24:
.space 4
label_115_v32:
.space 4
label_95_v23:
.space 4
label_98_v27:
.space 4
label_142_v44:
.space 4
label_130_v35:
.space 4
label_143_v19:
.space 4
label_84_v20:
.space 4
label_107_v30:
.space 4
label_123_v36:
.space 4
label_122_v33:
.space 4
label_141_v40:
.space 4
label_133_v41:
.space 4
label_106_v26:
.space 4
label_119_v34:
.space 4
label_87_v21:
.space 4
label_103_v29:
.space 4
label_139_v42:
.space 4
label_104_v28:
.space 4
label_120_v37:
.space 4
label_111_v31:
.space 4
label_135_v38:
.space 4
label_138_v43:
.space 4
label_88_v22:
.space 4
label_94_v25:
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
la $t0,label_39_v0
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v0,$sp,0
addi $t5,$sp,0
la $t0,label_39_v0
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
la $t5,label_39_v0
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_39_v0
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
la $t0,label_41_v1
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v1,$sp,0
addi $t5,$sp,0
la $t0,label_41_v1
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
la $t5,label_41_v1
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_41_v1
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
la $t0,label_43_v2
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v2,$sp,0
addi $t5,$sp,0
la $t0,label_43_v2
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
la $t5,label_43_v2
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_43_v2
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
la $t0,label_45_v3
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v3,$sp,0
addi $t5,$sp,0
la $t0,label_45_v3
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
la $t5,label_45_v3
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_45_v3
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
la $t0,label_47_v4
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v4,$sp,0
addi $t5,$sp,0
la $t0,label_47_v4
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
la $t5,label_47_v4
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_47_v4
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
la $t0,label_49_v5
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v5,$sp,0
addi $t5,$sp,0
la $t0,label_49_v5
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
la $t5,label_49_v5
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_49_v5
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
setAuthorName:
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
la $t0,label_60_v10
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_59_v8
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_57_v9
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_52_v7
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_80_v16
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_79_v11
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_74_v18
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_69_v13
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_73_v15
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_77_v17
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_76_v14
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_65_v12
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_81_v6
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v6,$sp,0
addi $t5,$sp,0
la $t0,label_81_v6
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: la v7,label_25_Author_vtable
la $t5,label_25_Author_vtable
la $t0,label_52_v7
sw $t5,0($t0)
# Original instruction: addiu $sp,$sp,-8
addiu $sp,$sp,-8
# Original instruction: sw v7,0($sp)
la $t5,label_52_v7
lw $t5,0($t5)
sw $t5,0($sp)
# Original instruction: addiu v8,$sp,0
addiu $t5,$sp,0
la $t0,label_59_v8
sw $t5,0($t0)
# Original instruction: addiu v9,$fp,0
addiu $t5,$fp,0
la $t0,label_57_v9
sw $t5,0($t0)
# Original instruction: lw v9,0(v9)
la $t4,label_57_v9
lw $t4,0($t4)
lw $t4,0($t4)
la $t0,label_57_v9
sw $t4,0($t0)
# Original instruction: addiu v10,v9,4
la $t5,label_57_v9
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_60_v10
sw $t4,0($t0)
# Loading from v8 from reg into v10
# Original instruction: sw v8,0(v10)
la $t5,label_59_v8
lw $t5,0($t5)
la $t4,label_60_v10
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addi v11,$zero,65
addi $t5,$zero,65
la $t0,label_79_v11
sw $t5,0($t0)
# Original instruction: addiu v12,$fp,0
addiu $t5,$fp,0
la $t0,label_65_v12
sw $t5,0($t0)
# Original instruction: lw v12,0(v12)
la $t4,label_65_v12
lw $t4,0($t4)
lw $t4,0($t4)
la $t0,label_65_v12
sw $t4,0($t0)
# Original instruction: addiu v13,v12,4
la $t5,label_65_v12
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_69_v13
sw $t4,0($t0)
# Original instruction: lw v13,0(v13)
la $t4,label_69_v13
lw $t4,0($t4)
lw $t4,0($t4)
la $t0,label_69_v13
sw $t4,0($t0)
# Original instruction: addiu v14,v13,4
la $t5,label_69_v13
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_76_v14
sw $t4,0($t0)
# Original instruction: addi v15,$zero,0
addi $t5,$zero,0
la $t0,label_73_v15
sw $t5,0($t0)
# Original instruction: li v18,1
li $t5,1
la $t0,label_74_v18
sw $t5,0($t0)
# Original instruction: mul v17,v15,v18
la $t5,label_73_v15
lw $t5,0($t5)
la $t4,label_74_v18
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_77_v17
sw $t3,0($t0)
# Original instruction: add v16,v14,v17
la $t5,label_76_v14
lw $t5,0($t5)
la $t4,label_77_v17
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_80_v16
sw $t3,0($t0)
# Loading from v11 from reg into v16
# Original instruction: sb v11,0(v16)
la $t5,label_79_v11
lw $t5,0($t5)
la $t4,label_80_v16
lw $t4,0($t4)
sb $t5,0($t4)
# BEGIN EPILOGUE
setAuthorNameEND:
# Original instruction: addi $sp,v6,0
la $t5,label_81_v6
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_81_v6
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_65_v12
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_76_v14
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_77_v17
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_73_v15
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_69_v13
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_74_v18
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_79_v11
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_80_v16
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_52_v7
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_57_v9
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_59_v8
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_60_v10
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
label_31_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,13
slti $t2,$t0,13
# Original instruction: bne $t2,$zero,label_31_clean_loop
bne $t2,$zero,label_31_clean_loop
label_32_clean_loop_end:
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
la $t0,label_129_v39
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_100_v24
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_115_v32
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_95_v23
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_98_v27
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_142_v44
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_130_v35
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_143_v19
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_84_v20
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_107_v30
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_123_v36
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_122_v33
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_141_v40
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_133_v41
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_106_v26
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_119_v34
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_87_v21
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_103_v29
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_139_v42
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_104_v28
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_120_v37
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_111_v31
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_135_v38
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_138_v43
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_88_v22
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_94_v25
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v19,$sp,0
addi $t5,$sp,0
la $t0,label_143_v19
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: la v20,label_26_Book_vtable
la $t5,label_26_Book_vtable
la $t0,label_84_v20
sw $t5,0($t0)
# Original instruction: addiu $sp,$sp,-8
addiu $sp,$sp,-8
# Original instruction: sw v20,0($sp)
la $t5,label_84_v20
lw $t5,0($t5)
sw $t5,0($sp)
# Original instruction: addiu v21,$sp,0
addiu $t5,$sp,0
la $t0,label_87_v21
sw $t5,0($t0)
# Original instruction: addiu v22,$fp,-12
addiu $t5,$fp,-12
la $t0,label_88_v22
sw $t5,0($t0)
# Loading from v21 from reg into v22
# Original instruction: sw v21,0(v22)
la $t5,label_87_v21
lw $t5,0($t5)
la $t4,label_88_v22
lw $t4,0($t4)
sw $t5,0($t4)
# BEGIN FUNCALL EXPR FOR setAuthorName
# LOADING ARG: ClassType{name='Book'}
# GETTING  VALUE
# Original instruction: addiu v23,$fp,-12
addiu $t5,$fp,-12
la $t0,label_95_v23
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v24,$sp,0
addi $t5,$sp,0
la $t0,label_100_v24
sw $t5,0($t0)
# 
# Loading from v23 from stack into v24
# Original instruction: li v25,4
li $t5,4
la $t0,label_94_v25
sw $t5,0($t0)
# Original instruction: li v26,0
li $t5,0
la $t0,label_106_v26
sw $t5,0($t0)
label_33_mem_copy_loop:
# Original instruction: beq v26,v25,label_34_mem_copy_end
la $t5,label_106_v26
lw $t5,0($t5)
la $t4,label_94_v25
lw $t4,0($t4)
beq $t5,$t4,label_34_mem_copy_end
# Original instruction: add v27,v23,v26
la $t5,label_95_v23
lw $t5,0($t5)
la $t4,label_106_v26
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_98_v27
sw $t3,0($t0)
# Original instruction: lb v29,0(v27)
la $t5,label_98_v27
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_103_v29
sw $t4,0($t0)
# Original instruction: add v28,v24,v26
la $t5,label_100_v24
lw $t5,0($t5)
la $t4,label_106_v26
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_104_v28
sw $t3,0($t0)
# Original instruction: sb v29,0(v28)
la $t5,label_103_v29
lw $t5,0($t5)
la $t4,label_104_v28
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: addi v26,v26,1
la $t4,label_106_v26
lw $t4,0($t4)
addi $t4,$t4,1
la $t0,label_106_v26
sw $t4,0($t0)
# Original instruction: j label_33_mem_copy_loop
j label_33_mem_copy_loop
label_34_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal setAuthorName
jal setAuthorName
# BACK FROM FUNCTION
# Original instruction: addi v30,$sp,0
addi $t5,$sp,0
la $t0,label_107_v30
sw $t5,0($t0)
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addiu v31,$fp,-12
addiu $t5,$fp,-12
la $t0,label_111_v31
sw $t5,0($t0)
# Original instruction: lw v31,0(v31)
la $t4,label_111_v31
lw $t4,0($t4)
lw $t4,0($t4)
la $t0,label_111_v31
sw $t4,0($t0)
# Original instruction: addiu v32,v31,4
la $t5,label_111_v31
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_115_v32
sw $t4,0($t0)
# Original instruction: lw v32,0(v32)
la $t4,label_115_v32
lw $t4,0($t4)
lw $t4,0($t4)
la $t0,label_115_v32
sw $t4,0($t0)
# Original instruction: addiu v33,v32,4
la $t5,label_115_v32
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_122_v33
sw $t4,0($t0)
# Original instruction: addi v34,$zero,0
addi $t5,$zero,0
la $t0,label_119_v34
sw $t5,0($t0)
# Original instruction: li v37,1
li $t5,1
la $t0,label_120_v37
sw $t5,0($t0)
# Original instruction: mul v36,v34,v37
la $t5,label_119_v34
lw $t5,0($t5)
la $t4,label_120_v37
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_123_v36
sw $t3,0($t0)
# Original instruction: add v35,v33,v36
la $t5,label_122_v33
lw $t5,0($t5)
la $t4,label_123_v36
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_130_v35
sw $t3,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v38,$sp,0
addi $t5,$sp,0
la $t0,label_135_v38
sw $t5,0($t0)
# 
# Loading from v35 from stack into v38
# Original instruction: li v39,1
li $t5,1
la $t0,label_129_v39
sw $t5,0($t0)
# Original instruction: li v40,0
li $t5,0
la $t0,label_141_v40
sw $t5,0($t0)
label_35_mem_copy_loop:
# Original instruction: beq v40,v39,label_36_mem_copy_end
la $t5,label_141_v40
lw $t5,0($t5)
la $t4,label_129_v39
lw $t4,0($t4)
beq $t5,$t4,label_36_mem_copy_end
# Original instruction: add v41,v35,v40
la $t5,label_130_v35
lw $t5,0($t5)
la $t4,label_141_v40
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_133_v41
sw $t3,0($t0)
# Original instruction: lb v43,0(v41)
la $t5,label_133_v41
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_138_v43
sw $t4,0($t0)
# Original instruction: add v42,v38,v40
la $t5,label_135_v38
lw $t5,0($t5)
la $t4,label_141_v40
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_139_v42
sw $t3,0($t0)
# Original instruction: sb v43,0(v42)
la $t5,label_138_v43
lw $t5,0($t5)
la $t4,label_139_v42
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: addi v40,v40,1
la $t4,label_141_v40
lw $t4,0($t4)
addi $t4,$t4,1
la $t0,label_141_v40
sw $t4,0($t0)
# Original instruction: j label_35_mem_copy_loop
j label_35_mem_copy_loop
label_36_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# Original instruction: addi v44,$sp,0
addi $t5,$sp,0
la $t0,label_142_v44
sw $t5,0($t0)
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v19,0
la $t5,label_143_v19
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_94_v25
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_88_v22
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_138_v43
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_135_v38
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_111_v31
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_120_v37
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_104_v28
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_139_v42
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_103_v29
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_87_v21
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_119_v34
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_106_v26
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_133_v41
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_141_v40
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_122_v33
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_123_v36
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_107_v30
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_84_v20
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_143_v19
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_130_v35
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_142_v44
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_98_v27
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_95_v23
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_115_v32
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_100_v24
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_129_v39
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

