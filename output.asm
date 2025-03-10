.data
# Allocated labels for virtual registers
# Allocated labels for virtual registers
label_41_v0:
.space 4
# Allocated labels for virtual registers
label_43_v1:
.space 4
# Allocated labels for virtual registers
label_45_v2:
.space 4
# Allocated labels for virtual registers
label_47_v3:
.space 4
# Allocated labels for virtual registers
label_49_v4:
.space 4
# Allocated labels for virtual registers
label_51_v5:
.space 4
# Allocated labels for virtual registers
label_57_v9:
.space 4
label_70_v15:
.space 4
label_81_v21:
.space 4
label_68_v14:
.space 4
label_58_v8:
.space 4
label_62_v11:
.space 4
label_64_v10:
.space 4
label_77_v19:
.space 4
label_86_v23:
.space 4
label_89_v24:
.space 4
label_67_v13:
.space 4
label_76_v18:
.space 4
label_90_v25:
.space 4
label_54_v7:
.space 4
label_91_v6:
.space 4
label_85_v16:
.space 4
label_80_v20:
.space 4
label_73_v17:
.space 4
label_61_v12:
.space 4
label_83_v22:
.space 4
# Allocated labels for virtual registers
label_125_v42:
.space 4
label_112_v36:
.space 4
label_144_v45:
.space 4
label_115_v37:
.space 4
label_145_v26:
.space 4
label_96_v28:
.space 4
label_141_v44:
.space 4
label_106_v33:
.space 4
label_111_v34:
.space 4
label_122_v41:
.space 4
label_95_v27:
.space 4
label_126_v43:
.space 4
label_116_v38:
.space 4
label_139_v48:
.space 4
label_131_v46:
.space 4
label_104_v32:
.space 4
label_143_v49:
.space 4
label_101_v31:
.space 4
label_118_v39:
.space 4
label_121_v40:
.space 4
label_135_v47:
.space 4
label_98_v29:
.space 4
label_109_v35:
.space 4
label_102_v30:
.space 4
# Allocated labels for virtual registers
label_149_v51:
.space 4
label_173_v61:
.space 4
label_202_v50:
.space 4
label_200_v72:
.space 4
label_193_v65:
.space 4
label_169_v59:
.space 4
label_178_v64:
.space 4
label_177_v63:
.space 4
label_163_v57:
.space 4
label_183_v67:
.space 4
label_187_v68:
.space 4
label_150_v52:
.space 4
label_191_v69:
.space 4
label_159_v56:
.space 4
label_167_v58:
.space 4
label_168_v54:
.space 4
label_196_v66:
.space 4
label_195_v70:
.space 4
label_172_v60:
.space 4
label_165_v53:
.space 4
label_174_v62:
.space 4
label_197_v71:
.space 4
label_201_v73:
.space 4
label_155_v55:
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
# Original instruction: pushRegisters
la $t0,label_41_v0
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v0,$sp,0
addi $t5,$sp,0
la $t0,label_41_v0
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
la $t5,label_41_v0
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_41_v0
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
# Original instruction: pushRegisters
la $t0,label_43_v1
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v1,$sp,0
addi $t5,$sp,0
la $t0,label_43_v1
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
la $t5,label_43_v1
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_43_v1
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
# Original instruction: pushRegisters
la $t0,label_45_v2
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v2,$sp,0
addi $t5,$sp,0
la $t0,label_45_v2
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
la $t5,label_45_v2
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_45_v2
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
# Original instruction: pushRegisters
la $t0,label_47_v3
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v3,$sp,0
addi $t5,$sp,0
la $t0,label_47_v3
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
la $t5,label_47_v3
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_47_v3
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
# Original instruction: pushRegisters
la $t0,label_49_v4
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v4,$sp,0
addi $t5,$sp,0
la $t0,label_49_v4
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
la $t5,label_49_v4
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_49_v4
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
# Original instruction: pushRegisters
la $t0,label_51_v5
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v5,$sp,0
addi $t5,$sp,0
la $t0,label_51_v5
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
la $t5,label_51_v5
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_51_v5
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
factorial_rec:
# Clearing entire allocated stack frame of size 8
# Original instruction: li $t0,1
li $t0,1
label_26_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_26_clean_loop
bne $t2,$zero,label_26_clean_loop
label_27_clean_loop_end:
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
la $t0,label_57_v9
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_70_v15
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_81_v21
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_68_v14
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_58_v8
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_62_v11
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_64_v10
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_77_v19
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_86_v23
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_89_v24
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_67_v13
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_76_v18
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_90_v25
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_54_v7
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_91_v6
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_85_v16
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_80_v20
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_73_v17
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_61_v12
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_83_v22
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v6,$sp,0
addi $t5,$sp,0
la $t0,label_91_v6
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: addiu v7,$fp,4
addiu $t5,$fp,4
la $t0,label_54_v7
sw $t5,0($t0)
# Original instruction: lw v8,0(v7)
la $t5,label_54_v7
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_58_v8
sw $t4,0($t0)
# Original instruction: addi v9,$zero,1
addi $t5,$zero,1
la $t0,label_57_v9
sw $t5,0($t0)
# Original instruction: slt v11,v9,v8
la $t5,label_57_v9
lw $t5,0($t5)
la $t4,label_58_v8
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t0,label_62_v11
sw $t3,0($t0)
# Original instruction: addi v12,$zero,1
addi $t5,$zero,1
la $t0,label_61_v12
sw $t5,0($t0)
# Original instruction: sub v10,v12,v11
la $t5,label_61_v12
lw $t5,0($t5)
la $t4,label_62_v11
lw $t4,0($t4)
sub $t3,$t5,$t4
la $t0,label_64_v10
sw $t3,0($t0)
# Original instruction: beqz v10,label_28_else
la $t5,label_64_v10
lw $t5,0($t5)
beqz $t5,label_28_else
# Return statement start
# Original instruction: addi v13,$zero,1
addi $t5,$zero,1
la $t0,label_67_v13
sw $t5,0($t0)
# Original instruction: addiu v14,$fp,0
addiu $t5,$fp,0
la $t0,label_68_v14
sw $t5,0($t0)
# Loading from v13 from reg into v14
# Original instruction: sw v13,0(v14)
la $t5,label_67_v13
lw $t5,0($t5)
la $t4,label_68_v14
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: jal factorial_recEND
jal factorial_recEND
# Return statement end
# Original instruction: j label_29_end
j label_29_end
label_28_else:
# Return statement start
# Original instruction: addiu v15,$fp,4
addiu $t5,$fp,4
la $t0,label_70_v15
sw $t5,0($t0)
# Original instruction: lw v16,0(v15)
la $t5,label_70_v15
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_85_v16
sw $t4,0($t0)
# BEGIN FUNCALL EXPR FOR factorial_rec
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v17,$fp,4
addiu $t5,$fp,4
la $t0,label_73_v17
sw $t5,0($t0)
# Original instruction: lw v18,0(v17)
la $t5,label_73_v17
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_76_v18
sw $t4,0($t0)
# Original instruction: addi v19,$zero,1
addi $t5,$zero,1
la $t0,label_77_v19
sw $t5,0($t0)
# Original instruction: sub v20,v18,v19
la $t5,label_76_v18
lw $t5,0($t5)
la $t4,label_77_v19
lw $t4,0($t4)
sub $t3,$t5,$t4
la $t0,label_80_v20
sw $t3,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v21,$sp,0
addi $t5,$sp,0
la $t0,label_81_v21
sw $t5,0($t0)
# Loading from v20 from reg into v21
# Original instruction: sw v20,0(v21)
la $t5,label_80_v20
lw $t5,0($t5)
la $t4,label_81_v21
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal factorial_rec
jal factorial_rec
# BACK FROM FUNCTION
# Original instruction: addi v22,$sp,0
addi $t5,$sp,0
la $t0,label_83_v22
sw $t5,0($t0)
# Original instruction: lw v23,0(v22)
la $t5,label_83_v22
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_86_v23
sw $t4,0($t0)
# Original instruction: mul v24,v16,v23
la $t5,label_85_v16
lw $t5,0($t5)
la $t4,label_86_v23
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_89_v24
sw $t3,0($t0)
# Original instruction: addiu v25,$fp,0
addiu $t5,$fp,0
la $t0,label_90_v25
sw $t5,0($t0)
# Loading from v24 from reg into v25
# Original instruction: sw v24,0(v25)
la $t5,label_89_v24
lw $t5,0($t5)
la $t4,label_90_v25
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: jal factorial_recEND
jal factorial_recEND
# Return statement end
label_29_end:
# BEGIN EPILOGUE
factorial_recEND:
# Original instruction: addi $sp,v6,0
la $t5,label_91_v6
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_83_v22
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_61_v12
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_73_v17
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_80_v20
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_85_v16
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_91_v6
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_54_v7
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_90_v25
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_76_v18
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_67_v13
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_89_v24
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_86_v23
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_77_v19
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_64_v10
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_62_v11
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_58_v8
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_68_v14
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_81_v21
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_70_v15
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_57_v9
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
factorial_iter:
# Clearing entire allocated stack frame of size 12
# Original instruction: li $t0,1
li $t0,1
label_32_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,13
slti $t2,$t0,13
# Original instruction: bne $t2,$zero,label_32_clean_loop
bne $t2,$zero,label_32_clean_loop
label_33_clean_loop_end:
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
la $t0,label_125_v42
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_112_v36
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_144_v45
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_115_v37
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_145_v26
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_96_v28
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_141_v44
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_106_v33
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_111_v34
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_122_v41
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_95_v27
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_126_v43
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_116_v38
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_139_v48
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_131_v46
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_104_v32
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_143_v49
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_101_v31
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_118_v39
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_121_v40
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_135_v47
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_98_v29
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_109_v35
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_102_v30
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v26,$sp,0
addi $t5,$sp,0
la $t0,label_145_v26
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: addi v27,$zero,1
addi $t5,$zero,1
la $t0,label_95_v27
sw $t5,0($t0)
# Original instruction: addiu v28,$fp,-12
addiu $t5,$fp,-12
la $t0,label_96_v28
sw $t5,0($t0)
# Loading from v27 from reg into v28
# Original instruction: sw v27,0(v28)
la $t5,label_95_v27
lw $t5,0($t5)
la $t4,label_96_v28
lw $t4,0($t4)
sw $t5,0($t4)
label_34_while_start:
# Original instruction: addiu v29,$fp,4
addiu $t5,$fp,4
la $t0,label_98_v29
sw $t5,0($t0)
# Original instruction: lw v30,0(v29)
la $t5,label_98_v29
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_102_v30
sw $t4,0($t0)
# Original instruction: addi v31,$zero,1
addi $t5,$zero,1
la $t0,label_101_v31
sw $t5,0($t0)
# Original instruction: slt v32,v31,v30
la $t5,label_101_v31
lw $t5,0($t5)
la $t4,label_102_v30
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t0,label_104_v32
sw $t3,0($t0)
# Original instruction: beqz v32,label_35_while_end
la $t5,label_104_v32
lw $t5,0($t5)
beqz $t5,label_35_while_end
# Original instruction: addiu v33,$fp,-12
addiu $t5,$fp,-12
la $t0,label_106_v33
sw $t5,0($t0)
# Original instruction: lw v34,0(v33)
la $t5,label_106_v33
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_111_v34
sw $t4,0($t0)
# Original instruction: addiu v35,$fp,4
addiu $t5,$fp,4
la $t0,label_109_v35
sw $t5,0($t0)
# Original instruction: lw v36,0(v35)
la $t5,label_109_v35
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_112_v36
sw $t4,0($t0)
# Original instruction: mul v37,v34,v36
la $t5,label_111_v34
lw $t5,0($t5)
la $t4,label_112_v36
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_115_v37
sw $t3,0($t0)
# Original instruction: addiu v38,$fp,-12
addiu $t5,$fp,-12
la $t0,label_116_v38
sw $t5,0($t0)
# Loading from v37 from reg into v38
# Original instruction: sw v37,0(v38)
la $t5,label_115_v37
lw $t5,0($t5)
la $t4,label_116_v38
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addiu v39,$fp,4
addiu $t5,$fp,4
la $t0,label_118_v39
sw $t5,0($t0)
# Original instruction: lw v40,0(v39)
la $t5,label_118_v39
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_121_v40
sw $t4,0($t0)
# Original instruction: addi v41,$zero,1
addi $t5,$zero,1
la $t0,label_122_v41
sw $t5,0($t0)
# Original instruction: sub v42,v40,v41
la $t5,label_121_v40
lw $t5,0($t5)
la $t4,label_122_v41
lw $t4,0($t4)
sub $t3,$t5,$t4
la $t0,label_125_v42
sw $t3,0($t0)
# Original instruction: addiu v43,$fp,4
addiu $t5,$fp,4
la $t0,label_126_v43
sw $t5,0($t0)
# Loading from v42 from reg into v43
# Original instruction: sw v42,0(v43)
la $t5,label_125_v42
lw $t5,0($t5)
la $t4,label_126_v43
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: j label_34_while_start
j label_34_while_start
label_35_while_end:
# Return statement start
# Original instruction: addiu v44,$fp,-12
addiu $t5,$fp,-12
la $t0,label_141_v44
sw $t5,0($t0)
# Original instruction: addiu v45,$fp,0
addiu $t5,$fp,0
la $t0,label_144_v45
sw $t5,0($t0)
# 
# Loading from v44 from stack into v45
# Original instruction: lb v46,0(v44)
la $t5,label_141_v44
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_131_v46
sw $t4,0($t0)
# Original instruction: sb v46,0(v45)
la $t5,label_131_v46
lw $t5,0($t5)
la $t4,label_144_v45
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v47,1(v44)
la $t5,label_141_v44
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_135_v47
sw $t4,0($t0)
# Original instruction: sb v47,1(v45)
la $t5,label_135_v47
lw $t5,0($t5)
la $t4,label_144_v45
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v48,2(v44)
la $t5,label_141_v44
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_139_v48
sw $t4,0($t0)
# Original instruction: sb v48,2(v45)
la $t5,label_139_v48
lw $t5,0($t5)
la $t4,label_144_v45
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v49,3(v44)
la $t5,label_141_v44
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_143_v49
sw $t4,0($t0)
# Original instruction: sb v49,3(v45)
la $t5,label_143_v49
lw $t5,0($t5)
la $t4,label_144_v45
lw $t4,0($t4)
sb $t5,3($t4)
# 
# Original instruction: jal factorial_iterEND
jal factorial_iterEND
# Return statement end
# BEGIN EPILOGUE
factorial_iterEND:
# Original instruction: addi $sp,v26,0
la $t5,label_145_v26
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_102_v30
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_109_v35
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_98_v29
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_135_v47
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_121_v40
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_118_v39
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_101_v31
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_143_v49
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_104_v32
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_131_v46
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_139_v48
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_116_v38
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_126_v43
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_95_v27
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_122_v41
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_111_v34
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_106_v33
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_141_v44
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_96_v28
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_145_v26
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_115_v37
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_144_v45
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_112_v36
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_125_v42
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
# Original instruction: li $t0,1
li $t0,1
label_37_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_37_clean_loop
bne $t2,$zero,label_37_clean_loop
label_38_clean_loop_end:
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
la $t0,label_149_v51
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_173_v61
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_202_v50
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_200_v72
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_193_v65
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_169_v59
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_178_v64
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_177_v63
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_163_v57
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_183_v67
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_187_v68
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_150_v52
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_191_v69
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_159_v56
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_167_v58
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_168_v54
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_196_v66
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_195_v70
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_172_v60
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_165_v53
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_174_v62
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_197_v71
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_201_v73
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_155_v55
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v50,$sp,0
addi $t5,$sp,0
la $t0,label_202_v50
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# BEGIN FUNCALL EXPR FOR factorial_rec
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v51,$zero,5
addi $t5,$zero,5
la $t0,label_149_v51
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v52,$sp,0
addi $t5,$sp,0
la $t0,label_150_v52
sw $t5,0($t0)
# Loading from v51 from reg into v52
# Original instruction: sw v51,0(v52)
la $t5,label_149_v51
lw $t5,0($t5)
la $t4,label_150_v52
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal factorial_rec
jal factorial_rec
# BACK FROM FUNCTION
# Original instruction: addi v53,$sp,0
addi $t5,$sp,0
la $t0,label_165_v53
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v54,$sp,0
addi $t5,$sp,0
la $t0,label_168_v54
sw $t5,0($t0)
# 
# Loading from v53 from stack into v54
# Original instruction: lb v55,0(v53)
la $t5,label_165_v53
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_155_v55
sw $t4,0($t0)
# Original instruction: sb v55,0(v54)
la $t5,label_155_v55
lw $t5,0($t5)
la $t4,label_168_v54
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v56,1(v53)
la $t5,label_165_v53
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_159_v56
sw $t4,0($t0)
# Original instruction: sb v56,1(v54)
la $t5,label_159_v56
lw $t5,0($t5)
la $t4,label_168_v54
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v57,2(v53)
la $t5,label_165_v53
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_163_v57
sw $t4,0($t0)
# Original instruction: sb v57,2(v54)
la $t5,label_163_v57
lw $t5,0($t5)
la $t4,label_168_v54
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v58,3(v53)
la $t5,label_165_v53
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_167_v58
sw $t4,0($t0)
# Original instruction: sb v58,3(v54)
la $t5,label_167_v58
lw $t5,0($t5)
la $t4,label_168_v54
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
# Original instruction: addi v59,$sp,0
addi $t5,$sp,0
la $t0,label_169_v59
sw $t5,0($t0)
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v60,$zero,44
addi $t5,$zero,44
la $t0,label_172_v60
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v61,$sp,0
addi $t5,$sp,0
la $t0,label_173_v61
sw $t5,0($t0)
# Loading from v60 from reg into v61
# Original instruction: sb v60,0(v61)
la $t5,label_172_v60
lw $t5,0($t5)
la $t4,label_173_v61
lw $t4,0($t4)
sb $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# Original instruction: addi v62,$sp,0
addi $t5,$sp,0
la $t0,label_174_v62
sw $t5,0($t0)
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# BEGIN FUNCALL EXPR FOR factorial_iter
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v63,$zero,5
addi $t5,$zero,5
la $t0,label_177_v63
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v64,$sp,0
addi $t5,$sp,0
la $t0,label_178_v64
sw $t5,0($t0)
# Loading from v63 from reg into v64
# Original instruction: sw v63,0(v64)
la $t5,label_177_v63
lw $t5,0($t5)
la $t4,label_178_v64
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal factorial_iter
jal factorial_iter
# BACK FROM FUNCTION
# Original instruction: addi v65,$sp,0
addi $t5,$sp,0
la $t0,label_193_v65
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v66,$sp,0
addi $t5,$sp,0
la $t0,label_196_v66
sw $t5,0($t0)
# 
# Loading from v65 from stack into v66
# Original instruction: lb v67,0(v65)
la $t5,label_193_v65
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_183_v67
sw $t4,0($t0)
# Original instruction: sb v67,0(v66)
la $t5,label_183_v67
lw $t5,0($t5)
la $t4,label_196_v66
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v68,1(v65)
la $t5,label_193_v65
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_187_v68
sw $t4,0($t0)
# Original instruction: sb v68,1(v66)
la $t5,label_187_v68
lw $t5,0($t5)
la $t4,label_196_v66
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v69,2(v65)
la $t5,label_193_v65
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_191_v69
sw $t4,0($t0)
# Original instruction: sb v69,2(v66)
la $t5,label_191_v69
lw $t5,0($t5)
la $t4,label_196_v66
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v70,3(v65)
la $t5,label_193_v65
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_195_v70
sw $t4,0($t0)
# Original instruction: sb v70,3(v66)
la $t5,label_195_v70
lw $t5,0($t5)
la $t4,label_196_v66
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
# Original instruction: addi v71,$sp,0
addi $t5,$sp,0
la $t0,label_197_v71
sw $t5,0($t0)
# Return statement start
# Original instruction: addi v72,$zero,0
addi $t5,$zero,0
la $t0,label_200_v72
sw $t5,0($t0)
# Original instruction: addiu v73,$fp,0
addiu $t5,$fp,0
la $t0,label_201_v73
sw $t5,0($t0)
# Loading from v72 from reg into v73
# Original instruction: sw v72,0(v73)
la $t5,label_200_v72
lw $t5,0($t5)
la $t4,label_201_v73
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: jal mainEND
jal mainEND
# Return statement end
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v50,0
la $t5,label_202_v50
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_155_v55
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_201_v73
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_197_v71
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_174_v62
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_165_v53
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_172_v60
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_195_v70
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_196_v66
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_168_v54
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_167_v58
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_159_v56
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_191_v69
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_150_v52
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_187_v68
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_183_v67
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_163_v57
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_177_v63
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_178_v64
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_169_v59
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_193_v65
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_200_v72
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_202_v50
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_173_v61
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_149_v51
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

