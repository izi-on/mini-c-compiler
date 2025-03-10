.data
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
label_106_v30:
.space 4
label_82_v15:
.space 4
label_69_v16:
.space 4
label_157_v44:
.space 4
label_53_v7:
.space 4
label_93_v24:
.space 4
label_143_v46:
.space 4
label_63_v13:
.space 4
label_147_v48:
.space 4
label_116_v35:
.space 4
label_73_v17:
.space 4
label_168_v55:
.space 4
label_183_v56:
.space 4
label_151_v49:
.space 4
label_98_v26:
.space 4
label_81_v19:
.space 4
label_54_v8:
.space 4
label_65_v14:
.space 4
label_91_v21:
.space 4
label_104_v29:
.space 4
label_84_v20:
.space 4
label_90_v22:
.space 4
label_141_v45:
.space 4
label_138_v39:
.space 4
label_129_v41:
.space 4
label_103_v28:
.space 4
label_77_v18:
.space 4
label_97_v27:
.space 4
label_167_v52:
.space 4
label_56_v9:
.space 4
label_159_v51:
.space 4
label_137_v43:
.space 4
label_165_v54:
.space 4
label_119_v36:
.space 4
label_160_v47:
.space 4
label_187_v6:
.space 4
label_185_v61:
.space 4
label_120_v37:
.space 4
label_112_v33:
.space 4
label_110_v32:
.space 4
label_155_v50:
.space 4
label_177_v59:
.space 4
label_186_v57:
.space 4
label_125_v40:
.space 4
label_94_v25:
.space 4
label_79_v12:
.space 4
label_135_v38:
.space 4
label_133_v42:
.space 4
label_109_v31:
.space 4
label_100_v23:
.space 4
label_163_v53:
.space 4
label_181_v60:
.space 4
label_60_v11:
.space 4
label_59_v10:
.space 4
label_173_v58:
.space 4
label_115_v34:
.space 4
# Allocated labels for virtual registers
label_296_v103:
.space 4
label_314_v105:
.space 4
label_279_v94:
.space 4
label_313_v109:
.space 4
label_275_v88:
.space 4
label_198_v67:
.space 4
label_285_v97:
.space 4
label_301_v106:
.space 4
label_215_v73:
.space 4
label_292_v101:
.space 4
label_294_v102:
.space 4
label_211_v72:
.space 4
label_235_v78:
.space 4
label_207_v71:
.space 4
label_265_v90:
.space 4
label_318_v111:
.space 4
label_309_v108:
.space 4
label_219_v74:
.space 4
label_250_v82:
.space 4
label_227_v76:
.space 4
label_191_v63:
.space 4
label_231_v77:
.space 4
label_283_v96:
.space 4
label_287_v98:
.space 4
label_196_v66:
.space 4
label_254_v84:
.space 4
label_260_v87:
.space 4
label_278_v89:
.space 4
label_252_v83:
.space 4
label_317_v110:
.space 4
label_290_v99:
.space 4
label_291_v100:
.space 4
label_258_v86:
.space 4
label_248_v69:
.space 4
label_256_v85:
.space 4
label_192_v64:
.space 4
label_281_v95:
.space 4
label_195_v65:
.space 4
label_243_v80:
.space 4
label_277_v93:
.space 4
label_203_v70:
.space 4
label_247_v81:
.space 4
label_305_v107:
.space 4
label_245_v68:
.space 4
label_269_v91:
.space 4
label_223_v75:
.space 4
label_319_v62:
.space 4
label_273_v92:
.space 4
label_239_v79:
.space 4
label_311_v104:
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
la $t0,label_39_v0
lw $t0,0($t0)
addi $sp,$sp,-4
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
addi $sp,$sp,4
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
la $t0,label_41_v1
lw $t0,0($t0)
addi $sp,$sp,-4
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
addi $sp,$sp,4
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
la $t0,label_43_v2
lw $t0,0($t0)
addi $sp,$sp,-4
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
addi $sp,$sp,4
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
la $t0,label_45_v3
lw $t0,0($t0)
addi $sp,$sp,-4
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
addi $sp,$sp,4
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
la $t0,label_47_v4
lw $t0,0($t0)
addi $sp,$sp,-4
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
addi $sp,$sp,4
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
la $t0,label_49_v5
lw $t0,0($t0)
addi $sp,$sp,-4
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
addi $sp,$sp,4
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
createNode:
# Clearing entire allocated stack frame of size 16
# Original instruction: li $t0,1
li $t0,1
label_26_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,17
slti $t2,$t0,17
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
# Original instruction: addiu $sp,$fp,-16
addiu $sp,$fp,-16
# Original instruction: pushRegisters
la $t0,label_106_v30
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_82_v15
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_69_v16
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_157_v44
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_53_v7
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_93_v24
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_143_v46
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_63_v13
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_147_v48
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_116_v35
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_73_v17
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_168_v55
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_183_v56
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_151_v49
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_98_v26
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_81_v19
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_54_v8
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_65_v14
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_91_v21
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_104_v29
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_84_v20
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_90_v22
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_141_v45
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_138_v39
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_129_v41
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_103_v28
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_77_v18
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_97_v27
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_167_v52
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_56_v9
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_159_v51
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_137_v43
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_165_v54
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_119_v36
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_160_v47
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_187_v6
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_185_v61
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_120_v37
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_112_v33
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_110_v32
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_155_v50
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_177_v59
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_186_v57
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_125_v40
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_94_v25
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_79_v12
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_135_v38
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_133_v42
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_109_v31
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_100_v23
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_163_v53
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_181_v60
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_60_v11
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_59_v10
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_173_v58
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_115_v34
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v6,$sp,0
addi $t5,$sp,0
la $t0,label_187_v6
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR mcmalloc
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v7,$zero,12
addi $t5,$zero,12
la $t0,label_53_v7
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v8,$sp,0
addi $t5,$sp,0
la $t0,label_54_v8
sw $t5,0($t0)
# Loading from v7 from reg into v8
# Original instruction: sw v7,0(v8)
la $t5,label_53_v7
lw $t5,0($t5)
la $t4,label_54_v8
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal mcmalloc
jal mcmalloc
# BACK FROM FUNCTION
# Original instruction: addi v9,$sp,0
addi $t5,$sp,0
la $t0,label_56_v9
sw $t5,0($t0)
# Original instruction: lw v10,0(v9)
la $t5,label_56_v9
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_59_v10
sw $t4,0($t0)
# Original instruction: addiu v11,$fp,-12
addiu $t5,$fp,-12
la $t0,label_60_v11
sw $t5,0($t0)
# Loading from v10 from reg into v11
# Original instruction: sw v10,0(v11)
la $t5,label_59_v10
lw $t5,0($t5)
la $t4,label_60_v11
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addiu v12,$fp,4
addiu $t5,$fp,4
la $t0,label_79_v12
sw $t5,0($t0)
# Original instruction: addiu v13,$fp,-12
addiu $t5,$fp,-12
la $t0,label_63_v13
sw $t5,0($t0)
# Original instruction: lw v14,0(v13)
la $t5,label_63_v13
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_65_v14
sw $t4,0($t0)
# Original instruction: addiu v15,v14,0
la $t5,label_65_v14
lw $t5,0($t5)
addiu $t4,$t5,0
la $t0,label_82_v15
sw $t4,0($t0)
# 
# Loading from v12 from stack into v15
# Original instruction: lb v16,0(v12)
la $t5,label_79_v12
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_69_v16
sw $t4,0($t0)
# Original instruction: sb v16,0(v15)
la $t5,label_69_v16
lw $t5,0($t5)
la $t4,label_82_v15
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v17,1(v12)
la $t5,label_79_v12
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_73_v17
sw $t4,0($t0)
# Original instruction: sb v17,1(v15)
la $t5,label_73_v17
lw $t5,0($t5)
la $t4,label_82_v15
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v18,2(v12)
la $t5,label_79_v12
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_77_v18
sw $t4,0($t0)
# Original instruction: sb v18,2(v15)
la $t5,label_77_v18
lw $t5,0($t5)
la $t4,label_82_v15
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v19,3(v12)
la $t5,label_79_v12
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_81_v19
sw $t4,0($t0)
# Original instruction: sb v19,3(v15)
la $t5,label_81_v19
lw $t5,0($t5)
la $t4,label_82_v15
lw $t4,0($t4)
sb $t5,3($t4)
# 
# Original instruction: addiu v20,$fp,4
addiu $t5,$fp,4
la $t0,label_84_v20
sw $t5,0($t0)
# Original instruction: lw v21,0(v20)
la $t5,label_84_v20
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_91_v21
sw $t4,0($t0)
# Original instruction: addi v22,$zero,0
addi $t5,$zero,0
la $t0,label_90_v22
sw $t5,0($t0)
# Original instruction: slt v24,v21,v22
la $t5,label_91_v21
lw $t5,0($t5)
la $t4,label_90_v22
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t0,label_93_v24
sw $t3,0($t0)
# Original instruction: slt v25,v22,v21
la $t5,label_90_v22
lw $t5,0($t5)
la $t4,label_91_v21
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t0,label_94_v25
sw $t3,0($t0)
# Original instruction: or v26,v24,v25
la $t5,label_93_v24
lw $t5,0($t5)
la $t4,label_94_v25
lw $t4,0($t4)
or $t3,$t5,$t4
la $t0,label_98_v26
sw $t3,0($t0)
# Original instruction: addi v27,$zero,1
addi $t5,$zero,1
la $t0,label_97_v27
sw $t5,0($t0)
# Original instruction: sub v23,v27,v26
la $t5,label_97_v27
lw $t5,0($t5)
la $t4,label_98_v26
lw $t4,0($t4)
sub $t3,$t5,$t4
la $t0,label_100_v23
sw $t3,0($t0)
# Original instruction: beqz v23,label_28_else
la $t5,label_100_v23
lw $t5,0($t5)
beqz $t5,label_28_else
# Original instruction: j label_29_end
j label_29_end
label_28_else:
# BEGIN FUNCALL EXPR FOR mcmalloc
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v28,$zero,12
addi $t5,$zero,12
la $t0,label_103_v28
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v29,$sp,0
addi $t5,$sp,0
la $t0,label_104_v29
sw $t5,0($t0)
# Loading from v28 from reg into v29
# Original instruction: sw v28,0(v29)
la $t5,label_103_v28
lw $t5,0($t5)
la $t4,label_104_v29
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal mcmalloc
jal mcmalloc
# BACK FROM FUNCTION
# Original instruction: addi v30,$sp,0
addi $t5,$sp,0
la $t0,label_106_v30
sw $t5,0($t0)
# Original instruction: lw v31,0(v30)
la $t5,label_106_v30
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_109_v31
sw $t4,0($t0)
# Original instruction: addiu v32,$fp,-16
addiu $t5,$fp,-16
la $t0,label_110_v32
sw $t5,0($t0)
# Loading from v31 from reg into v32
# Original instruction: sw v31,0(v32)
la $t5,label_109_v31
lw $t5,0($t5)
la $t4,label_110_v32
lw $t4,0($t4)
sw $t5,0($t4)
# BEGIN FUNCALL EXPR FOR createNode
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v33,$fp,4
addiu $t5,$fp,4
la $t0,label_112_v33
sw $t5,0($t0)
# Original instruction: lw v34,0(v33)
la $t5,label_112_v33
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_115_v34
sw $t4,0($t0)
# Original instruction: addi v35,$zero,1
addi $t5,$zero,1
la $t0,label_116_v35
sw $t5,0($t0)
# Original instruction: sub v36,v34,v35
la $t5,label_115_v34
lw $t5,0($t5)
la $t4,label_116_v35
lw $t4,0($t4)
sub $t3,$t5,$t4
la $t0,label_119_v36
sw $t3,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v37,$sp,0
addi $t5,$sp,0
la $t0,label_120_v37
sw $t5,0($t0)
# Loading from v36 from reg into v37
# Original instruction: sw v36,0(v37)
la $t5,label_119_v36
lw $t5,0($t5)
la $t4,label_120_v37
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal createNode
jal createNode
# BACK FROM FUNCTION
# Original instruction: addi v38,$sp,0
addi $t5,$sp,0
la $t0,label_135_v38
sw $t5,0($t0)
# Original instruction: addiu v39,$fp,-16
addiu $t5,$fp,-16
la $t0,label_138_v39
sw $t5,0($t0)
# 
# Loading from v38 from stack into v39
# Original instruction: lb v40,0(v38)
la $t5,label_135_v38
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_125_v40
sw $t4,0($t0)
# Original instruction: sb v40,0(v39)
la $t5,label_125_v40
lw $t5,0($t5)
la $t4,label_138_v39
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v41,1(v38)
la $t5,label_135_v38
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_129_v41
sw $t4,0($t0)
# Original instruction: sb v41,1(v39)
la $t5,label_129_v41
lw $t5,0($t5)
la $t4,label_138_v39
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v42,2(v38)
la $t5,label_135_v38
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_133_v42
sw $t4,0($t0)
# Original instruction: sb v42,2(v39)
la $t5,label_133_v42
lw $t5,0($t5)
la $t4,label_138_v39
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v43,3(v38)
la $t5,label_135_v38
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_137_v43
sw $t4,0($t0)
# Original instruction: sb v43,3(v39)
la $t5,label_137_v43
lw $t5,0($t5)
la $t4,label_138_v39
lw $t4,0($t4)
sb $t5,3($t4)
# 
# Original instruction: addiu v44,$fp,-16
addiu $t5,$fp,-16
la $t0,label_157_v44
sw $t5,0($t0)
# Original instruction: addiu v45,$fp,-12
addiu $t5,$fp,-12
la $t0,label_141_v45
sw $t5,0($t0)
# Original instruction: lw v46,0(v45)
la $t5,label_141_v45
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_143_v46
sw $t4,0($t0)
# Original instruction: addiu v47,v46,4
la $t5,label_143_v46
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_160_v47
sw $t4,0($t0)
# 
# Loading from v44 from stack into v47
# Original instruction: lb v48,0(v44)
la $t5,label_157_v44
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_147_v48
sw $t4,0($t0)
# Original instruction: sb v48,0(v47)
la $t5,label_147_v48
lw $t5,0($t5)
la $t4,label_160_v47
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v49,1(v44)
la $t5,label_157_v44
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_151_v49
sw $t4,0($t0)
# Original instruction: sb v49,1(v47)
la $t5,label_151_v49
lw $t5,0($t5)
la $t4,label_160_v47
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v50,2(v44)
la $t5,label_157_v44
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_155_v50
sw $t4,0($t0)
# Original instruction: sb v50,2(v47)
la $t5,label_155_v50
lw $t5,0($t5)
la $t4,label_160_v47
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v51,3(v44)
la $t5,label_157_v44
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_159_v51
sw $t4,0($t0)
# Original instruction: sb v51,3(v47)
la $t5,label_159_v51
lw $t5,0($t5)
la $t4,label_160_v47
lw $t4,0($t4)
sb $t5,3($t4)
# 
# Original instruction: addi v52,$zero,1
addi $t5,$zero,1
la $t0,label_167_v52
sw $t5,0($t0)
# Original instruction: addiu v53,$fp,-12
addiu $t5,$fp,-12
la $t0,label_163_v53
sw $t5,0($t0)
# Original instruction: lw v54,0(v53)
la $t5,label_163_v53
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_165_v54
sw $t4,0($t0)
# Original instruction: addiu v55,v54,8
la $t5,label_165_v54
lw $t5,0($t5)
addiu $t4,$t5,8
la $t0,label_168_v55
sw $t4,0($t0)
# Loading from v52 from reg into v55
# Original instruction: sw v52,0(v55)
la $t5,label_167_v52
lw $t5,0($t5)
la $t4,label_168_v55
lw $t4,0($t4)
sw $t5,0($t4)
label_29_end:
# Return statement start
# Original instruction: addiu v56,$fp,-12
addiu $t5,$fp,-12
la $t0,label_183_v56
sw $t5,0($t0)
# Original instruction: addiu v57,$fp,0
addiu $t5,$fp,0
la $t0,label_186_v57
sw $t5,0($t0)
# 
# Loading from v56 from stack into v57
# Original instruction: lb v58,0(v56)
la $t5,label_183_v56
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_173_v58
sw $t4,0($t0)
# Original instruction: sb v58,0(v57)
la $t5,label_173_v58
lw $t5,0($t5)
la $t4,label_186_v57
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v59,1(v56)
la $t5,label_183_v56
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_177_v59
sw $t4,0($t0)
# Original instruction: sb v59,1(v57)
la $t5,label_177_v59
lw $t5,0($t5)
la $t4,label_186_v57
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v60,2(v56)
la $t5,label_183_v56
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_181_v60
sw $t4,0($t0)
# Original instruction: sb v60,2(v57)
la $t5,label_181_v60
lw $t5,0($t5)
la $t4,label_186_v57
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v61,3(v56)
la $t5,label_183_v56
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_185_v61
sw $t4,0($t0)
# Original instruction: sb v61,3(v57)
la $t5,label_185_v61
lw $t5,0($t5)
la $t4,label_186_v57
lw $t4,0($t4)
sb $t5,3($t4)
# 
# Original instruction: jal createNodeEND
jal createNodeEND
# Return statement end
# BEGIN EPILOGUE
createNodeEND:
# Original instruction: addi $sp,v6,0
la $t5,label_187_v6
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_115_v34
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_173_v58
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_59_v10
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_60_v11
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_181_v60
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_163_v53
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_100_v23
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_109_v31
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_133_v42
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_135_v38
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_79_v12
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_94_v25
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_125_v40
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_186_v57
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_177_v59
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_155_v50
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_110_v32
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_112_v33
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_120_v37
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_185_v61
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_187_v6
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_160_v47
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_119_v36
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_165_v54
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_137_v43
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_159_v51
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_56_v9
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_167_v52
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_97_v27
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_77_v18
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_103_v28
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_129_v41
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_138_v39
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_141_v45
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_90_v22
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_84_v20
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_104_v29
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_91_v21
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_65_v14
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_54_v8
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_81_v19
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_98_v26
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_151_v49
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_183_v56
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_168_v55
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_73_v17
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_116_v35
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_147_v48
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_63_v13
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_143_v46
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_93_v24
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_53_v7
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_157_v44
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_69_v16
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_82_v15
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_106_v30
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
# Clearing entire allocated stack frame of size 24
# Original instruction: li $t0,1
li $t0,1
label_31_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,25
slti $t2,$t0,25
# Original instruction: bne $t2,$zero,label_31_clean_loop
bne $t2,$zero,label_31_clean_loop
label_32_clean_loop_end:
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
la $t0,label_296_v103
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_314_v105
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_279_v94
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_313_v109
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_275_v88
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_198_v67
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_285_v97
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_301_v106
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_215_v73
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_292_v101
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_294_v102
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_211_v72
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_235_v78
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_207_v71
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_265_v90
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_318_v111
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_309_v108
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_219_v74
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_250_v82
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_227_v76
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_191_v63
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_231_v77
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_283_v96
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_287_v98
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_196_v66
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_254_v84
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_260_v87
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_278_v89
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_252_v83
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_317_v110
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_290_v99
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_291_v100
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_258_v86
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_248_v69
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_256_v85
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_192_v64
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_281_v95
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_195_v65
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_243_v80
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_277_v93
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_203_v70
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_247_v81
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_305_v107
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_245_v68
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_269_v91
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_223_v75
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_319_v62
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_273_v92
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_239_v79
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_311_v104
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v62,$sp,0
addi $t5,$sp,0
la $t0,label_319_v62
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: addiu v63,$fp,-20
addiu $t5,$fp,-20
la $t0,label_191_v63
sw $t5,0($t0)
# Original instruction: addiu v64,$fp,-24
addiu $t5,$fp,-24
la $t0,label_192_v64
sw $t5,0($t0)
# Loading from v63 from reg into v64
# Original instruction: sw v63,0(v64)
la $t5,label_191_v63
lw $t5,0($t5)
la $t4,label_192_v64
lw $t4,0($t4)
sw $t5,0($t4)
# BEGIN FUNCALL EXPR FOR createNode
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v65,$zero,3
addi $t5,$zero,3
la $t0,label_195_v65
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v66,$sp,0
addi $t5,$sp,0
la $t0,label_196_v66
sw $t5,0($t0)
# Loading from v65 from reg into v66
# Original instruction: sw v65,0(v66)
la $t5,label_195_v65
lw $t5,0($t5)
la $t4,label_196_v66
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal createNode
jal createNode
# BACK FROM FUNCTION
# Original instruction: addi v67,$sp,0
addi $t5,$sp,0
la $t0,label_198_v67
sw $t5,0($t0)
# Original instruction: lw v68,0(v67)
la $t5,label_198_v67
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_245_v68
sw $t4,0($t0)
# Original instruction: addiu v69,$fp,-20
addiu $t5,$fp,-20
la $t0,label_248_v69
sw $t5,0($t0)
# 
# Loading from v68 from stack into v69
# Original instruction: lb v70,0(v68)
la $t5,label_245_v68
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_203_v70
sw $t4,0($t0)
# Original instruction: sb v70,0(v69)
la $t5,label_203_v70
lw $t5,0($t5)
la $t4,label_248_v69
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v71,1(v68)
la $t5,label_245_v68
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_207_v71
sw $t4,0($t0)
# Original instruction: sb v71,1(v69)
la $t5,label_207_v71
lw $t5,0($t5)
la $t4,label_248_v69
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v72,2(v68)
la $t5,label_245_v68
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_211_v72
sw $t4,0($t0)
# Original instruction: sb v72,2(v69)
la $t5,label_211_v72
lw $t5,0($t5)
la $t4,label_248_v69
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v73,3(v68)
la $t5,label_245_v68
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_215_v73
sw $t4,0($t0)
# Original instruction: sb v73,3(v69)
la $t5,label_215_v73
lw $t5,0($t5)
la $t4,label_248_v69
lw $t4,0($t4)
sb $t5,3($t4)
# Original instruction: lb v74,4(v68)
la $t5,label_245_v68
lw $t5,0($t5)
lb $t4,4($t5)
la $t0,label_219_v74
sw $t4,0($t0)
# Original instruction: sb v74,4(v69)
la $t5,label_219_v74
lw $t5,0($t5)
la $t4,label_248_v69
lw $t4,0($t4)
sb $t5,4($t4)
# Original instruction: lb v75,5(v68)
la $t5,label_245_v68
lw $t5,0($t5)
lb $t4,5($t5)
la $t0,label_223_v75
sw $t4,0($t0)
# Original instruction: sb v75,5(v69)
la $t5,label_223_v75
lw $t5,0($t5)
la $t4,label_248_v69
lw $t4,0($t4)
sb $t5,5($t4)
# Original instruction: lb v76,6(v68)
la $t5,label_245_v68
lw $t5,0($t5)
lb $t4,6($t5)
la $t0,label_227_v76
sw $t4,0($t0)
# Original instruction: sb v76,6(v69)
la $t5,label_227_v76
lw $t5,0($t5)
la $t4,label_248_v69
lw $t4,0($t4)
sb $t5,6($t4)
# Original instruction: lb v77,7(v68)
la $t5,label_245_v68
lw $t5,0($t5)
lb $t4,7($t5)
la $t0,label_231_v77
sw $t4,0($t0)
# Original instruction: sb v77,7(v69)
la $t5,label_231_v77
lw $t5,0($t5)
la $t4,label_248_v69
lw $t4,0($t4)
sb $t5,7($t4)
# Original instruction: lb v78,8(v68)
la $t5,label_245_v68
lw $t5,0($t5)
lb $t4,8($t5)
la $t0,label_235_v78
sw $t4,0($t0)
# Original instruction: sb v78,8(v69)
la $t5,label_235_v78
lw $t5,0($t5)
la $t4,label_248_v69
lw $t4,0($t4)
sb $t5,8($t4)
# Original instruction: lb v79,9(v68)
la $t5,label_245_v68
lw $t5,0($t5)
lb $t4,9($t5)
la $t0,label_239_v79
sw $t4,0($t0)
# Original instruction: sb v79,9(v69)
la $t5,label_239_v79
lw $t5,0($t5)
la $t4,label_248_v69
lw $t4,0($t4)
sb $t5,9($t4)
# Original instruction: lb v80,10(v68)
la $t5,label_245_v68
lw $t5,0($t5)
lb $t4,10($t5)
la $t0,label_243_v80
sw $t4,0($t0)
# Original instruction: sb v80,10(v69)
la $t5,label_243_v80
lw $t5,0($t5)
la $t4,label_248_v69
lw $t4,0($t4)
sb $t5,10($t4)
# Original instruction: lb v81,11(v68)
la $t5,label_245_v68
lw $t5,0($t5)
lb $t4,11($t5)
la $t0,label_247_v81
sw $t4,0($t0)
# Original instruction: sb v81,11(v69)
la $t5,label_247_v81
lw $t5,0($t5)
la $t4,label_248_v69
lw $t4,0($t4)
sb $t5,11($t4)
# 
label_33_while_start:
# Original instruction: addiu v82,$fp,-24
addiu $t5,$fp,-24
la $t0,label_250_v82
sw $t5,0($t0)
# Original instruction: lw v83,0(v82)
la $t5,label_250_v82
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_252_v83
sw $t4,0($t0)
# Original instruction: addiu v84,v83,8
la $t5,label_252_v83
lw $t5,0($t5)
addiu $t4,$t5,8
la $t0,label_254_v84
sw $t4,0($t0)
# Original instruction: lw v85,0(v84)
la $t5,label_254_v84
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_256_v85
sw $t4,0($t0)
# Original instruction: beqz v85,label_34_while_end
la $t5,label_256_v85
lw $t5,0($t5)
beqz $t5,label_34_while_end
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v86,$fp,-24
addiu $t5,$fp,-24
la $t0,label_258_v86
sw $t5,0($t0)
# Original instruction: lw v87,0(v86)
la $t5,label_258_v86
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_260_v87
sw $t4,0($t0)
# Original instruction: addiu v88,v87,0
la $t5,label_260_v87
lw $t5,0($t5)
addiu $t4,$t5,0
la $t0,label_275_v88
sw $t4,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v89,$sp,0
addi $t5,$sp,0
la $t0,label_278_v89
sw $t5,0($t0)
# 
# Loading from v88 from stack into v89
# Original instruction: lb v90,0(v88)
la $t5,label_275_v88
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_265_v90
sw $t4,0($t0)
# Original instruction: sb v90,0(v89)
la $t5,label_265_v90
lw $t5,0($t5)
la $t4,label_278_v89
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v91,1(v88)
la $t5,label_275_v88
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_269_v91
sw $t4,0($t0)
# Original instruction: sb v91,1(v89)
la $t5,label_269_v91
lw $t5,0($t5)
la $t4,label_278_v89
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v92,2(v88)
la $t5,label_275_v88
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_273_v92
sw $t4,0($t0)
# Original instruction: sb v92,2(v89)
la $t5,label_273_v92
lw $t5,0($t5)
la $t4,label_278_v89
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v93,3(v88)
la $t5,label_275_v88
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_277_v93
sw $t4,0($t0)
# Original instruction: sb v93,3(v89)
la $t5,label_277_v93
lw $t5,0($t5)
la $t4,label_278_v89
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
# Original instruction: addi v94,$sp,0
addi $t5,$sp,0
la $t0,label_279_v94
sw $t5,0($t0)
# Original instruction: addiu v95,$fp,-24
addiu $t5,$fp,-24
la $t0,label_281_v95
sw $t5,0($t0)
# Original instruction: lw v96,0(v95)
la $t5,label_281_v95
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_283_v96
sw $t4,0($t0)
# Original instruction: addiu v97,v96,8
la $t5,label_283_v96
lw $t5,0($t5)
addiu $t4,$t5,8
la $t0,label_285_v97
sw $t4,0($t0)
# Original instruction: lw v98,0(v97)
la $t5,label_285_v97
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_287_v98
sw $t4,0($t0)
# Original instruction: beqz v98,label_35_else
la $t5,label_287_v98
lw $t5,0($t5)
beqz $t5,label_35_else
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v99,$zero,44
addi $t5,$zero,44
la $t0,label_290_v99
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v100,$sp,0
addi $t5,$sp,0
la $t0,label_291_v100
sw $t5,0($t0)
# Loading from v99 from reg into v100
# Original instruction: sb v99,0(v100)
la $t5,label_290_v99
lw $t5,0($t5)
la $t4,label_291_v100
lw $t4,0($t4)
sb $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# Original instruction: addi v101,$sp,0
addi $t5,$sp,0
la $t0,label_292_v101
sw $t5,0($t0)
# Original instruction: j label_36_end
j label_36_end
label_35_else:
label_36_end:
# Original instruction: addiu v102,$fp,-24
addiu $t5,$fp,-24
la $t0,label_294_v102
sw $t5,0($t0)
# Original instruction: lw v103,0(v102)
la $t5,label_294_v102
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_296_v103
sw $t4,0($t0)
# Original instruction: addiu v104,v103,4
la $t5,label_296_v103
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_311_v104
sw $t4,0($t0)
# Original instruction: addiu v105,$fp,-24
addiu $t5,$fp,-24
la $t0,label_314_v105
sw $t5,0($t0)
# 
# Loading from v104 from stack into v105
# Original instruction: lb v106,0(v104)
la $t5,label_311_v104
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_301_v106
sw $t4,0($t0)
# Original instruction: sb v106,0(v105)
la $t5,label_301_v106
lw $t5,0($t5)
la $t4,label_314_v105
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v107,1(v104)
la $t5,label_311_v104
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_305_v107
sw $t4,0($t0)
# Original instruction: sb v107,1(v105)
la $t5,label_305_v107
lw $t5,0($t5)
la $t4,label_314_v105
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v108,2(v104)
la $t5,label_311_v104
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_309_v108
sw $t4,0($t0)
# Original instruction: sb v108,2(v105)
la $t5,label_309_v108
lw $t5,0($t5)
la $t4,label_314_v105
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v109,3(v104)
la $t5,label_311_v104
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_313_v109
sw $t4,0($t0)
# Original instruction: sb v109,3(v105)
la $t5,label_313_v109
lw $t5,0($t5)
la $t4,label_314_v105
lw $t4,0($t4)
sb $t5,3($t4)
# 
# Original instruction: j label_33_while_start
j label_33_while_start
label_34_while_end:
# Return statement start
# Original instruction: addi v110,$zero,0
addi $t5,$zero,0
la $t0,label_317_v110
sw $t5,0($t0)
# Original instruction: addiu v111,$fp,0
addiu $t5,$fp,0
la $t0,label_318_v111
sw $t5,0($t0)
# Loading from v110 from reg into v111
# Original instruction: sw v110,0(v111)
la $t5,label_317_v110
lw $t5,0($t5)
la $t4,label_318_v111
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: jal mainEND
jal mainEND
# Return statement end
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v62,0
la $t5,label_319_v62
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_311_v104
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_239_v79
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_273_v92
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_319_v62
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_223_v75
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_269_v91
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_245_v68
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_305_v107
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_247_v81
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_203_v70
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_277_v93
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_243_v80
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_195_v65
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_281_v95
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_192_v64
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_256_v85
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_248_v69
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_258_v86
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_291_v100
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_290_v99
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_317_v110
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_252_v83
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_278_v89
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_260_v87
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_254_v84
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_196_v66
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_287_v98
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_283_v96
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_231_v77
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_191_v63
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_227_v76
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_250_v82
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_219_v74
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_309_v108
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_318_v111
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_265_v90
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_207_v71
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_235_v78
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_211_v72
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_294_v102
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_292_v101
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_215_v73
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_301_v106
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_285_v97
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_198_v67
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_275_v88
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_313_v109
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_279_v94
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_314_v105
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_296_v103
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

