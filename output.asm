.data
# Allocated labels for virtual registers
# Allocated labels for virtual registers
label_29_v0:
.space 4
# Allocated labels for virtual registers
label_31_v1:
.space 4
# Allocated labels for virtual registers
label_33_v2:
.space 4
# Allocated labels for virtual registers
label_35_v3:
.space 4
# Allocated labels for virtual registers
label_37_v4:
.space 4
# Allocated labels for virtual registers
label_39_v5:
.space 4
# Allocated labels for virtual registers
label_147_v58:
.space 4
label_129_v53:
.space 4
label_263_v106:
.space 4
label_303_v6:
.space 4
label_110_v41:
.space 4
label_190_v76:
.space 4
label_277_v112:
.space 4
label_116_v47:
.space 4
label_88_v33:
.space 4
label_192_v75:
.space 4
label_79_v24:
.space 4
label_247_v97:
.space 4
label_131_v49:
.space 4
label_248_v100:
.space 4
label_60_v19:
.space 4
label_244_v98:
.space 4
label_68_v20:
.space 4
label_240_v96:
.space 4
label_128_v50:
.space 4
label_265_v102:
.space 4
label_172_v69:
.space 4
label_139_v56:
.space 4
label_149_v54:
.space 4
label_49_v11:
.space 4
label_302_v122:
.space 4
label_226_v92:
.space 4
label_180_v71:
.space 4
label_161_v64:
.space 4
label_96_v34:
.space 4
label_221_v87:
.space 4
label_163_v63:
.space 4
label_160_v61:
.space 4
label_269_v108:
.space 4
label_234_v94:
.space 4
label_216_v89:
.space 4
label_296_v119:
.space 4
label_168_v68:
.space 4
label_276_v109:
.space 4
label_95_v28:
.space 4
label_132_v52:
.space 4
label_151_v59:
.space 4
label_267_v107:
.space 4
label_152_v55:
.space 4
label_294_v114:
.space 4
label_219_v88:
.space 4
label_59_v16:
.space 4
label_105_v39:
.space 4
label_215_v86:
.space 4
label_76_v22:
.space 4
label_157_v62:
.space 4
label_239_v91:
.space 4
label_118_v43:
.space 4
label_115_v44:
.space 4
label_182_v72:
.space 4
label_46_v12:
.space 4
label_73_v23:
.space 4
label_90_v29:
.space 4
label_109_v35:
.space 4
label_62_v15:
.space 4
label_186_v74:
.space 4
label_65_v17:
.space 4
label_158_v65:
.space 4
label_209_v83:
.space 4
label_211_v84:
.space 4
label_91_v32:
.space 4
label_51_v10:
.space 4
label_134_v51:
.space 4
label_274_v113:
.space 4
label_288_v117:
.space 4
label_273_v110:
.space 4
label_121_v45:
.space 4
label_104_v36:
.space 4
label_123_v42:
.space 4
label_143_v57:
.space 4
label_93_v31:
.space 4
label_279_v111:
.space 4
label_301_v121:
.space 4
label_297_v115:
.space 4
label_124_v48:
.space 4
label_67_v14:
.space 4
label_189_v73:
.space 4
label_238_v95:
.space 4
label_245_v101:
.space 4
label_74_v26:
.space 4
label_181_v67:
.space 4
label_284_v116:
.space 4
label_119_v46:
.space 4
label_259_v105:
.space 4
label_197_v80:
.space 4
label_230_v93:
.space 4
label_53_v7:
.space 4
label_101_v37:
.space 4
label_210_v79:
.space 4
label_205_v82:
.space 4
label_187_v77:
.space 4
label_45_v9:
.space 4
label_81_v21:
.space 4
label_268_v103:
.space 4
label_153_v60:
.space 4
label_207_v78:
.space 4
label_255_v104:
.space 4
label_82_v27:
.space 4
label_218_v85:
.space 4
label_77_v25:
.space 4
label_298_v120:
.space 4
label_236_v90:
.space 4
label_107_v38:
.space 4
label_178_v66:
.space 4
label_48_v8:
.space 4
label_176_v70:
.space 4
label_87_v30:
.space 4
label_201_v81:
.space 4
label_250_v99:
.space 4
label_54_v13:
.space 4
label_102_v40:
.space 4
label_292_v118:
.space 4
label_63_v18:
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
la $t0,label_29_v0
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v0,$sp,0
addi $t5,$sp,0
la $t0,label_29_v0
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
la $t5,label_29_v0
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_29_v0
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
la $t0,label_31_v1
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v1,$sp,0
addi $t5,$sp,0
la $t0,label_31_v1
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
la $t5,label_31_v1
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_31_v1
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
la $t0,label_33_v2
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v2,$sp,0
addi $t5,$sp,0
la $t0,label_33_v2
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
la $t5,label_33_v2
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_33_v2
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
la $t0,label_35_v3
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v3,$sp,0
addi $t5,$sp,0
la $t0,label_35_v3
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
la $t5,label_35_v3
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_35_v3
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
la $t0,label_37_v4
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v4,$sp,0
addi $t5,$sp,0
la $t0,label_37_v4
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
la $t5,label_37_v4
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_37_v4
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
la $t0,label_39_v5
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v5,$sp,0
addi $t5,$sp,0
la $t0,label_39_v5
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
la $t5,label_39_v5
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_39_v5
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
# Clearing entire allocated stack frame of size 56
# Original instruction: li $t0,1
li $t0,1
label_25_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,57
slti $t2,$t0,57
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
# Original instruction: addiu $sp,$fp,-56
addiu $sp,$fp,-56
# Original instruction: pushRegisters
la $t0,label_147_v58
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_129_v53
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_263_v106
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_303_v6
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_110_v41
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_190_v76
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_277_v112
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_116_v47
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_88_v33
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_192_v75
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_79_v24
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_247_v97
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_131_v49
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_248_v100
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_60_v19
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_244_v98
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_68_v20
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_240_v96
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_128_v50
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_265_v102
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_172_v69
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_139_v56
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_149_v54
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_49_v11
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_302_v122
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_226_v92
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_180_v71
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_161_v64
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_96_v34
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_221_v87
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_163_v63
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_160_v61
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_269_v108
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_234_v94
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_216_v89
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_296_v119
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_168_v68
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_276_v109
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_95_v28
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_132_v52
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_151_v59
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_267_v107
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_152_v55
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_294_v114
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_219_v88
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_59_v16
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_105_v39
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_215_v86
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_76_v22
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_157_v62
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_239_v91
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_118_v43
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_115_v44
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_182_v72
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_46_v12
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_73_v23
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_90_v29
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_109_v35
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_62_v15
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_186_v74
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_65_v17
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_158_v65
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_209_v83
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_211_v84
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_91_v32
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_51_v10
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_134_v51
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_274_v113
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_288_v117
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_273_v110
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_121_v45
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_104_v36
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_123_v42
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_143_v57
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_93_v31
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_279_v111
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_301_v121
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_297_v115
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_124_v48
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_67_v14
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_189_v73
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_238_v95
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_245_v101
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_74_v26
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_181_v67
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_284_v116
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_119_v46
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_259_v105
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_197_v80
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_230_v93
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_53_v7
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_101_v37
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_210_v79
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_205_v82
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_187_v77
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_45_v9
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_81_v21
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_268_v103
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_153_v60
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_207_v78
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_255_v104
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_82_v27
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_218_v85
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_77_v25
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_298_v120
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_236_v90
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_107_v38
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_178_v66
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_48_v8
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_176_v70
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_87_v30
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_201_v81
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_250_v99
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_54_v13
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_102_v40
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_292_v118
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_63_v18
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v6,$sp,0
addi $t5,$sp,0
la $t0,label_303_v6
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: addi v7,$zero,1
addi $t5,$zero,1
la $t0,label_53_v7
sw $t5,0($t0)
# Original instruction: addiu v8,$fp,-56
addiu $t5,$fp,-56
la $t0,label_48_v8
sw $t5,0($t0)
# Original instruction: addi v9,$zero,0
addi $t5,$zero,0
la $t0,label_45_v9
sw $t5,0($t0)
# Original instruction: li v12,16
li $t5,16
la $t0,label_46_v12
sw $t5,0($t0)
# Original instruction: mul v11,v9,v12
la $t5,label_45_v9
lw $t5,0($t5)
la $t4,label_46_v12
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_49_v11
sw $t3,0($t0)
# Original instruction: add v10,v8,v11
la $t5,label_48_v8
lw $t5,0($t5)
la $t4,label_49_v11
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_51_v10
sw $t3,0($t0)
# Original instruction: addiu v13,v10,4
la $t5,label_51_v10
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_54_v13
sw $t4,0($t0)
# Loading from v7 from reg into v13
# Original instruction: sw v7,0(v13)
la $t5,label_53_v7
lw $t5,0($t5)
la $t4,label_54_v13
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addi v14,$zero,2
addi $t5,$zero,2
la $t0,label_67_v14
sw $t5,0($t0)
# Original instruction: addiu v15,$fp,-56
addiu $t5,$fp,-56
la $t0,label_62_v15
sw $t5,0($t0)
# Original instruction: addi v16,$zero,0
addi $t5,$zero,0
la $t0,label_59_v16
sw $t5,0($t0)
# Original instruction: li v19,16
li $t5,16
la $t0,label_60_v19
sw $t5,0($t0)
# Original instruction: mul v18,v16,v19
la $t5,label_59_v16
lw $t5,0($t5)
la $t4,label_60_v19
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_63_v18
sw $t3,0($t0)
# Original instruction: add v17,v15,v18
la $t5,label_62_v15
lw $t5,0($t5)
la $t4,label_63_v18
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_65_v17
sw $t3,0($t0)
# Original instruction: addiu v20,v17,12
la $t5,label_65_v17
lw $t5,0($t5)
addiu $t4,$t5,12
la $t0,label_68_v20
sw $t4,0($t0)
# Loading from v14 from reg into v20
# Original instruction: sw v14,0(v20)
la $t5,label_67_v14
lw $t5,0($t5)
la $t4,label_68_v20
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addi v21,$zero,3
addi $t5,$zero,3
la $t0,label_81_v21
sw $t5,0($t0)
# Original instruction: addiu v22,$fp,-56
addiu $t5,$fp,-56
la $t0,label_76_v22
sw $t5,0($t0)
# Original instruction: addi v23,$zero,1
addi $t5,$zero,1
la $t0,label_73_v23
sw $t5,0($t0)
# Original instruction: li v26,16
li $t5,16
la $t0,label_74_v26
sw $t5,0($t0)
# Original instruction: mul v25,v23,v26
la $t5,label_73_v23
lw $t5,0($t5)
la $t4,label_74_v26
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_77_v25
sw $t3,0($t0)
# Original instruction: add v24,v22,v25
la $t5,label_76_v22
lw $t5,0($t5)
la $t4,label_77_v25
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_79_v24
sw $t3,0($t0)
# Original instruction: addiu v27,v24,4
la $t5,label_79_v24
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_82_v27
sw $t4,0($t0)
# Loading from v21 from reg into v27
# Original instruction: sw v21,0(v27)
la $t5,label_81_v21
lw $t5,0($t5)
la $t4,label_82_v27
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addi v28,$zero,4
addi $t5,$zero,4
la $t0,label_95_v28
sw $t5,0($t0)
# Original instruction: addiu v29,$fp,-56
addiu $t5,$fp,-56
la $t0,label_90_v29
sw $t5,0($t0)
# Original instruction: addi v30,$zero,1
addi $t5,$zero,1
la $t0,label_87_v30
sw $t5,0($t0)
# Original instruction: li v33,16
li $t5,16
la $t0,label_88_v33
sw $t5,0($t0)
# Original instruction: mul v32,v30,v33
la $t5,label_87_v30
lw $t5,0($t5)
la $t4,label_88_v33
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_91_v32
sw $t3,0($t0)
# Original instruction: add v31,v29,v32
la $t5,label_90_v29
lw $t5,0($t5)
la $t4,label_91_v32
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_93_v31
sw $t3,0($t0)
# Original instruction: addiu v34,v31,12
la $t5,label_93_v31
lw $t5,0($t5)
addiu $t4,$t5,12
la $t0,label_96_v34
sw $t4,0($t0)
# Loading from v28 from reg into v34
# Original instruction: sw v28,0(v34)
la $t5,label_95_v28
lw $t5,0($t5)
la $t4,label_96_v34
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addi v35,$zero,5
addi $t5,$zero,5
la $t0,label_109_v35
sw $t5,0($t0)
# Original instruction: addiu v36,$fp,-56
addiu $t5,$fp,-56
la $t0,label_104_v36
sw $t5,0($t0)
# Original instruction: addi v37,$zero,2
addi $t5,$zero,2
la $t0,label_101_v37
sw $t5,0($t0)
# Original instruction: li v40,16
li $t5,16
la $t0,label_102_v40
sw $t5,0($t0)
# Original instruction: mul v39,v37,v40
la $t5,label_101_v37
lw $t5,0($t5)
la $t4,label_102_v40
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_105_v39
sw $t3,0($t0)
# Original instruction: add v38,v36,v39
la $t5,label_104_v36
lw $t5,0($t5)
la $t4,label_105_v39
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_107_v38
sw $t3,0($t0)
# Original instruction: addiu v41,v38,4
la $t5,label_107_v38
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_110_v41
sw $t4,0($t0)
# Loading from v35 from reg into v41
# Original instruction: sw v35,0(v41)
la $t5,label_109_v35
lw $t5,0($t5)
la $t4,label_110_v41
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: addi v42,$zero,6
addi $t5,$zero,6
la $t0,label_123_v42
sw $t5,0($t0)
# Original instruction: addiu v43,$fp,-56
addiu $t5,$fp,-56
la $t0,label_118_v43
sw $t5,0($t0)
# Original instruction: addi v44,$zero,2
addi $t5,$zero,2
la $t0,label_115_v44
sw $t5,0($t0)
# Original instruction: li v47,16
li $t5,16
la $t0,label_116_v47
sw $t5,0($t0)
# Original instruction: mul v46,v44,v47
la $t5,label_115_v44
lw $t5,0($t5)
la $t4,label_116_v47
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_119_v46
sw $t3,0($t0)
# Original instruction: add v45,v43,v46
la $t5,label_118_v43
lw $t5,0($t5)
la $t4,label_119_v46
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_121_v45
sw $t3,0($t0)
# Original instruction: addiu v48,v45,12
la $t5,label_121_v45
lw $t5,0($t5)
addiu $t4,$t5,12
la $t0,label_124_v48
sw $t4,0($t0)
# Loading from v42 from reg into v48
# Original instruction: sw v42,0(v48)
la $t5,label_123_v42
lw $t5,0($t5)
la $t4,label_124_v48
lw $t4,0($t4)
sw $t5,0($t4)
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v49,$fp,-56
addiu $t5,$fp,-56
la $t0,label_131_v49
sw $t5,0($t0)
# Original instruction: addi v50,$zero,0
addi $t5,$zero,0
la $t0,label_128_v50
sw $t5,0($t0)
# Original instruction: li v53,16
li $t5,16
la $t0,label_129_v53
sw $t5,0($t0)
# Original instruction: mul v52,v50,v53
la $t5,label_128_v50
lw $t5,0($t5)
la $t4,label_129_v53
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_132_v52
sw $t3,0($t0)
# Original instruction: add v51,v49,v52
la $t5,label_131_v49
lw $t5,0($t5)
la $t4,label_132_v52
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_134_v51
sw $t3,0($t0)
# Original instruction: addiu v54,v51,4
la $t5,label_134_v51
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_149_v54
sw $t4,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v55,$sp,0
addi $t5,$sp,0
la $t0,label_152_v55
sw $t5,0($t0)
# 
# Loading from v54 from stack into v55
# Original instruction: lb v56,0(v54)
la $t5,label_149_v54
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_139_v56
sw $t4,0($t0)
# Original instruction: sb v56,0(v55)
la $t5,label_139_v56
lw $t5,0($t5)
la $t4,label_152_v55
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v57,1(v54)
la $t5,label_149_v54
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_143_v57
sw $t4,0($t0)
# Original instruction: sb v57,1(v55)
la $t5,label_143_v57
lw $t5,0($t5)
la $t4,label_152_v55
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v58,2(v54)
la $t5,label_149_v54
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_147_v58
sw $t4,0($t0)
# Original instruction: sb v58,2(v55)
la $t5,label_147_v58
lw $t5,0($t5)
la $t4,label_152_v55
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v59,3(v54)
la $t5,label_149_v54
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_151_v59
sw $t4,0($t0)
# Original instruction: sb v59,3(v55)
la $t5,label_151_v59
lw $t5,0($t5)
la $t4,label_152_v55
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
# Original instruction: addi v60,$sp,0
addi $t5,$sp,0
la $t0,label_153_v60
sw $t5,0($t0)
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v61,$fp,-56
addiu $t5,$fp,-56
la $t0,label_160_v61
sw $t5,0($t0)
# Original instruction: addi v62,$zero,0
addi $t5,$zero,0
la $t0,label_157_v62
sw $t5,0($t0)
# Original instruction: li v65,16
li $t5,16
la $t0,label_158_v65
sw $t5,0($t0)
# Original instruction: mul v64,v62,v65
la $t5,label_157_v62
lw $t5,0($t5)
la $t4,label_158_v65
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_161_v64
sw $t3,0($t0)
# Original instruction: add v63,v61,v64
la $t5,label_160_v61
lw $t5,0($t5)
la $t4,label_161_v64
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_163_v63
sw $t3,0($t0)
# Original instruction: addiu v66,v63,12
la $t5,label_163_v63
lw $t5,0($t5)
addiu $t4,$t5,12
la $t0,label_178_v66
sw $t4,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v67,$sp,0
addi $t5,$sp,0
la $t0,label_181_v67
sw $t5,0($t0)
# 
# Loading from v66 from stack into v67
# Original instruction: lb v68,0(v66)
la $t5,label_178_v66
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_168_v68
sw $t4,0($t0)
# Original instruction: sb v68,0(v67)
la $t5,label_168_v68
lw $t5,0($t5)
la $t4,label_181_v67
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v69,1(v66)
la $t5,label_178_v66
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_172_v69
sw $t4,0($t0)
# Original instruction: sb v69,1(v67)
la $t5,label_172_v69
lw $t5,0($t5)
la $t4,label_181_v67
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v70,2(v66)
la $t5,label_178_v66
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_176_v70
sw $t4,0($t0)
# Original instruction: sb v70,2(v67)
la $t5,label_176_v70
lw $t5,0($t5)
la $t4,label_181_v67
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v71,3(v66)
la $t5,label_178_v66
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_180_v71
sw $t4,0($t0)
# Original instruction: sb v71,3(v67)
la $t5,label_180_v71
lw $t5,0($t5)
la $t4,label_181_v67
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
# Original instruction: addi v72,$sp,0
addi $t5,$sp,0
la $t0,label_182_v72
sw $t5,0($t0)
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v73,$fp,-56
addiu $t5,$fp,-56
la $t0,label_189_v73
sw $t5,0($t0)
# Original instruction: addi v74,$zero,1
addi $t5,$zero,1
la $t0,label_186_v74
sw $t5,0($t0)
# Original instruction: li v77,16
li $t5,16
la $t0,label_187_v77
sw $t5,0($t0)
# Original instruction: mul v76,v74,v77
la $t5,label_186_v74
lw $t5,0($t5)
la $t4,label_187_v77
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_190_v76
sw $t3,0($t0)
# Original instruction: add v75,v73,v76
la $t5,label_189_v73
lw $t5,0($t5)
la $t4,label_190_v76
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_192_v75
sw $t3,0($t0)
# Original instruction: addiu v78,v75,4
la $t5,label_192_v75
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_207_v78
sw $t4,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v79,$sp,0
addi $t5,$sp,0
la $t0,label_210_v79
sw $t5,0($t0)
# 
# Loading from v78 from stack into v79
# Original instruction: lb v80,0(v78)
la $t5,label_207_v78
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_197_v80
sw $t4,0($t0)
# Original instruction: sb v80,0(v79)
la $t5,label_197_v80
lw $t5,0($t5)
la $t4,label_210_v79
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v81,1(v78)
la $t5,label_207_v78
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_201_v81
sw $t4,0($t0)
# Original instruction: sb v81,1(v79)
la $t5,label_201_v81
lw $t5,0($t5)
la $t4,label_210_v79
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v82,2(v78)
la $t5,label_207_v78
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_205_v82
sw $t4,0($t0)
# Original instruction: sb v82,2(v79)
la $t5,label_205_v82
lw $t5,0($t5)
la $t4,label_210_v79
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v83,3(v78)
la $t5,label_207_v78
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_209_v83
sw $t4,0($t0)
# Original instruction: sb v83,3(v79)
la $t5,label_209_v83
lw $t5,0($t5)
la $t4,label_210_v79
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
# Original instruction: addi v84,$sp,0
addi $t5,$sp,0
la $t0,label_211_v84
sw $t5,0($t0)
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v85,$fp,-56
addiu $t5,$fp,-56
la $t0,label_218_v85
sw $t5,0($t0)
# Original instruction: addi v86,$zero,1
addi $t5,$zero,1
la $t0,label_215_v86
sw $t5,0($t0)
# Original instruction: li v89,16
li $t5,16
la $t0,label_216_v89
sw $t5,0($t0)
# Original instruction: mul v88,v86,v89
la $t5,label_215_v86
lw $t5,0($t5)
la $t4,label_216_v89
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_219_v88
sw $t3,0($t0)
# Original instruction: add v87,v85,v88
la $t5,label_218_v85
lw $t5,0($t5)
la $t4,label_219_v88
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_221_v87
sw $t3,0($t0)
# Original instruction: addiu v90,v87,12
la $t5,label_221_v87
lw $t5,0($t5)
addiu $t4,$t5,12
la $t0,label_236_v90
sw $t4,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v91,$sp,0
addi $t5,$sp,0
la $t0,label_239_v91
sw $t5,0($t0)
# 
# Loading from v90 from stack into v91
# Original instruction: lb v92,0(v90)
la $t5,label_236_v90
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_226_v92
sw $t4,0($t0)
# Original instruction: sb v92,0(v91)
la $t5,label_226_v92
lw $t5,0($t5)
la $t4,label_239_v91
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v93,1(v90)
la $t5,label_236_v90
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_230_v93
sw $t4,0($t0)
# Original instruction: sb v93,1(v91)
la $t5,label_230_v93
lw $t5,0($t5)
la $t4,label_239_v91
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v94,2(v90)
la $t5,label_236_v90
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_234_v94
sw $t4,0($t0)
# Original instruction: sb v94,2(v91)
la $t5,label_234_v94
lw $t5,0($t5)
la $t4,label_239_v91
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v95,3(v90)
la $t5,label_236_v90
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_238_v95
sw $t4,0($t0)
# Original instruction: sb v95,3(v91)
la $t5,label_238_v95
lw $t5,0($t5)
la $t4,label_239_v91
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
# Original instruction: addi v96,$sp,0
addi $t5,$sp,0
la $t0,label_240_v96
sw $t5,0($t0)
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v97,$fp,-56
addiu $t5,$fp,-56
la $t0,label_247_v97
sw $t5,0($t0)
# Original instruction: addi v98,$zero,2
addi $t5,$zero,2
la $t0,label_244_v98
sw $t5,0($t0)
# Original instruction: li v101,16
li $t5,16
la $t0,label_245_v101
sw $t5,0($t0)
# Original instruction: mul v100,v98,v101
la $t5,label_244_v98
lw $t5,0($t5)
la $t4,label_245_v101
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_248_v100
sw $t3,0($t0)
# Original instruction: add v99,v97,v100
la $t5,label_247_v97
lw $t5,0($t5)
la $t4,label_248_v100
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_250_v99
sw $t3,0($t0)
# Original instruction: addiu v102,v99,4
la $t5,label_250_v99
lw $t5,0($t5)
addiu $t4,$t5,4
la $t0,label_265_v102
sw $t4,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v103,$sp,0
addi $t5,$sp,0
la $t0,label_268_v103
sw $t5,0($t0)
# 
# Loading from v102 from stack into v103
# Original instruction: lb v104,0(v102)
la $t5,label_265_v102
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_255_v104
sw $t4,0($t0)
# Original instruction: sb v104,0(v103)
la $t5,label_255_v104
lw $t5,0($t5)
la $t4,label_268_v103
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v105,1(v102)
la $t5,label_265_v102
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_259_v105
sw $t4,0($t0)
# Original instruction: sb v105,1(v103)
la $t5,label_259_v105
lw $t5,0($t5)
la $t4,label_268_v103
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v106,2(v102)
la $t5,label_265_v102
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_263_v106
sw $t4,0($t0)
# Original instruction: sb v106,2(v103)
la $t5,label_263_v106
lw $t5,0($t5)
la $t4,label_268_v103
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v107,3(v102)
la $t5,label_265_v102
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_267_v107
sw $t4,0($t0)
# Original instruction: sb v107,3(v103)
la $t5,label_267_v107
lw $t5,0($t5)
la $t4,label_268_v103
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
# Original instruction: addi v108,$sp,0
addi $t5,$sp,0
la $t0,label_269_v108
sw $t5,0($t0)
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v109,$fp,-56
addiu $t5,$fp,-56
la $t0,label_276_v109
sw $t5,0($t0)
# Original instruction: addi v110,$zero,2
addi $t5,$zero,2
la $t0,label_273_v110
sw $t5,0($t0)
# Original instruction: li v113,16
li $t5,16
la $t0,label_274_v113
sw $t5,0($t0)
# Original instruction: mul v112,v110,v113
la $t5,label_273_v110
lw $t5,0($t5)
la $t4,label_274_v113
lw $t4,0($t4)
mul $t3,$t5,$t4
la $t0,label_277_v112
sw $t3,0($t0)
# Original instruction: add v111,v109,v112
la $t5,label_276_v109
lw $t5,0($t5)
la $t4,label_277_v112
lw $t4,0($t4)
add $t3,$t5,$t4
la $t0,label_279_v111
sw $t3,0($t0)
# Original instruction: addiu v114,v111,12
la $t5,label_279_v111
lw $t5,0($t5)
addiu $t4,$t5,12
la $t0,label_294_v114
sw $t4,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v115,$sp,0
addi $t5,$sp,0
la $t0,label_297_v115
sw $t5,0($t0)
# 
# Loading from v114 from stack into v115
# Original instruction: lb v116,0(v114)
la $t5,label_294_v114
lw $t5,0($t5)
lb $t4,0($t5)
la $t0,label_284_v116
sw $t4,0($t0)
# Original instruction: sb v116,0(v115)
la $t5,label_284_v116
lw $t5,0($t5)
la $t4,label_297_v115
lw $t4,0($t4)
sb $t5,0($t4)
# Original instruction: lb v117,1(v114)
la $t5,label_294_v114
lw $t5,0($t5)
lb $t4,1($t5)
la $t0,label_288_v117
sw $t4,0($t0)
# Original instruction: sb v117,1(v115)
la $t5,label_288_v117
lw $t5,0($t5)
la $t4,label_297_v115
lw $t4,0($t4)
sb $t5,1($t4)
# Original instruction: lb v118,2(v114)
la $t5,label_294_v114
lw $t5,0($t5)
lb $t4,2($t5)
la $t0,label_292_v118
sw $t4,0($t0)
# Original instruction: sb v118,2(v115)
la $t5,label_292_v118
lw $t5,0($t5)
la $t4,label_297_v115
lw $t4,0($t4)
sb $t5,2($t4)
# Original instruction: lb v119,3(v114)
la $t5,label_294_v114
lw $t5,0($t5)
lb $t4,3($t5)
la $t0,label_296_v119
sw $t4,0($t0)
# Original instruction: sb v119,3(v115)
la $t5,label_296_v119
lw $t5,0($t5)
la $t4,label_297_v115
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
# Original instruction: addi v120,$sp,0
addi $t5,$sp,0
la $t0,label_298_v120
sw $t5,0($t0)
# Return statement start
# Original instruction: addi v121,$zero,0
addi $t5,$zero,0
la $t0,label_301_v121
sw $t5,0($t0)
# Original instruction: addiu v122,$fp,0
addiu $t5,$fp,0
la $t0,label_302_v122
sw $t5,0($t0)
# Loading from v121 from reg into v122
# Original instruction: sw v121,0(v122)
la $t5,label_301_v121
lw $t5,0($t5)
la $t4,label_302_v122
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: jal mainEND
jal mainEND
# Return statement end
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v6,0
la $t5,label_303_v6
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_63_v18
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_292_v118
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_102_v40
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_54_v13
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_250_v99
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_201_v81
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_87_v30
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_176_v70
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_48_v8
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_178_v66
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_107_v38
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_236_v90
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_298_v120
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_77_v25
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_218_v85
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_82_v27
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_255_v104
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_207_v78
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_153_v60
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_268_v103
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_81_v21
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_45_v9
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_187_v77
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_205_v82
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_210_v79
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_101_v37
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_53_v7
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_230_v93
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_197_v80
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_259_v105
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_119_v46
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_284_v116
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_181_v67
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_74_v26
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_245_v101
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_238_v95
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_189_v73
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_67_v14
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_124_v48
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_297_v115
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_301_v121
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_279_v111
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_93_v31
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_143_v57
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_123_v42
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_104_v36
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_121_v45
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_273_v110
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_288_v117
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_274_v113
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_134_v51
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_51_v10
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_91_v32
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_211_v84
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_209_v83
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_158_v65
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_65_v17
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_186_v74
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_62_v15
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_109_v35
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_90_v29
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_73_v23
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_46_v12
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_182_v72
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_115_v44
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_118_v43
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_239_v91
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_157_v62
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_76_v22
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_215_v86
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_105_v39
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_59_v16
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_219_v88
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_294_v114
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_152_v55
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_267_v107
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_151_v59
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_132_v52
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_95_v28
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_276_v109
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_168_v68
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_296_v119
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_216_v89
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_234_v94
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_269_v108
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_160_v61
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_163_v63
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_221_v87
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_96_v34
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_161_v64
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_180_v71
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_226_v92
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_302_v122
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_49_v11
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_149_v54
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_139_v56
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_172_v69
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_265_v102
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_128_v50
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_240_v96
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_68_v20
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_244_v98
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_60_v19
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_248_v100
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_131_v49
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_247_v97
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_79_v24
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_192_v75
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_88_v33
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_116_v47
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_277_v112
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_190_v76
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_110_v41
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_303_v6
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_263_v106
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_129_v53
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_147_v58
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

