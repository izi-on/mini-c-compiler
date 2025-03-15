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
label_46_v8:
.space 4
label_59_v15:
.space 4
label_54_v12:
.space 4
label_64_v6:
.space 4
label_50_v11:
.space 4
label_63_v17:
.space 4
label_47_v7:
.space 4
label_49_v10:
.space 4
label_62_v16:
.space 4
label_57_v9:
.space 4
label_58_v14:
.space 4
label_53_v13:
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
# Original instruction: pushRegisters
la $t0,label_46_v8
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_59_v15
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_54_v12
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_64_v6
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_50_v11
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_63_v17
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_47_v7
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_49_v10
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_62_v16
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_57_v9
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_58_v14
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
la $t0,label_53_v13
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v6,$sp,0
addi $t5,$sp,0
la $t0,label_64_v6
sw $t5,0($t0)
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v7,$zero,42
addi $t5,$zero,42
la $t0,label_47_v7
sw $t5,0($t0)
# Original instruction: addi v8,$zero,43
addi $t5,$zero,43
la $t0,label_46_v8
sw $t5,0($t0)
# Original instruction: slt v10,v7,v8
la $t5,label_47_v7
lw $t5,0($t5)
la $t4,label_46_v8
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t0,label_49_v10
sw $t3,0($t0)
# Original instruction: slt v11,v8,v7
la $t5,label_46_v8
lw $t5,0($t5)
la $t4,label_47_v7
lw $t4,0($t4)
slt $t3,$t5,$t4
la $t0,label_50_v11
sw $t3,0($t0)
# Original instruction: or v12,v10,v11
la $t5,label_49_v10
lw $t5,0($t5)
la $t4,label_50_v11
lw $t4,0($t4)
or $t3,$t5,$t4
la $t0,label_54_v12
sw $t3,0($t0)
# Original instruction: addi v13,$zero,1
addi $t5,$zero,1
la $t0,label_53_v13
sw $t5,0($t0)
# Original instruction: sub v9,v13,v12
la $t5,label_53_v13
lw $t5,0($t5)
la $t4,label_54_v12
lw $t4,0($t4)
sub $t3,$t5,$t4
la $t0,label_57_v9
sw $t3,0($t0)
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v14,$sp,0
addi $t5,$sp,0
la $t0,label_58_v14
sw $t5,0($t0)
# Loading from v9 from reg into v14
# Original instruction: sw v9,0(v14)
la $t5,label_57_v9
lw $t5,0($t5)
la $t4,label_58_v14
lw $t4,0($t4)
sw $t5,0($t4)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# Original instruction: addi v15,$sp,0
addi $t5,$sp,0
la $t0,label_59_v15
sw $t5,0($t0)
# Return statement start
# Original instruction: addi v16,$zero,0
addi $t5,$zero,0
la $t0,label_62_v16
sw $t5,0($t0)
# Original instruction: addiu v17,$fp,0
addiu $t5,$fp,0
la $t0,label_63_v17
sw $t5,0($t0)
# Loading from v16 from reg into v17
# Original instruction: sw v16,0(v17)
la $t5,label_62_v16
lw $t5,0($t5)
la $t4,label_63_v17
lw $t4,0($t4)
sw $t5,0($t4)
# Original instruction: jal mainEND
jal mainEND
# Return statement end
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v6,0
la $t5,label_64_v6
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_53_v13
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_58_v14
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_57_v9
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_62_v16
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_49_v10
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_47_v7
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_63_v17
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_50_v11
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_64_v6
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_54_v12
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_59_v15
sw $t0,0($t1)
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_46_v8
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

