.data
label_5_str:
.asciiz "Animal sound\n"
.align 2
label_6_str:
.asciiz "Chirp\n"
.align 1
label_7_str:
.asciiz "Woof\n"
.align 2
label_8_str:
.asciiz "Bark\n"
.align 2
label_9_str:
.asciiz "Fetching\n"
.align 2
label_38_Animal_vtable:
.word label_0_speak
label_42_Bird_vtable:
.word label_1_speak
label_46_Dog_vtable:
.word label_2_speak
label_53_Doberman_vtable:
.word label_3_speak
.word label_4_fetch
# Allocated labels for virtual registers
# Allocated labels for virtual registers
label_58_v0:
.space 4
# Allocated labels for virtual registers
label_60_v1:
.space 4
# Allocated labels for virtual registers
label_62_v2:
.space 4
# Allocated labels for virtual registers
label_64_v3:
.space 4
# Allocated labels for virtual registers
label_66_v4:
.space 4
# Allocated labels for virtual registers
label_68_v5:
.space 4
# Allocated labels for virtual registers
label_74_v9:
.space 4
label_75_v6:
.space 4
label_72_v7:
.space 4
label_73_v8:
.space 4
# Allocated labels for virtual registers
label_82_v10:
.space 4
label_80_v12:
.space 4
label_79_v11:
.space 4
label_81_v13:
.space 4
# Allocated labels for virtual registers
label_88_v17:
.space 4
label_86_v15:
.space 4
label_87_v16:
.space 4
label_89_v14:
.space 4
# Allocated labels for virtual registers
label_94_v20:
.space 4
label_96_v18:
.space 4
label_95_v21:
.space 4
label_93_v19:
.space 4
# Allocated labels for virtual registers
label_100_v23:
.space 4
label_103_v22:
.space 4
label_101_v24:
.space 4
label_102_v25:
.space 4
# Allocated labels for virtual registers
label_109_v28:
.space 4
label_120_v33:
.space 4
label_125_v26:
.space 4
label_106_v27:
.space 4
label_110_v29:
.space 4
label_119_v32:
.space 4
label_124_v35:
.space 4
label_118_v30:
.space 4
label_116_v31:
.space 4
label_123_v34:
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
la $t0,label_58_v0
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v0,$sp,0
addi $t5,$sp,0
la $t0,label_58_v0
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
la $t5,label_58_v0
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_58_v0
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
la $t0,label_60_v1
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v1,$sp,0
addi $t5,$sp,0
la $t0,label_60_v1
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
la $t5,label_60_v1
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_60_v1
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
la $t0,label_62_v2
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v2,$sp,0
addi $t5,$sp,0
la $t0,label_62_v2
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
la $t5,label_62_v2
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_62_v2
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
la $t0,label_64_v3
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v3,$sp,0
addi $t5,$sp,0
la $t0,label_64_v3
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
la $t5,label_64_v3
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_64_v3
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
la $t0,label_66_v4
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v4,$sp,0
addi $t5,$sp,0
la $t0,label_66_v4
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
la $t5,label_66_v4
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_66_v4
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
la $t0,label_68_v5
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v5,$sp,0
addi $t5,$sp,0
la $t0,label_68_v5
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
la $t5,label_68_v5
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_68_v5
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
label_0_speak:
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
la $t0,label_74_v9
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_75_v6
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_72_v7
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_73_v8
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v6,$sp,0
addi $t5,$sp,0
la $t0,label_75_v6
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v7,label_5_str
la $t5,label_5_str
la $t0,label_72_v7
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v8,$sp,0
addi $t5,$sp,0
la $t0,label_73_v8
sw $t5,0($t0)
# Loading from v7 from reg into v8
# Original instruction: sw v7,0(v8)
la $t5,label_72_v7
lw $t5,0($t5)
la $t4,label_73_v8
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
la $t0,label_74_v9
sw $t5,0($t0)
# BEGIN EPILOGUE
label_0_speakEND:
# Original instruction: addi $sp,v6,0
la $t5,label_75_v6
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_73_v8
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_72_v7
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_75_v6
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_74_v9
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
label_1_speak:
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
la $t0,label_82_v10
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_80_v12
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_79_v11
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_81_v13
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v10,$sp,0
addi $t5,$sp,0
la $t0,label_82_v10
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v11,label_6_str
la $t5,label_6_str
la $t0,label_79_v11
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v12,$sp,0
addi $t5,$sp,0
la $t0,label_80_v12
sw $t5,0($t0)
# Loading from v11 from reg into v12
# Original instruction: sw v11,0(v12)
la $t5,label_79_v11
lw $t5,0($t5)
la $t4,label_80_v12
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
la $t0,label_81_v13
sw $t5,0($t0)
# BEGIN EPILOGUE
label_1_speakEND:
# Original instruction: addi $sp,v10,0
la $t5,label_82_v10
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_81_v13
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_79_v11
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_80_v12
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_82_v10
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
label_2_speak:
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
la $t0,label_88_v17
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_86_v15
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_87_v16
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_89_v14
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v14,$sp,0
addi $t5,$sp,0
la $t0,label_89_v14
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v15,label_7_str
la $t5,label_7_str
la $t0,label_86_v15
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v16,$sp,0
addi $t5,$sp,0
la $t0,label_87_v16
sw $t5,0($t0)
# Loading from v15 from reg into v16
# Original instruction: sw v15,0(v16)
la $t5,label_86_v15
lw $t5,0($t5)
la $t4,label_87_v16
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
la $t0,label_88_v17
sw $t5,0($t0)
# BEGIN EPILOGUE
label_2_speakEND:
# Original instruction: addi $sp,v14,0
la $t5,label_89_v14
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_89_v14
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_87_v16
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_86_v15
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_88_v17
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
label_3_speak:
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
la $t0,label_94_v20
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_96_v18
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_95_v21
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_93_v19
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v18,$sp,0
addi $t5,$sp,0
la $t0,label_96_v18
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v19,label_8_str
la $t5,label_8_str
la $t0,label_93_v19
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v20,$sp,0
addi $t5,$sp,0
la $t0,label_94_v20
sw $t5,0($t0)
# Loading from v19 from reg into v20
# Original instruction: sw v19,0(v20)
la $t5,label_93_v19
lw $t5,0($t5)
la $t4,label_94_v20
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
la $t0,label_95_v21
sw $t5,0($t0)
# BEGIN EPILOGUE
label_3_speakEND:
# Original instruction: addi $sp,v18,0
la $t5,label_96_v18
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_93_v19
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_95_v21
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_96_v18
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_94_v20
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
label_4_fetch:
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
label_50_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_50_clean_loop
bne $t2,$zero,label_50_clean_loop
label_51_clean_loop_end:
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
la $t0,label_100_v23
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_103_v22
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_101_v24
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_102_v25
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v22,$sp,0
addi $t5,$sp,0
la $t0,label_103_v22
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_s
# LOADING ARG: Pointer of CHAR
# GETTING  VALUE
# Original instruction: la v23,label_9_str
la $t5,label_9_str
la $t0,label_100_v23
sw $t5,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v24,$sp,0
addi $t5,$sp,0
la $t0,label_101_v24
sw $t5,0($t0)
# Loading from v23 from reg into v24
# Original instruction: sw v23,0(v24)
la $t5,label_100_v23
lw $t5,0($t5)
la $t4,label_101_v24
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
la $t0,label_102_v25
sw $t5,0($t0)
# BEGIN EPILOGUE
label_4_fetchEND:
# Original instruction: addi $sp,v22,0
la $t5,label_103_v22
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_102_v25
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_101_v24
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_103_v22
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_100_v23
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
label_54_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,13
slti $t2,$t0,13
# Original instruction: bne $t2,$zero,label_54_clean_loop
bne $t2,$zero,label_54_clean_loop
label_55_clean_loop_end:
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
la $t0,label_109_v28
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_120_v33
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_125_v26
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_106_v27
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_110_v29
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_119_v32
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_124_v35
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_118_v30
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_116_v31
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_123_v34
lw $t0,0($t0)
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v26,$sp,0
addi $t5,$sp,0
la $t0,label_125_v26
sw $t5,0($t0)
# END PROLOGUE
# Original instruction: la v27,label_53_Doberman_vtable
la $t5,label_53_Doberman_vtable
la $t0,label_106_v27
sw $t5,0($t0)
# Original instruction: addiu $sp,$sp,-12
addiu $sp,$sp,-12
# Original instruction: sw v27,0($sp)
la $t5,label_106_v27
lw $t5,0($t5)
sw $t5,0($sp)
# Original instruction: addiu v28,$sp,0
addiu $t5,$sp,0
la $t0,label_109_v28
sw $t5,0($t0)
# Original instruction: addiu v29,$fp,-12
addiu $t5,$fp,-12
la $t0,label_110_v29
sw $t5,0($t0)
# Loading from v28 from reg into v29
# Original instruction: sw v28,0(v29)
la $t5,label_109_v28
lw $t5,0($t5)
la $t4,label_110_v29
lw $t4,0($t4)
sw $t5,0($t4)
# BEGIN INSTANCE FUNCALL EXPR FOR speak
# Original instruction: addiu v30,$fp,-12
addiu $t5,$fp,-12
la $t0,label_118_v30
sw $t5,0($t0)
# Original instruction: lw v31,0(v30)
la $t5,label_118_v30
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_116_v31
sw $t4,0($t0)
# Original instruction: lw v31,0(v31)
la $t4,label_116_v31
lw $t4,0($t4)
lw $t4,0($t4)
la $t0,label_116_v31
sw $t4,0($t0)
# Original instruction: lw v32,0(v31)
la $t5,label_116_v31
lw $t5,0($t5)
lw $t4,0($t5)
la $t0,label_119_v32
sw $t4,0($t0)
# Pass the pointer as first arg
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: sw v30,0($sp)
la $t5,label_118_v30
lw $t5,0($t5)
sw $t5,0($sp)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jalr v32
la $t5,label_119_v32
lw $t5,0($t5)
jalr $t5
# BACK FROM FUNCTION
# Original instruction: addi v33,$sp,0
addi $t5,$sp,0
la $t0,label_120_v33
sw $t5,0($t0)
# END INSTANCE FUNCALL EXPR FOR speak
# Return statement start
# Original instruction: addi v34,$zero,0
addi $t5,$zero,0
la $t0,label_123_v34
sw $t5,0($t0)
# Original instruction: addiu v35,$fp,0
addiu $t5,$fp,0
la $t0,label_124_v35
sw $t5,0($t0)
# Loading from v34 from reg into v35
# Original instruction: sw v34,0(v35)
la $t5,label_123_v34
lw $t5,0($t5)
la $t4,label_124_v35
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: jal mainEND
jal mainEND
# Return statement end
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v26,0
la $t5,label_125_v26
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_123_v34
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_116_v31
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_118_v30
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_124_v35
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_119_v32
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_110_v29
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_106_v27
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_125_v26
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_120_v33
sw $t0,0($t1)
lw $t0,0($sp)
addiu $sp,$sp,4
la $t1,label_109_v28
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

