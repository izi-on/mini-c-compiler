.data

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
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v0,$sp,0
addi $t0,$sp,0
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
addi $sp,$t0,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
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
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v1,$sp,0
addi $t0,$sp,0
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
addi $sp,$t0,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
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
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v2,$sp,0
addi $t0,$sp,0
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
addi $sp,$t0,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
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
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v3,$sp,0
addi $t0,$sp,0
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
addi $sp,$t0,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
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
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v4,$sp,0
addi $t0,$sp,0
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
addi $sp,$t0,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
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
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v5,$sp,0
addi $t0,$sp,0
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
addi $sp,$t0,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
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
createLinkedList:
# Clearing entire allocated stack frame of size 16
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
# Original instruction: addiu $sp,$fp,-16
addiu $sp,$fp,-16
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v6,$sp,0
addi $t2,$sp,0
# END PROLOGUE
# Original instruction: addi v7,$zero,20
addi $t1,$zero,20
# Original instruction: addiu v8,$fp,-16
addiu $t0,$fp,-16
# Loading from v7 from reg into v8
# Original instruction: sw v7,0(v8)
sw $t1,0($t0)
# BEGIN FUNCALL EXPR FOR mcmalloc
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v9,$fp,-16
addiu $t4,$fp,-16
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v10,$sp,0
addi $t3,$sp,0
# 
# Loading from v9 from stack into v10
# Original instruction: li v11,4
li $t5,4
# Original instruction: li v12,0
li $t0,0
label_28_mem_copy_loop:
# Original instruction: beq v12,v11,label_29_mem_copy_end
beq $t0,$t5,label_29_mem_copy_end
# Original instruction: add v13,v9,v12
add $t1,$t4,$t0
# Original instruction: lb v15,0(v13)
lb $t6,0($t1)
# Original instruction: add v14,v10,v12
add $t1,$t3,$t0
# Original instruction: sb v15,0(v14)
sb $t6,0($t1)
# Original instruction: addi v12,v12,1
addi $t0,$t0,1
# Original instruction: j label_28_mem_copy_loop
j label_28_mem_copy_loop
label_29_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal mcmalloc
jal mcmalloc
# BACK FROM FUNCTION
# Original instruction: addi v16,$sp,0
addi $t0,$sp,0
# Original instruction: lw v17,0(v16)
lw $t0,0($t0)
# Original instruction: addiu v18,$fp,-12
addiu $t1,$fp,-12
# Loading from v17 from reg into v18
# Original instruction: sw v17,0(v18)
sw $t0,0($t1)
# Original instruction: addiu v19,$fp,4
addiu $t0,$fp,4
# Original instruction: addiu v20,$fp,-12
addiu $t1,$fp,-12
# Original instruction: lw v21,0(v20)
lw $t1,0($t1)
# Original instruction: addiu v22,v21,0
addiu $t1,$t1,0
# 
# Loading from v19 from stack into v22
# Original instruction: li v23,4
li $t4,4
# Original instruction: li v24,0
li $t5,0
label_30_mem_copy_loop:
# Original instruction: beq v24,v23,label_31_mem_copy_end
beq $t5,$t4,label_31_mem_copy_end
# Original instruction: add v25,v19,v24
add $t3,$t0,$t5
# Original instruction: lb v27,0(v25)
lb $t3,0($t3)
# Original instruction: add v26,v22,v24
add $t6,$t1,$t5
# Original instruction: sb v27,0(v26)
sb $t3,0($t6)
# Original instruction: addi v24,v24,1
addi $t5,$t5,1
# Original instruction: j label_30_mem_copy_loop
j label_30_mem_copy_loop
label_31_mem_copy_end:
# 
# Original instruction: addi v28,$zero,65
addi $t1,$zero,65
# Original instruction: addiu v29,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v30,0(v29)
lw $t3,0($t0)
# Original instruction: addi v31,$zero,26
addi $t0,$zero,26
# Original instruction: div v30,v31
div $t3,$t0
# Original instruction: mfhi v32
mfhi $t0
# Original instruction: add v33,v28,v32
add $t1,$t1,$t0
# Original instruction: addiu v34,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v35,0(v34)
lw $t0,0($t0)
# Original instruction: addiu v36,v35,8
addiu $t0,$t0,8
# Loading from v33 from reg into v36
# Original instruction: sw v33,0(v36)
sw $t1,0($t0)
# Original instruction: addi v37,$zero,1
addi $t1,$zero,1
# Original instruction: addiu v38,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v39,0(v38)
lw $t0,0($t0)
# Original instruction: addiu v40,v39,12
addiu $t0,$t0,12
# Loading from v37 from reg into v40
# Original instruction: sw v37,0(v40)
sw $t1,0($t0)
# Original instruction: addiu v41,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v42,0(v41)
lw $t1,0($t0)
# Original instruction: addi v43,$zero,1
addi $t0,$zero,1
# Original instruction: slt v44,v43,v42
slt $t0,$t0,$t1
# Original instruction: beqz v44,label_32_else
beqz $t0,label_32_else
# BEGIN FUNCALL EXPR FOR createLinkedList
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v45,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v46,0(v45)
lw $t0,0($t0)
# Original instruction: addi v47,$zero,1
addi $t1,$zero,1
# Original instruction: sub v48,v46,v47
sub $t1,$t0,$t1
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v49,$sp,0
addi $t0,$sp,0
# Loading from v48 from reg into v49
# Original instruction: sw v48,0(v49)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal createLinkedList
jal createLinkedList
# BACK FROM FUNCTION
# Original instruction: addi v50,$sp,0
addi $t5,$sp,0
# Original instruction: addiu v51,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v52,0(v51)
lw $t0,0($t0)
# Original instruction: addiu v53,v52,4
addiu $t0,$t0,4
# 
# Loading from v50 from stack into v53
# Original instruction: li v54,4
li $t4,4
# Original instruction: li v55,0
li $t3,0
label_34_mem_copy_loop:
# Original instruction: beq v55,v54,label_35_mem_copy_end
beq $t3,$t4,label_35_mem_copy_end
# Original instruction: add v56,v50,v55
add $t1,$t5,$t3
# Original instruction: lb v58,0(v56)
lb $t6,0($t1)
# Original instruction: add v57,v53,v55
add $t1,$t0,$t3
# Original instruction: sb v58,0(v57)
sb $t6,0($t1)
# Original instruction: addi v55,v55,1
addi $t3,$t3,1
# Original instruction: j label_34_mem_copy_loop
j label_34_mem_copy_loop
label_35_mem_copy_end:
# 
# Original instruction: addi v59,$zero,1
addi $t1,$zero,1
# Original instruction: addiu v60,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v61,0(v60)
lw $t0,0($t0)
# Original instruction: addiu v62,v61,16
addiu $t0,$t0,16
# Loading from v59 from reg into v62
# Original instruction: sw v59,0(v62)
sw $t1,0($t0)
# Original instruction: j label_33_end
j label_33_end
label_32_else:
# Original instruction: addi v63,$zero,0
addi $t1,$zero,0
# Original instruction: addiu v64,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v65,0(v64)
lw $t0,0($t0)
# Original instruction: addiu v66,v65,16
addiu $t0,$t0,16
# Loading from v63 from reg into v66
# Original instruction: sw v63,0(v66)
sw $t1,0($t0)
label_33_end:
# Return statement start
# Original instruction: addiu v67,$fp,-12
addiu $t4,$fp,-12
# Original instruction: addiu v68,$fp,0
addiu $t6,$fp,0
# 
# Loading from v67 from stack into v68
# Original instruction: li v69,4
li $t1,4
# Original instruction: li v70,0
li $t5,0
label_36_mem_copy_loop:
# Original instruction: beq v70,v69,label_37_mem_copy_end
beq $t5,$t1,label_37_mem_copy_end
# Original instruction: add v71,v67,v70
add $t0,$t4,$t5
# Original instruction: lb v73,0(v71)
lb $t0,0($t0)
# Original instruction: add v72,v68,v70
add $t3,$t6,$t5
# Original instruction: sb v73,0(v72)
sb $t0,0($t3)
# Original instruction: addi v70,v70,1
addi $t5,$t5,1
# Original instruction: j label_36_mem_copy_loop
j label_36_mem_copy_loop
label_37_mem_copy_end:
# 
# Original instruction: jal createLinkedListEND
jal createLinkedListEND
# Return statement end
# BEGIN EPILOGUE
createLinkedListEND:
# Original instruction: addi $sp,v6,0
addi $sp,$t2,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
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
calculateDeterminant:
# Clearing entire allocated stack frame of size 48
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
label_40_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,49
slti $t2,$t0,49
# Original instruction: bne $t2,$zero,label_40_clean_loop
bne $t2,$zero,label_40_clean_loop
label_41_clean_loop_end:
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
# Original instruction: addiu $sp,$fp,-48
addiu $sp,$fp,-48
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v74,$sp,0
addi $t1,$sp,0
# END PROLOGUE
# Original instruction: addiu v75,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v75,0(v75)
lw $t0,0($t0)
# Original instruction: addi v76,$zero,0
addi $t2,$zero,0
# Original instruction: li v79,12
li $t3,12
# Original instruction: mul v78,v76,v79
mul $t2,$t2,$t3
# Original instruction: add v77,v75,v78
add $t2,$t0,$t2
# Original instruction: addi v80,$zero,0
addi $t0,$zero,0
# Original instruction: li v83,4
li $t3,4
# Original instruction: mul v82,v80,v83
mul $t0,$t0,$t3
# Original instruction: add v81,v77,v82
add $t3,$t2,$t0
# Original instruction: addiu v84,$fp,-12
addiu $t0,$fp,-12
# 
# Loading from v81 from stack into v84
# Original instruction: li v85,4
li $t6,4
# Original instruction: li v86,0
li $t4,0
label_42_mem_copy_loop:
# Original instruction: beq v86,v85,label_43_mem_copy_end
beq $t4,$t6,label_43_mem_copy_end
# Original instruction: add v87,v81,v86
add $t2,$t3,$t4
# Original instruction: lb v89,0(v87)
lb $t2,0($t2)
# Original instruction: add v88,v84,v86
add $t5,$t0,$t4
# Original instruction: sb v89,0(v88)
sb $t2,0($t5)
# Original instruction: addi v86,v86,1
addi $t4,$t4,1
# Original instruction: j label_42_mem_copy_loop
j label_42_mem_copy_loop
label_43_mem_copy_end:
# 
# Original instruction: addiu v90,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v90,0(v90)
lw $t0,0($t0)
# Original instruction: addi v91,$zero,0
addi $t2,$zero,0
# Original instruction: li v94,12
li $t3,12
# Original instruction: mul v93,v91,v94
mul $t2,$t2,$t3
# Original instruction: add v92,v90,v93
add $t2,$t0,$t2
# Original instruction: addi v95,$zero,1
addi $t3,$zero,1
# Original instruction: li v98,4
li $t0,4
# Original instruction: mul v97,v95,v98
mul $t0,$t3,$t0
# Original instruction: add v96,v92,v97
add $t3,$t2,$t0
# Original instruction: addiu v99,$fp,-16
addiu $t4,$fp,-16
# 
# Loading from v96 from stack into v99
# Original instruction: li v100,4
li $t6,4
# Original instruction: li v101,0
li $t5,0
label_44_mem_copy_loop:
# Original instruction: beq v101,v100,label_45_mem_copy_end
beq $t5,$t6,label_45_mem_copy_end
# Original instruction: add v102,v96,v101
add $t0,$t3,$t5
# Original instruction: lb v104,0(v102)
lb $t2,0($t0)
# Original instruction: add v103,v99,v101
add $t0,$t4,$t5
# Original instruction: sb v104,0(v103)
sb $t2,0($t0)
# Original instruction: addi v101,v101,1
addi $t5,$t5,1
# Original instruction: j label_44_mem_copy_loop
j label_44_mem_copy_loop
label_45_mem_copy_end:
# 
# Original instruction: addiu v105,$fp,4
addiu $t3,$fp,4
# Original instruction: lw v105,0(v105)
lw $t3,0($t3)
# Original instruction: addi v106,$zero,0
addi $t0,$zero,0
# Original instruction: li v109,12
li $t2,12
# Original instruction: mul v108,v106,v109
mul $t0,$t0,$t2
# Original instruction: add v107,v105,v108
add $t2,$t3,$t0
# Original instruction: addi v110,$zero,2
addi $t0,$zero,2
# Original instruction: li v113,4
li $t3,4
# Original instruction: mul v112,v110,v113
mul $t0,$t0,$t3
# Original instruction: add v111,v107,v112
add $t2,$t2,$t0
# Original instruction: addiu v114,$fp,-20
addiu $t3,$fp,-20
# 
# Loading from v111 from stack into v114
# Original instruction: li v115,4
li $t0,4
# Original instruction: li v116,0
li $t4,0
label_46_mem_copy_loop:
# Original instruction: beq v116,v115,label_47_mem_copy_end
beq $t4,$t0,label_47_mem_copy_end
# Original instruction: add v117,v111,v116
add $t5,$t2,$t4
# Original instruction: lb v119,0(v117)
lb $t6,0($t5)
# Original instruction: add v118,v114,v116
add $t5,$t3,$t4
# Original instruction: sb v119,0(v118)
sb $t6,0($t5)
# Original instruction: addi v116,v116,1
addi $t4,$t4,1
# Original instruction: j label_46_mem_copy_loop
j label_46_mem_copy_loop
label_47_mem_copy_end:
# 
# Original instruction: addiu v120,$fp,4
addiu $t2,$fp,4
# Original instruction: lw v120,0(v120)
lw $t2,0($t2)
# Original instruction: addi v121,$zero,1
addi $t3,$zero,1
# Original instruction: li v124,12
li $t0,12
# Original instruction: mul v123,v121,v124
mul $t0,$t3,$t0
# Original instruction: add v122,v120,v123
add $t2,$t2,$t0
# Original instruction: addi v125,$zero,0
addi $t0,$zero,0
# Original instruction: li v128,4
li $t3,4
# Original instruction: mul v127,v125,v128
mul $t0,$t0,$t3
# Original instruction: add v126,v122,v127
add $t5,$t2,$t0
# Original instruction: addiu v129,$fp,-24
addiu $t3,$fp,-24
# 
# Loading from v126 from stack into v129
# Original instruction: li v130,4
li $t2,4
# Original instruction: li v131,0
li $t0,0
label_48_mem_copy_loop:
# Original instruction: beq v131,v130,label_49_mem_copy_end
beq $t0,$t2,label_49_mem_copy_end
# Original instruction: add v132,v126,v131
add $t4,$t5,$t0
# Original instruction: lb v134,0(v132)
lb $t6,0($t4)
# Original instruction: add v133,v129,v131
add $t4,$t3,$t0
# Original instruction: sb v134,0(v133)
sb $t6,0($t4)
# Original instruction: addi v131,v131,1
addi $t0,$t0,1
# Original instruction: j label_48_mem_copy_loop
j label_48_mem_copy_loop
label_49_mem_copy_end:
# 
# Original instruction: addiu v135,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v135,0(v135)
lw $t0,0($t0)
# Original instruction: addi v136,$zero,1
addi $t3,$zero,1
# Original instruction: li v139,12
li $t2,12
# Original instruction: mul v138,v136,v139
mul $t2,$t3,$t2
# Original instruction: add v137,v135,v138
add $t0,$t0,$t2
# Original instruction: addi v140,$zero,1
addi $t2,$zero,1
# Original instruction: li v143,4
li $t3,4
# Original instruction: mul v142,v140,v143
mul $t2,$t2,$t3
# Original instruction: add v141,v137,v142
add $t5,$t0,$t2
# Original instruction: addiu v144,$fp,-28
addiu $t6,$fp,-28
# 
# Loading from v141 from stack into v144
# Original instruction: li v145,4
li $t3,4
# Original instruction: li v146,0
li $t4,0
label_50_mem_copy_loop:
# Original instruction: beq v146,v145,label_51_mem_copy_end
beq $t4,$t3,label_51_mem_copy_end
# Original instruction: add v147,v141,v146
add $t0,$t5,$t4
# Original instruction: lb v149,0(v147)
lb $t2,0($t0)
# Original instruction: add v148,v144,v146
add $t0,$t6,$t4
# Original instruction: sb v149,0(v148)
sb $t2,0($t0)
# Original instruction: addi v146,v146,1
addi $t4,$t4,1
# Original instruction: j label_50_mem_copy_loop
j label_50_mem_copy_loop
label_51_mem_copy_end:
# 
# Original instruction: addiu v150,$fp,4
addiu $t2,$fp,4
# Original instruction: lw v150,0(v150)
lw $t2,0($t2)
# Original instruction: addi v151,$zero,1
addi $t0,$zero,1
# Original instruction: li v154,12
li $t3,12
# Original instruction: mul v153,v151,v154
mul $t0,$t0,$t3
# Original instruction: add v152,v150,v153
add $t2,$t2,$t0
# Original instruction: addi v155,$zero,2
addi $t0,$zero,2
# Original instruction: li v158,4
li $t3,4
# Original instruction: mul v157,v155,v158
mul $t0,$t0,$t3
# Original instruction: add v156,v152,v157
add $t3,$t2,$t0
# Original instruction: addiu v159,$fp,-32
addiu $t5,$fp,-32
# 
# Loading from v156 from stack into v159
# Original instruction: li v160,4
li $t4,4
# Original instruction: li v161,0
li $t0,0
label_52_mem_copy_loop:
# Original instruction: beq v161,v160,label_53_mem_copy_end
beq $t0,$t4,label_53_mem_copy_end
# Original instruction: add v162,v156,v161
add $t2,$t3,$t0
# Original instruction: lb v164,0(v162)
lb $t6,0($t2)
# Original instruction: add v163,v159,v161
add $t2,$t5,$t0
# Original instruction: sb v164,0(v163)
sb $t6,0($t2)
# Original instruction: addi v161,v161,1
addi $t0,$t0,1
# Original instruction: j label_52_mem_copy_loop
j label_52_mem_copy_loop
label_53_mem_copy_end:
# 
# Original instruction: addiu v165,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v165,0(v165)
lw $t0,0($t0)
# Original instruction: addi v166,$zero,2
addi $t3,$zero,2
# Original instruction: li v169,12
li $t2,12
# Original instruction: mul v168,v166,v169
mul $t2,$t3,$t2
# Original instruction: add v167,v165,v168
add $t2,$t0,$t2
# Original instruction: addi v170,$zero,0
addi $t0,$zero,0
# Original instruction: li v173,4
li $t3,4
# Original instruction: mul v172,v170,v173
mul $t0,$t0,$t3
# Original instruction: add v171,v167,v172
add $t5,$t2,$t0
# Original instruction: addiu v174,$fp,-36
addiu $t3,$fp,-36
# 
# Loading from v171 from stack into v174
# Original instruction: li v175,4
li $t0,4
# Original instruction: li v176,0
li $t6,0
label_54_mem_copy_loop:
# Original instruction: beq v176,v175,label_55_mem_copy_end
beq $t6,$t0,label_55_mem_copy_end
# Original instruction: add v177,v171,v176
add $t2,$t5,$t6
# Original instruction: lb v179,0(v177)
lb $t2,0($t2)
# Original instruction: add v178,v174,v176
add $t4,$t3,$t6
# Original instruction: sb v179,0(v178)
sb $t2,0($t4)
# Original instruction: addi v176,v176,1
addi $t6,$t6,1
# Original instruction: j label_54_mem_copy_loop
j label_54_mem_copy_loop
label_55_mem_copy_end:
# 
# Original instruction: addiu v180,$fp,4
addiu $t2,$fp,4
# Original instruction: lw v180,0(v180)
lw $t2,0($t2)
# Original instruction: addi v181,$zero,2
addi $t0,$zero,2
# Original instruction: li v184,12
li $t3,12
# Original instruction: mul v183,v181,v184
mul $t0,$t0,$t3
# Original instruction: add v182,v180,v183
add $t3,$t2,$t0
# Original instruction: addi v185,$zero,1
addi $t2,$zero,1
# Original instruction: li v188,4
li $t0,4
# Original instruction: mul v187,v185,v188
mul $t0,$t2,$t0
# Original instruction: add v186,v182,v187
add $t3,$t3,$t0
# Original instruction: addiu v189,$fp,-40
addiu $t2,$fp,-40
# 
# Loading from v186 from stack into v189
# Original instruction: li v190,4
li $t0,4
# Original instruction: li v191,0
li $t5,0
label_56_mem_copy_loop:
# Original instruction: beq v191,v190,label_57_mem_copy_end
beq $t5,$t0,label_57_mem_copy_end
# Original instruction: add v192,v186,v191
add $t4,$t3,$t5
# Original instruction: lb v194,0(v192)
lb $t6,0($t4)
# Original instruction: add v193,v189,v191
add $t4,$t2,$t5
# Original instruction: sb v194,0(v193)
sb $t6,0($t4)
# Original instruction: addi v191,v191,1
addi $t5,$t5,1
# Original instruction: j label_56_mem_copy_loop
j label_56_mem_copy_loop
label_57_mem_copy_end:
# 
# Original instruction: addiu v195,$fp,4
addiu $t3,$fp,4
# Original instruction: lw v195,0(v195)
lw $t3,0($t3)
# Original instruction: addi v196,$zero,2
addi $t2,$zero,2
# Original instruction: li v199,12
li $t0,12
# Original instruction: mul v198,v196,v199
mul $t0,$t2,$t0
# Original instruction: add v197,v195,v198
add $t2,$t3,$t0
# Original instruction: addi v200,$zero,2
addi $t3,$zero,2
# Original instruction: li v203,4
li $t0,4
# Original instruction: mul v202,v200,v203
mul $t0,$t3,$t0
# Original instruction: add v201,v197,v202
add $t4,$t2,$t0
# Original instruction: addiu v204,$fp,-44
addiu $t0,$fp,-44
# 
# Loading from v201 from stack into v204
# Original instruction: li v205,4
li $t6,4
# Original instruction: li v206,0
li $t3,0
label_58_mem_copy_loop:
# Original instruction: beq v206,v205,label_59_mem_copy_end
beq $t3,$t6,label_59_mem_copy_end
# Original instruction: add v207,v201,v206
add $t2,$t4,$t3
# Original instruction: lb v209,0(v207)
lb $t2,0($t2)
# Original instruction: add v208,v204,v206
add $t5,$t0,$t3
# Original instruction: sb v209,0(v208)
sb $t2,0($t5)
# Original instruction: addi v206,v206,1
addi $t3,$t3,1
# Original instruction: j label_58_mem_copy_loop
j label_58_mem_copy_loop
label_59_mem_copy_end:
# 
# Original instruction: addiu v210,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v211,0(v210)
lw $t2,0($t0)
# Original instruction: addiu v212,$fp,-28
addiu $t0,$fp,-28
# Original instruction: lw v213,0(v212)
lw $t0,0($t0)
# Original instruction: addiu v214,$fp,-44
addiu $t3,$fp,-44
# Original instruction: lw v215,0(v214)
lw $t3,0($t3)
# Original instruction: mul v216,v213,v215
mul $t3,$t0,$t3
# Original instruction: addiu v217,$fp,-32
addiu $t0,$fp,-32
# Original instruction: lw v218,0(v217)
lw $t0,0($t0)
# Original instruction: addiu v219,$fp,-40
addiu $t4,$fp,-40
# Original instruction: lw v220,0(v219)
lw $t4,0($t4)
# Original instruction: mul v221,v218,v220
mul $t0,$t0,$t4
# Original instruction: sub v222,v216,v221
sub $t0,$t3,$t0
# Original instruction: mul v223,v211,v222
mul $t5,$t2,$t0
# Original instruction: addiu v224,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v225,0(v224)
lw $t2,0($t0)
# Original instruction: addiu v226,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v227,0(v226)
lw $t3,0($t0)
# Original instruction: addiu v228,$fp,-44
addiu $t0,$fp,-44
# Original instruction: lw v229,0(v228)
lw $t0,0($t0)
# Original instruction: mul v230,v227,v229
mul $t0,$t3,$t0
# Original instruction: addiu v231,$fp,-32
addiu $t3,$fp,-32
# Original instruction: lw v232,0(v231)
lw $t3,0($t3)
# Original instruction: addiu v233,$fp,-36
addiu $t4,$fp,-36
# Original instruction: lw v234,0(v233)
lw $t4,0($t4)
# Original instruction: mul v235,v232,v234
mul $t3,$t3,$t4
# Original instruction: sub v236,v230,v235
sub $t0,$t0,$t3
# Original instruction: mul v237,v225,v236
mul $t0,$t2,$t0
# Original instruction: sub v238,v223,v237
sub $t3,$t5,$t0
# Original instruction: addiu v239,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v240,0(v239)
lw $t4,0($t0)
# Original instruction: addiu v241,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v242,0(v241)
lw $t2,0($t0)
# Original instruction: addiu v243,$fp,-40
addiu $t0,$fp,-40
# Original instruction: lw v244,0(v243)
lw $t0,0($t0)
# Original instruction: mul v245,v242,v244
mul $t2,$t2,$t0
# Original instruction: addiu v246,$fp,-28
addiu $t0,$fp,-28
# Original instruction: lw v247,0(v246)
lw $t5,0($t0)
# Original instruction: addiu v248,$fp,-36
addiu $t0,$fp,-36
# Original instruction: lw v249,0(v248)
lw $t0,0($t0)
# Original instruction: mul v250,v247,v249
mul $t0,$t5,$t0
# Original instruction: sub v251,v245,v250
sub $t0,$t2,$t0
# Original instruction: mul v252,v240,v251
mul $t0,$t4,$t0
# Original instruction: add v253,v238,v252
add $t0,$t3,$t0
# Original instruction: addiu v254,$fp,-48
addiu $t2,$fp,-48
# Loading from v253 from reg into v254
# Original instruction: sw v253,0(v254)
sw $t0,0($t2)
# Return statement start
# Original instruction: addiu v255,$fp,-48
addiu $t3,$fp,-48
# Original instruction: addiu v256,$fp,0
addiu $t0,$fp,0
# 
# Loading from v255 from stack into v256
# Original instruction: li v257,4
li $t2,4
# Original instruction: li v258,0
li $t5,0
label_60_mem_copy_loop:
# Original instruction: beq v258,v257,label_61_mem_copy_end
beq $t5,$t2,label_61_mem_copy_end
# Original instruction: add v259,v255,v258
add $t4,$t3,$t5
# Original instruction: lb v261,0(v259)
lb $t4,0($t4)
# Original instruction: add v260,v256,v258
add $t6,$t0,$t5
# Original instruction: sb v261,0(v260)
sb $t4,0($t6)
# Original instruction: addi v258,v258,1
addi $t5,$t5,1
# Original instruction: j label_60_mem_copy_loop
j label_60_mem_copy_loop
label_61_mem_copy_end:
# 
# Original instruction: jal calculateDeterminantEND
jal calculateDeterminantEND
# Return statement end
# BEGIN EPILOGUE
calculateDeterminantEND:
# Original instruction: addi $sp,v74,0
addi $sp,$t1,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
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
complexComputation:
# Clearing entire allocated stack frame of size 72
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
label_64_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,73
slti $t2,$t0,73
# Original instruction: bne $t2,$zero,label_64_clean_loop
bne $t2,$zero,label_64_clean_loop
label_65_clean_loop_end:
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
# Original instruction: addiu $sp,$fp,-72
addiu $sp,$fp,-72
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v262,$sp,0
addi $t1,$sp,0
# END PROLOGUE
# Original instruction: addiu v263,$fp,40
addiu $t0,$fp,40
# Original instruction: lw v264,0(v263)
lw $t2,0($t0)
# Original instruction: addiu v265,$fp,36
addiu $t0,$fp,36
# Original instruction: lw v266,0(v265)
lw $t0,0($t0)
# Original instruction: add v267,v264,v266
add $t0,$t2,$t0
# Original instruction: addiu v268,$fp,-12
addiu $t2,$fp,-12
# Loading from v267 from reg into v268
# Original instruction: sw v267,0(v268)
sw $t0,0($t2)
# Original instruction: addiu v269,$fp,32
addiu $t0,$fp,32
# Original instruction: lw v270,0(v269)
lw $t2,0($t0)
# Original instruction: addiu v271,$fp,28
addiu $t0,$fp,28
# Original instruction: lw v272,0(v271)
lw $t0,0($t0)
# Original instruction: sub v273,v270,v272
sub $t2,$t2,$t0
# Original instruction: addiu v274,$fp,-16
addiu $t0,$fp,-16
# Loading from v273 from reg into v274
# Original instruction: sw v273,0(v274)
sw $t2,0($t0)
# Original instruction: addiu v275,$fp,24
addiu $t0,$fp,24
# Original instruction: lw v276,0(v275)
lw $t2,0($t0)
# Original instruction: addiu v277,$fp,20
addiu $t0,$fp,20
# Original instruction: lw v278,0(v277)
lw $t0,0($t0)
# Original instruction: mul v279,v276,v278
mul $t0,$t2,$t0
# Original instruction: addiu v280,$fp,-20
addiu $t2,$fp,-20
# Loading from v279 from reg into v280
# Original instruction: sw v279,0(v280)
sw $t0,0($t2)
# Original instruction: addiu v281,$fp,16
addiu $t0,$fp,16
# Original instruction: lw v282,0(v281)
lw $t0,0($t0)
# Original instruction: addi v283,$zero,2
addi $t2,$zero,2
# Original instruction: div v282,v283
div $t0,$t2
# Original instruction: mflo v284
mflo $t2
# Original instruction: addiu v285,$fp,-24
addiu $t0,$fp,-24
# Loading from v284 from reg into v285
# Original instruction: sw v284,0(v285)
sw $t2,0($t0)
# Original instruction: addiu v286,$fp,12
addiu $t0,$fp,12
# Original instruction: lw v287,0(v286)
lw $t0,0($t0)
# Original instruction: addi v288,$zero,5
addi $t2,$zero,5
# Original instruction: div v287,v288
div $t0,$t2
# Original instruction: mfhi v289
mfhi $t2
# Original instruction: addiu v290,$fp,-28
addiu $t0,$fp,-28
# Loading from v289 from reg into v290
# Original instruction: sw v289,0(v290)
sw $t2,0($t0)
# Original instruction: addiu v291,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v292,0(v291)
lw $t0,0($t0)
# Original instruction: addiu v293,$fp,4
addiu $t2,$fp,4
# Original instruction: lw v294,0(v293)
lw $t2,0($t2)
# Original instruction: add v295,v292,v294
add $t0,$t0,$t2
# Original instruction: addiu v296,$fp,-32
addiu $t2,$fp,-32
# Loading from v295 from reg into v296
# Original instruction: sw v295,0(v296)
sw $t0,0($t2)
# Original instruction: addiu v297,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v298,0(v297)
lw $t0,0($t0)
# Original instruction: addiu v299,$fp,-16
addiu $t2,$fp,-16
# Original instruction: lw v300,0(v299)
lw $t2,0($t2)
# Original instruction: mul v301,v298,v300
mul $t2,$t0,$t2
# Original instruction: addiu v302,$fp,-36
addiu $t0,$fp,-36
# Loading from v301 from reg into v302
# Original instruction: sw v301,0(v302)
sw $t2,0($t0)
# Original instruction: addiu v303,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v304,0(v303)
lw $t2,0($t0)
# Original instruction: addiu v305,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v306,0(v305)
lw $t0,0($t0)
# Original instruction: add v307,v304,v306
add $t0,$t2,$t0
# Original instruction: addiu v308,$fp,-40
addiu $t2,$fp,-40
# Loading from v307 from reg into v308
# Original instruction: sw v307,0(v308)
sw $t0,0($t2)
# Original instruction: addiu v309,$fp,-28
addiu $t0,$fp,-28
# Original instruction: lw v310,0(v309)
lw $t0,0($t0)
# Original instruction: addiu v311,$fp,-32
addiu $t2,$fp,-32
# Original instruction: lw v312,0(v311)
lw $t2,0($t2)
# Original instruction: sub v313,v310,v312
sub $t0,$t0,$t2
# Original instruction: addiu v314,$fp,-44
addiu $t2,$fp,-44
# Loading from v313 from reg into v314
# Original instruction: sw v313,0(v314)
sw $t0,0($t2)
# Original instruction: addiu v315,$fp,-36
addiu $t0,$fp,-36
# Original instruction: lw v316,0(v315)
lw $t2,0($t0)
# Original instruction: addiu v317,$fp,-40
addiu $t0,$fp,-40
# Original instruction: lw v318,0(v317)
lw $t0,0($t0)
# Original instruction: div v316,v318
div $t2,$t0
# Original instruction: mflo v319
mflo $t0
# Original instruction: addiu v320,$fp,-48
addiu $t2,$fp,-48
# Loading from v319 from reg into v320
# Original instruction: sw v319,0(v320)
sw $t0,0($t2)
# Original instruction: addiu v321,$fp,-44
addiu $t0,$fp,-44
# Original instruction: lw v322,0(v321)
lw $t2,0($t0)
# Original instruction: addiu v323,$fp,40
addiu $t0,$fp,40
# Original instruction: lw v324,0(v323)
lw $t0,0($t0)
# Original instruction: mul v325,v322,v324
mul $t2,$t2,$t0
# Original instruction: addiu v326,$fp,-52
addiu $t0,$fp,-52
# Loading from v325 from reg into v326
# Original instruction: sw v325,0(v326)
sw $t2,0($t0)
# Original instruction: addiu v327,$fp,-48
addiu $t0,$fp,-48
# Original instruction: lw v328,0(v327)
lw $t2,0($t0)
# Original instruction: addiu v329,$fp,36
addiu $t0,$fp,36
# Original instruction: lw v330,0(v329)
lw $t0,0($t0)
# Original instruction: add v331,v328,v330
add $t2,$t2,$t0
# Original instruction: addiu v332,$fp,-56
addiu $t0,$fp,-56
# Loading from v331 from reg into v332
# Original instruction: sw v331,0(v332)
sw $t2,0($t0)
# Original instruction: addiu v333,$fp,-52
addiu $t0,$fp,-52
# Original instruction: lw v334,0(v333)
lw $t2,0($t0)
# Original instruction: addiu v335,$fp,32
addiu $t0,$fp,32
# Original instruction: lw v336,0(v335)
lw $t0,0($t0)
# Original instruction: sub v337,v334,v336
sub $t2,$t2,$t0
# Original instruction: addiu v338,$fp,-60
addiu $t0,$fp,-60
# Loading from v337 from reg into v338
# Original instruction: sw v337,0(v338)
sw $t2,0($t0)
# Original instruction: addiu v339,$fp,-56
addiu $t0,$fp,-56
# Original instruction: lw v340,0(v339)
lw $t0,0($t0)
# Original instruction: addiu v341,$fp,28
addiu $t2,$fp,28
# Original instruction: lw v342,0(v341)
lw $t2,0($t2)
# Original instruction: mul v343,v340,v342
mul $t2,$t0,$t2
# Original instruction: addiu v344,$fp,-64
addiu $t0,$fp,-64
# Loading from v343 from reg into v344
# Original instruction: sw v343,0(v344)
sw $t2,0($t0)
# Original instruction: addiu v345,$fp,-60
addiu $t0,$fp,-60
# Original instruction: lw v346,0(v345)
lw $t2,0($t0)
# Original instruction: addiu v347,$fp,-64
addiu $t0,$fp,-64
# Original instruction: lw v348,0(v347)
lw $t0,0($t0)
# Original instruction: add v349,v346,v348
add $t0,$t2,$t0
# Original instruction: addiu v350,$fp,-68
addiu $t2,$fp,-68
# Loading from v349 from reg into v350
# Original instruction: sw v349,0(v350)
sw $t0,0($t2)
# Original instruction: addiu v351,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v352,0(v351)
lw $t0,0($t0)
# Original instruction: addiu v353,$fp,-16
addiu $t2,$fp,-16
# Original instruction: lw v354,0(v353)
lw $t2,0($t2)
# Original instruction: add v355,v352,v354
add $t3,$t0,$t2
# Original instruction: addiu v356,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v357,0(v356)
lw $t2,0($t0)
# Original instruction: addiu v358,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v359,0(v358)
lw $t0,0($t0)
# Original instruction: sub v360,v357,v359
sub $t0,$t2,$t0
# Original instruction: mul v361,v355,v360
mul $t2,$t3,$t0
# Original instruction: addiu v362,$fp,-28
addiu $t0,$fp,-28
# Original instruction: lw v363,0(v362)
lw $t3,0($t0)
# Original instruction: addiu v364,$fp,-32
addiu $t0,$fp,-32
# Original instruction: lw v365,0(v364)
lw $t0,0($t0)
# Original instruction: mul v366,v363,v365
mul $t0,$t3,$t0
# Original instruction: add v367,v361,v366
add $t2,$t2,$t0
# Original instruction: addiu v368,$fp,-36
addiu $t0,$fp,-36
# Original instruction: lw v369,0(v368)
lw $t3,0($t0)
# Original instruction: addiu v370,$fp,-40
addiu $t0,$fp,-40
# Original instruction: lw v371,0(v370)
lw $t4,0($t0)
# Original instruction: addi v372,$zero,1
addi $t0,$zero,1
# Original instruction: add v373,v371,v372
add $t0,$t4,$t0
# Original instruction: div v369,v373
div $t3,$t0
# Original instruction: mflo v374
mflo $t0
# Original instruction: sub v375,v367,v374
sub $t3,$t2,$t0
# Original instruction: addiu v376,$fp,-44
addiu $t0,$fp,-44
# Original instruction: lw v377,0(v376)
lw $t2,0($t0)
# Original instruction: addiu v378,$fp,-48
addiu $t0,$fp,-48
# Original instruction: lw v379,0(v378)
lw $t0,0($t0)
# Original instruction: mul v380,v377,v379
mul $t0,$t2,$t0
# Original instruction: add v381,v375,v380
add $t4,$t3,$t0
# Original instruction: addiu v382,$fp,-52
addiu $t0,$fp,-52
# Original instruction: lw v383,0(v382)
lw $t0,0($t0)
# Original instruction: addiu v384,$fp,-56
addiu $t2,$fp,-56
# Original instruction: lw v385,0(v384)
lw $t2,0($t2)
# Original instruction: add v386,v383,v385
add $t2,$t0,$t2
# Original instruction: addiu v387,$fp,-60
addiu $t0,$fp,-60
# Original instruction: lw v388,0(v387)
lw $t0,0($t0)
# Original instruction: addiu v389,$fp,-64
addiu $t3,$fp,-64
# Original instruction: lw v390,0(v389)
lw $t3,0($t3)
# Original instruction: sub v391,v388,v390
sub $t0,$t0,$t3
# Original instruction: mul v392,v386,v391
mul $t0,$t2,$t0
# Original instruction: sub v393,v381,v392
sub $t0,$t4,$t0
# Original instruction: addiu v394,$fp,-68
addiu $t2,$fp,-68
# Original instruction: lw v395,0(v394)
lw $t2,0($t2)
# Original instruction: add v396,v393,v395
add $t0,$t0,$t2
# Original instruction: addiu v397,$fp,-72
addiu $t2,$fp,-72
# Loading from v396 from reg into v397
# Original instruction: sw v396,0(v397)
sw $t0,0($t2)
# Return statement start
# Original instruction: addiu v398,$fp,-72
addiu $t0,$fp,-72
# Original instruction: addiu v399,$fp,0
addiu $t4,$fp,0
# 
# Loading from v398 from stack into v399
# Original instruction: li v400,4
li $t2,4
# Original instruction: li v401,0
li $t6,0
label_66_mem_copy_loop:
# Original instruction: beq v401,v400,label_67_mem_copy_end
beq $t6,$t2,label_67_mem_copy_end
# Original instruction: add v402,v398,v401
add $t3,$t0,$t6
# Original instruction: lb v404,0(v402)
lb $t5,0($t3)
# Original instruction: add v403,v399,v401
add $t3,$t4,$t6
# Original instruction: sb v404,0(v403)
sb $t5,0($t3)
# Original instruction: addi v401,v401,1
addi $t6,$t6,1
# Original instruction: j label_66_mem_copy_loop
j label_66_mem_copy_loop
label_67_mem_copy_end:
# 
# Original instruction: jal complexComputationEND
jal complexComputationEND
# Return statement end
# BEGIN EPILOGUE
complexComputationEND:
# Original instruction: addi $sp,v262,0
addi $sp,$t1,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
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
stressFibonacci:
# Clearing entire allocated stack frame of size 52
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
label_70_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,53
slti $t2,$t0,53
# Original instruction: bne $t2,$zero,label_70_clean_loop
bne $t2,$zero,label_70_clean_loop
label_71_clean_loop_end:
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
# Original instruction: addiu $sp,$fp,-52
addiu $sp,$fp,-52
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v405,$sp,0
addi $t2,$sp,0
# END PROLOGUE
# Original instruction: addiu v406,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v407,0(v406)
lw $t1,0($t0)
# Original instruction: addi v408,$zero,1
addi $t0,$zero,1
# Original instruction: slt v410,v408,v407
slt $t0,$t0,$t1
# Original instruction: addi v411,$zero,1
addi $t1,$zero,1
# Original instruction: sub v409,v411,v410
sub $t0,$t1,$t0
# Original instruction: beqz v409,label_72_else
beqz $t0,label_72_else
# Return statement start
# Original instruction: addiu v412,$fp,4
addiu $t4,$fp,4
# Original instruction: addiu v413,$fp,0
addiu $t1,$fp,0
# 
# Loading from v412 from stack into v413
# Original instruction: li v414,4
li $t5,4
# Original instruction: li v415,0
li $t3,0
label_74_mem_copy_loop:
# Original instruction: beq v415,v414,label_75_mem_copy_end
beq $t3,$t5,label_75_mem_copy_end
# Original instruction: add v416,v412,v415
add $t0,$t4,$t3
# Original instruction: lb v418,0(v416)
lb $t0,0($t0)
# Original instruction: add v417,v413,v415
add $t6,$t1,$t3
# Original instruction: sb v418,0(v417)
sb $t0,0($t6)
# Original instruction: addi v415,v415,1
addi $t3,$t3,1
# Original instruction: j label_74_mem_copy_loop
j label_74_mem_copy_loop
label_75_mem_copy_end:
# 
# Original instruction: jal stressFibonacciEND
jal stressFibonacciEND
# Return statement end
# Original instruction: j label_73_end
j label_73_end
label_72_else:
label_73_end:
# Original instruction: addi v419,$zero,0
addi $t1,$zero,0
# Original instruction: addiu v420,$fp,-12
addiu $t0,$fp,-12
# Loading from v419 from reg into v420
# Original instruction: sw v419,0(v420)
sw $t1,0($t0)
# Original instruction: addi v421,$zero,1
addi $t1,$zero,1
# Original instruction: addiu v422,$fp,-16
addiu $t0,$fp,-16
# Loading from v421 from reg into v422
# Original instruction: sw v421,0(v422)
sw $t1,0($t0)
# Original instruction: addi v423,$zero,2
addi $t0,$zero,2
# Original instruction: addiu v424,$fp,-20
addiu $t1,$fp,-20
# Loading from v423 from reg into v424
# Original instruction: sw v423,0(v424)
sw $t0,0($t1)
# Original instruction: addiu v425,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v426,0(v425)
lw $t1,0($t0)
# Original instruction: addiu v427,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v428,0(v427)
lw $t0,0($t0)
# Original instruction: add v429,v426,v428
add $t1,$t1,$t0
# Original instruction: addiu v430,$fp,-24
addiu $t0,$fp,-24
# Loading from v429 from reg into v430
# Original instruction: sw v429,0(v430)
sw $t1,0($t0)
# Original instruction: addiu v431,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v432,0(v431)
lw $t1,0($t0)
# Original instruction: addiu v433,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v434,0(v433)
lw $t0,0($t0)
# Original instruction: add v435,v432,v434
add $t1,$t1,$t0
# Original instruction: addiu v436,$fp,-28
addiu $t0,$fp,-28
# Loading from v435 from reg into v436
# Original instruction: sw v435,0(v436)
sw $t1,0($t0)
# Original instruction: addiu v437,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v438,0(v437)
lw $t1,0($t0)
# Original instruction: addiu v439,$fp,-28
addiu $t0,$fp,-28
# Original instruction: lw v440,0(v439)
lw $t0,0($t0)
# Original instruction: add v441,v438,v440
add $t1,$t1,$t0
# Original instruction: addiu v442,$fp,-32
addiu $t0,$fp,-32
# Loading from v441 from reg into v442
# Original instruction: sw v441,0(v442)
sw $t1,0($t0)
# Original instruction: addiu v443,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v444,0(v443)
lw $t1,0($t0)
# Original instruction: addiu v445,$fp,-32
addiu $t0,$fp,-32
# Original instruction: lw v446,0(v445)
lw $t0,0($t0)
# Original instruction: add v447,v444,v446
add $t1,$t1,$t0
# Original instruction: addiu v448,$fp,-36
addiu $t0,$fp,-36
# Loading from v447 from reg into v448
# Original instruction: sw v447,0(v448)
sw $t1,0($t0)
# Original instruction: addiu v449,$fp,-28
addiu $t0,$fp,-28
# Original instruction: lw v450,0(v449)
lw $t0,0($t0)
# Original instruction: addiu v451,$fp,-36
addiu $t1,$fp,-36
# Original instruction: lw v452,0(v451)
lw $t1,0($t1)
# Original instruction: add v453,v450,v452
add $t0,$t0,$t1
# Original instruction: addiu v454,$fp,-40
addiu $t1,$fp,-40
# Loading from v453 from reg into v454
# Original instruction: sw v453,0(v454)
sw $t0,0($t1)
# Original instruction: addiu v455,$fp,-32
addiu $t0,$fp,-32
# Original instruction: lw v456,0(v455)
lw $t1,0($t0)
# Original instruction: addiu v457,$fp,-40
addiu $t0,$fp,-40
# Original instruction: lw v458,0(v457)
lw $t0,0($t0)
# Original instruction: add v459,v456,v458
add $t1,$t1,$t0
# Original instruction: addiu v460,$fp,-44
addiu $t0,$fp,-44
# Loading from v459 from reg into v460
# Original instruction: sw v459,0(v460)
sw $t1,0($t0)
# Original instruction: addiu v461,$fp,-36
addiu $t0,$fp,-36
# Original instruction: lw v462,0(v461)
lw $t1,0($t0)
# Original instruction: addiu v463,$fp,-44
addiu $t0,$fp,-44
# Original instruction: lw v464,0(v463)
lw $t0,0($t0)
# Original instruction: add v465,v462,v464
add $t1,$t1,$t0
# Original instruction: addiu v466,$fp,-48
addiu $t0,$fp,-48
# Loading from v465 from reg into v466
# Original instruction: sw v465,0(v466)
sw $t1,0($t0)
# Original instruction: addiu v467,$fp,-16
addiu $t1,$fp,-16
# Original instruction: addiu v468,$fp,-52
addiu $t3,$fp,-52
# 
# Loading from v467 from stack into v468
# Original instruction: li v469,4
li $t6,4
# Original instruction: li v470,0
li $t4,0
label_77_mem_copy_loop:
# Original instruction: beq v470,v469,label_78_mem_copy_end
beq $t4,$t6,label_78_mem_copy_end
# Original instruction: add v471,v467,v470
add $t0,$t1,$t4
# Original instruction: lb v473,0(v471)
lb $t5,0($t0)
# Original instruction: add v472,v468,v470
add $t0,$t3,$t4
# Original instruction: sb v473,0(v472)
sb $t5,0($t0)
# Original instruction: addi v470,v470,1
addi $t4,$t4,1
# Original instruction: j label_77_mem_copy_loop
j label_77_mem_copy_loop
label_78_mem_copy_end:
# 
label_79_while_start:
# Original instruction: addiu v474,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v475,0(v474)
lw $t0,0($t0)
# Original instruction: addiu v476,$fp,4
addiu $t1,$fp,4
# Original instruction: lw v477,0(v476)
lw $t1,0($t1)
# Original instruction: slt v478,v475,v477
slt $t0,$t0,$t1
# Original instruction: beqz v478,label_80_while_end
beqz $t0,label_80_while_end
# Original instruction: addiu v479,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v480,0(v479)
lw $t1,0($t0)
# Original instruction: addiu v481,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v482,0(v481)
lw $t0,0($t0)
# Original instruction: add v483,v480,v482
add $t1,$t1,$t0
# Original instruction: addiu v484,$fp,-52
addiu $t0,$fp,-52
# Loading from v483 from reg into v484
# Original instruction: sw v483,0(v484)
sw $t1,0($t0)
# Original instruction: addiu v485,$fp,-16
addiu $t4,$fp,-16
# Original instruction: addiu v486,$fp,-12
addiu $t1,$fp,-12
# 
# Loading from v485 from stack into v486
# Original instruction: li v487,4
li $t3,4
# Original instruction: li v488,0
li $t5,0
label_81_mem_copy_loop:
# Original instruction: beq v488,v487,label_82_mem_copy_end
beq $t5,$t3,label_82_mem_copy_end
# Original instruction: add v489,v485,v488
add $t0,$t4,$t5
# Original instruction: lb v491,0(v489)
lb $t0,0($t0)
# Original instruction: add v490,v486,v488
add $t6,$t1,$t5
# Original instruction: sb v491,0(v490)
sb $t0,0($t6)
# Original instruction: addi v488,v488,1
addi $t5,$t5,1
# Original instruction: j label_81_mem_copy_loop
j label_81_mem_copy_loop
label_82_mem_copy_end:
# 
# Original instruction: addiu v492,$fp,-52
addiu $t3,$fp,-52
# Original instruction: addiu v493,$fp,-16
addiu $t5,$fp,-16
# 
# Loading from v492 from stack into v493
# Original instruction: li v494,4
li $t6,4
# Original instruction: li v495,0
li $t0,0
label_83_mem_copy_loop:
# Original instruction: beq v495,v494,label_84_mem_copy_end
beq $t0,$t6,label_84_mem_copy_end
# Original instruction: add v496,v492,v495
add $t1,$t3,$t0
# Original instruction: lb v498,0(v496)
lb $t4,0($t1)
# Original instruction: add v497,v493,v495
add $t1,$t5,$t0
# Original instruction: sb v498,0(v497)
sb $t4,0($t1)
# Original instruction: addi v495,v495,1
addi $t0,$t0,1
# Original instruction: j label_83_mem_copy_loop
j label_83_mem_copy_loop
label_84_mem_copy_end:
# 
# Original instruction: addiu v499,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v500,0(v499)
lw $t1,0($t0)
# Original instruction: addi v501,$zero,2
addi $t0,$zero,2
# Original instruction: mul v502,v500,v501
mul $t1,$t1,$t0
# Original instruction: addiu v503,$fp,-24
addiu $t0,$fp,-24
# Loading from v502 from reg into v503
# Original instruction: sw v502,0(v503)
sw $t1,0($t0)
# Original instruction: addiu v504,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v505,0(v504)
lw $t0,0($t0)
# Original instruction: addi v506,$zero,3
addi $t1,$zero,3
# Original instruction: mul v507,v505,v506
mul $t1,$t0,$t1
# Original instruction: addiu v508,$fp,-28
addiu $t0,$fp,-28
# Loading from v507 from reg into v508
# Original instruction: sw v507,0(v508)
sw $t1,0($t0)
# Original instruction: addiu v509,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v510,0(v509)
lw $t1,0($t0)
# Original instruction: addi v511,$zero,4
addi $t0,$zero,4
# Original instruction: mul v512,v510,v511
mul $t0,$t1,$t0
# Original instruction: addiu v513,$fp,-32
addiu $t1,$fp,-32
# Loading from v512 from reg into v513
# Original instruction: sw v512,0(v513)
sw $t0,0($t1)
# Original instruction: addiu v514,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v515,0(v514)
lw $t1,0($t0)
# Original instruction: addi v516,$zero,5
addi $t0,$zero,5
# Original instruction: mul v517,v515,v516
mul $t1,$t1,$t0
# Original instruction: addiu v518,$fp,-36
addiu $t0,$fp,-36
# Loading from v517 from reg into v518
# Original instruction: sw v517,0(v518)
sw $t1,0($t0)
# Original instruction: addiu v519,$fp,-28
addiu $t0,$fp,-28
# Original instruction: lw v520,0(v519)
lw $t1,0($t0)
# Original instruction: addi v521,$zero,2
addi $t0,$zero,2
# Original instruction: div v520,v521
div $t1,$t0
# Original instruction: mflo v522
mflo $t0
# Original instruction: addiu v523,$fp,-40
addiu $t1,$fp,-40
# Loading from v522 from reg into v523
# Original instruction: sw v522,0(v523)
sw $t0,0($t1)
# Original instruction: addiu v524,$fp,-32
addiu $t0,$fp,-32
# Original instruction: lw v525,0(v524)
lw $t0,0($t0)
# Original instruction: addi v526,$zero,3
addi $t1,$zero,3
# Original instruction: div v525,v526
div $t0,$t1
# Original instruction: mflo v527
mflo $t0
# Original instruction: addiu v528,$fp,-44
addiu $t1,$fp,-44
# Loading from v527 from reg into v528
# Original instruction: sw v527,0(v528)
sw $t0,0($t1)
# Original instruction: addiu v529,$fp,-36
addiu $t0,$fp,-36
# Original instruction: lw v530,0(v529)
lw $t0,0($t0)
# Original instruction: addi v531,$zero,4
addi $t1,$zero,4
# Original instruction: div v530,v531
div $t0,$t1
# Original instruction: mflo v532
mflo $t1
# Original instruction: addiu v533,$fp,-48
addiu $t0,$fp,-48
# Loading from v532 from reg into v533
# Original instruction: sw v532,0(v533)
sw $t1,0($t0)
# Original instruction: addiu v534,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v535,0(v534)
lw $t1,0($t0)
# Original instruction: addi v536,$zero,1
addi $t0,$zero,1
# Original instruction: add v537,v535,v536
add $t0,$t1,$t0
# Original instruction: addiu v538,$fp,-20
addiu $t1,$fp,-20
# Loading from v537 from reg into v538
# Original instruction: sw v537,0(v538)
sw $t0,0($t1)
# Original instruction: j label_79_while_start
j label_79_while_start
label_80_while_end:
# Return statement start
# Original instruction: addiu v539,$fp,-16
addiu $t1,$fp,-16
# Original instruction: addiu v540,$fp,0
addiu $t4,$fp,0
# 
# Loading from v539 from stack into v540
# Original instruction: li v541,4
li $t5,4
# Original instruction: li v542,0
li $t3,0
label_85_mem_copy_loop:
# Original instruction: beq v542,v541,label_86_mem_copy_end
beq $t3,$t5,label_86_mem_copy_end
# Original instruction: add v543,v539,v542
add $t0,$t1,$t3
# Original instruction: lb v545,0(v543)
lb $t6,0($t0)
# Original instruction: add v544,v540,v542
add $t0,$t4,$t3
# Original instruction: sb v545,0(v544)
sb $t6,0($t0)
# Original instruction: addi v542,v542,1
addi $t3,$t3,1
# Original instruction: j label_85_mem_copy_loop
j label_85_mem_copy_loop
label_86_mem_copy_end:
# 
# Original instruction: jal stressFibonacciEND
jal stressFibonacciEND
# Return statement end
# BEGIN EPILOGUE
stressFibonacciEND:
# Original instruction: addi $sp,v405,0
addi $sp,$t2,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
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
createTree:
# Clearing entire allocated stack frame of size 16
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
label_88_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,17
slti $t2,$t0,17
# Original instruction: bne $t2,$zero,label_88_clean_loop
bne $t2,$zero,label_88_clean_loop
label_89_clean_loop_end:
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
# Original instruction: addiu $sp,$fp,-16
addiu $sp,$fp,-16
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v546,$sp,0
addi $t2,$sp,0
# END PROLOGUE
# Original instruction: addi v547,$zero,20
addi $t1,$zero,20
# Original instruction: addiu v548,$fp,-16
addiu $t0,$fp,-16
# Loading from v547 from reg into v548
# Original instruction: sw v547,0(v548)
sw $t1,0($t0)
# BEGIN FUNCALL EXPR FOR mcmalloc
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v549,$fp,-16
addiu $t3,$fp,-16
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v550,$sp,0
addi $t6,$sp,0
# 
# Loading from v549 from stack into v550
# Original instruction: li v551,4
li $t4,4
# Original instruction: li v552,0
li $t5,0
label_90_mem_copy_loop:
# Original instruction: beq v552,v551,label_91_mem_copy_end
beq $t5,$t4,label_91_mem_copy_end
# Original instruction: add v553,v549,v552
add $t0,$t3,$t5
# Original instruction: lb v555,0(v553)
lb $t1,0($t0)
# Original instruction: add v554,v550,v552
add $t0,$t6,$t5
# Original instruction: sb v555,0(v554)
sb $t1,0($t0)
# Original instruction: addi v552,v552,1
addi $t5,$t5,1
# Original instruction: j label_90_mem_copy_loop
j label_90_mem_copy_loop
label_91_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal mcmalloc
jal mcmalloc
# BACK FROM FUNCTION
# Original instruction: addi v556,$sp,0
addi $t0,$sp,0
# Original instruction: lw v557,0(v556)
lw $t0,0($t0)
# Original instruction: addiu v558,$fp,-12
addiu $t1,$fp,-12
# Loading from v557 from reg into v558
# Original instruction: sw v557,0(v558)
sw $t0,0($t1)
# Original instruction: addiu v559,$fp,4
addiu $t1,$fp,4
# Original instruction: addiu v560,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v561,0(v560)
lw $t0,0($t0)
# Original instruction: addiu v562,v561,0
addiu $t0,$t0,0
# 
# Loading from v559 from stack into v562
# Original instruction: li v563,4
li $t6,4
# Original instruction: li v564,0
li $t3,0
label_92_mem_copy_loop:
# Original instruction: beq v564,v563,label_93_mem_copy_end
beq $t3,$t6,label_93_mem_copy_end
# Original instruction: add v565,v559,v564
add $t4,$t1,$t3
# Original instruction: lb v567,0(v565)
lb $t5,0($t4)
# Original instruction: add v566,v562,v564
add $t4,$t0,$t3
# Original instruction: sb v567,0(v566)
sb $t5,0($t4)
# Original instruction: addi v564,v564,1
addi $t3,$t3,1
# Original instruction: j label_92_mem_copy_loop
j label_92_mem_copy_loop
label_93_mem_copy_end:
# 
# Original instruction: addiu v568,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v569,0(v568)
lw $t1,0($t0)
# Original instruction: addi v570,$zero,0
addi $t0,$zero,0
# Original instruction: slt v572,v570,v569
slt $t1,$t0,$t1
# Original instruction: addi v573,$zero,1
addi $t0,$zero,1
# Original instruction: sub v571,v573,v572
sub $t0,$t0,$t1
# Original instruction: beqz v571,label_94_else
beqz $t0,label_94_else
# Original instruction: addi v574,$zero,0
addi $t1,$zero,0
# Original instruction: addiu v575,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v576,0(v575)
lw $t0,0($t0)
# Original instruction: addiu v577,v576,12
addiu $t0,$t0,12
# Loading from v574 from reg into v577
# Original instruction: sw v574,0(v577)
sw $t1,0($t0)
# Original instruction: addi v578,$zero,0
addi $t1,$zero,0
# Original instruction: addiu v579,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v580,0(v579)
lw $t0,0($t0)
# Original instruction: addiu v581,v580,16
addiu $t0,$t0,16
# Loading from v578 from reg into v581
# Original instruction: sw v578,0(v581)
sw $t1,0($t0)
# Original instruction: j label_95_end
j label_95_end
label_94_else:
# BEGIN FUNCALL EXPR FOR createTree
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v582,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v583,0(v582)
lw $t1,0($t0)
# Original instruction: addi v584,$zero,1
addi $t0,$zero,1
# Original instruction: sub v585,v583,v584
sub $t1,$t1,$t0
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v586,$sp,0
addi $t0,$sp,0
# Loading from v585 from reg into v586
# Original instruction: sw v585,0(v586)
sw $t1,0($t0)
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v587,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v588,0(v587)
lw $t0,0($t0)
# Original instruction: addi v589,$zero,2
addi $t1,$zero,2
# Original instruction: mul v590,v588,v589
mul $t0,$t0,$t1
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v591,$sp,0
addi $t1,$sp,0
# Loading from v590 from reg into v591
# Original instruction: sw v590,0(v591)
sw $t0,0($t1)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal createTree
jal createTree
# BACK FROM FUNCTION
# Original instruction: addi v592,$sp,0
addi $t6,$sp,0
# Original instruction: addiu v593,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v594,0(v593)
lw $t0,0($t0)
# Original instruction: addiu v595,v594,4
addiu $t3,$t0,4
# 
# Loading from v592 from stack into v595
# Original instruction: li v596,4
li $t1,4
# Original instruction: li v597,0
li $t0,0
label_96_mem_copy_loop:
# Original instruction: beq v597,v596,label_97_mem_copy_end
beq $t0,$t1,label_97_mem_copy_end
# Original instruction: add v598,v592,v597
add $t4,$t6,$t0
# Original instruction: lb v600,0(v598)
lb $t4,0($t4)
# Original instruction: add v599,v595,v597
add $t5,$t3,$t0
# Original instruction: sb v600,0(v599)
sb $t4,0($t5)
# Original instruction: addi v597,v597,1
addi $t0,$t0,1
# Original instruction: j label_96_mem_copy_loop
j label_96_mem_copy_loop
label_97_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR createTree
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v601,$fp,8
addiu $t0,$fp,8
# Original instruction: lw v602,0(v601)
lw $t0,0($t0)
# Original instruction: addi v603,$zero,1
addi $t1,$zero,1
# Original instruction: sub v604,v602,v603
sub $t0,$t0,$t1
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v605,$sp,0
addi $t1,$sp,0
# Loading from v604 from reg into v605
# Original instruction: sw v604,0(v605)
sw $t0,0($t1)
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v606,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v607,0(v606)
lw $t0,0($t0)
# Original instruction: addi v608,$zero,2
addi $t1,$zero,2
# Original instruction: mul v609,v607,v608
mul $t1,$t0,$t1
# Original instruction: addi v610,$zero,1
addi $t0,$zero,1
# Original instruction: add v611,v609,v610
add $t1,$t1,$t0
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v612,$sp,0
addi $t0,$sp,0
# Loading from v611 from reg into v612
# Original instruction: sw v611,0(v612)
sw $t1,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal createTree
jal createTree
# BACK FROM FUNCTION
# Original instruction: addi v613,$sp,0
addi $t5,$sp,0
# Original instruction: addiu v614,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v615,0(v614)
lw $t0,0($t0)
# Original instruction: addiu v616,v615,8
addiu $t6,$t0,8
# 
# Loading from v613 from stack into v616
# Original instruction: li v617,4
li $t4,4
# Original instruction: li v618,0
li $t1,0
label_98_mem_copy_loop:
# Original instruction: beq v618,v617,label_99_mem_copy_end
beq $t1,$t4,label_99_mem_copy_end
# Original instruction: add v619,v613,v618
add $t0,$t5,$t1
# Original instruction: lb v621,0(v619)
lb $t0,0($t0)
# Original instruction: add v620,v616,v618
add $t3,$t6,$t1
# Original instruction: sb v621,0(v620)
sb $t0,0($t3)
# Original instruction: addi v618,v618,1
addi $t1,$t1,1
# Original instruction: j label_98_mem_copy_loop
j label_98_mem_copy_loop
label_99_mem_copy_end:
# 
# Original instruction: addi v622,$zero,1
addi $t1,$zero,1
# Original instruction: addiu v623,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v624,0(v623)
lw $t0,0($t0)
# Original instruction: addiu v625,v624,12
addiu $t0,$t0,12
# Loading from v622 from reg into v625
# Original instruction: sw v622,0(v625)
sw $t1,0($t0)
# Original instruction: addi v626,$zero,1
addi $t0,$zero,1
# Original instruction: addiu v627,$fp,-12
addiu $t1,$fp,-12
# Original instruction: lw v628,0(v627)
lw $t1,0($t1)
# Original instruction: addiu v629,v628,16
addiu $t1,$t1,16
# Loading from v626 from reg into v629
# Original instruction: sw v626,0(v629)
sw $t0,0($t1)
label_95_end:
# Return statement start
# Original instruction: addiu v630,$fp,-12
addiu $t0,$fp,-12
# Original instruction: addiu v631,$fp,0
addiu $t6,$fp,0
# 
# Loading from v630 from stack into v631
# Original instruction: li v632,4
li $t1,4
# Original instruction: li v633,0
li $t5,0
label_100_mem_copy_loop:
# Original instruction: beq v633,v632,label_101_mem_copy_end
beq $t5,$t1,label_101_mem_copy_end
# Original instruction: add v634,v630,v633
add $t3,$t0,$t5
# Original instruction: lb v636,0(v634)
lb $t4,0($t3)
# Original instruction: add v635,v631,v633
add $t3,$t6,$t5
# Original instruction: sb v636,0(v635)
sb $t4,0($t3)
# Original instruction: addi v633,v633,1
addi $t5,$t5,1
# Original instruction: j label_100_mem_copy_loop
j label_100_mem_copy_loop
label_101_mem_copy_end:
# 
# Original instruction: jal createTreeEND
jal createTreeEND
# Return statement end
# BEGIN EPILOGUE
createTreeEND:
# Original instruction: addi $sp,v546,0
addi $sp,$t2,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
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
sumTree:
# Clearing entire allocated stack frame of size 16
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
label_104_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,17
slti $t2,$t0,17
# Original instruction: bne $t2,$zero,label_104_clean_loop
bne $t2,$zero,label_104_clean_loop
label_105_clean_loop_end:
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
# Original instruction: addiu $sp,$fp,-16
addiu $sp,$fp,-16
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v637,$sp,0
addi $t2,$sp,0
# END PROLOGUE
# Original instruction: addi v638,$zero,0
addi $t1,$zero,0
# Original instruction: addiu v639,$fp,-12
addiu $t0,$fp,-12
# Loading from v638 from reg into v639
# Original instruction: sw v638,0(v639)
sw $t1,0($t0)
# Original instruction: addi v640,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v641,$fp,-16
addiu $t1,$fp,-16
# Loading from v640 from reg into v641
# Original instruction: sw v640,0(v641)
sw $t0,0($t1)
# Original instruction: addiu v642,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v643,0(v642)
lw $t0,0($t0)
# Original instruction: addiu v644,v643,12
addiu $t0,$t0,12
# Original instruction: lw v645,0(v644)
lw $t0,0($t0)
# Original instruction: beqz v645,label_106_else
beqz $t0,label_106_else
# BEGIN FUNCALL EXPR FOR sumTree
# LOADING ARG: Pointer of ast.StructType@5e0e82ae
# GETTING  VALUE
# Original instruction: addiu v646,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v647,0(v646)
lw $t0,0($t0)
# Original instruction: addiu v648,v647,4
addiu $t5,$t0,4
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v649,$sp,0
addi $t6,$sp,0
# 
# Loading from v648 from stack into v649
# Original instruction: li v650,4
li $t0,4
# Original instruction: li v651,0
li $t3,0
label_108_mem_copy_loop:
# Original instruction: beq v651,v650,label_109_mem_copy_end
beq $t3,$t0,label_109_mem_copy_end
# Original instruction: add v652,v648,v651
add $t1,$t5,$t3
# Original instruction: lb v654,0(v652)
lb $t4,0($t1)
# Original instruction: add v653,v649,v651
add $t1,$t6,$t3
# Original instruction: sb v654,0(v653)
sb $t4,0($t1)
# Original instruction: addi v651,v651,1
addi $t3,$t3,1
# Original instruction: j label_108_mem_copy_loop
j label_108_mem_copy_loop
label_109_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal sumTree
jal sumTree
# BACK FROM FUNCTION
# Original instruction: addi v655,$sp,0
addi $t5,$sp,0
# Original instruction: addiu v656,$fp,-12
addiu $t4,$fp,-12
# 
# Loading from v655 from stack into v656
# Original instruction: li v657,4
li $t3,4
# Original instruction: li v658,0
li $t1,0
label_110_mem_copy_loop:
# Original instruction: beq v658,v657,label_111_mem_copy_end
beq $t1,$t3,label_111_mem_copy_end
# Original instruction: add v659,v655,v658
add $t0,$t5,$t1
# Original instruction: lb v661,0(v659)
lb $t0,0($t0)
# Original instruction: add v660,v656,v658
add $t6,$t4,$t1
# Original instruction: sb v661,0(v660)
sb $t0,0($t6)
# Original instruction: addi v658,v658,1
addi $t1,$t1,1
# Original instruction: j label_110_mem_copy_loop
j label_110_mem_copy_loop
label_111_mem_copy_end:
# 
# Original instruction: j label_107_end
j label_107_end
label_106_else:
label_107_end:
# Original instruction: addiu v662,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v663,0(v662)
lw $t0,0($t0)
# Original instruction: addiu v664,v663,16
addiu $t0,$t0,16
# Original instruction: lw v665,0(v664)
lw $t0,0($t0)
# Original instruction: beqz v665,label_112_else
beqz $t0,label_112_else
# BEGIN FUNCALL EXPR FOR sumTree
# LOADING ARG: Pointer of ast.StructType@6771beb3
# GETTING  VALUE
# Original instruction: addiu v666,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v667,0(v666)
lw $t0,0($t0)
# Original instruction: addiu v668,v667,8
addiu $t3,$t0,8
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v669,$sp,0
addi $t4,$sp,0
# 
# Loading from v668 from stack into v669
# Original instruction: li v670,4
li $t6,4
# Original instruction: li v671,0
li $t1,0
label_114_mem_copy_loop:
# Original instruction: beq v671,v670,label_115_mem_copy_end
beq $t1,$t6,label_115_mem_copy_end
# Original instruction: add v672,v668,v671
add $t0,$t3,$t1
# Original instruction: lb v674,0(v672)
lb $t5,0($t0)
# Original instruction: add v673,v669,v671
add $t0,$t4,$t1
# Original instruction: sb v674,0(v673)
sb $t5,0($t0)
# Original instruction: addi v671,v671,1
addi $t1,$t1,1
# Original instruction: j label_114_mem_copy_loop
j label_114_mem_copy_loop
label_115_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal sumTree
jal sumTree
# BACK FROM FUNCTION
# Original instruction: addi v675,$sp,0
addi $t1,$sp,0
# Original instruction: addiu v676,$fp,-16
addiu $t5,$fp,-16
# 
# Loading from v675 from stack into v676
# Original instruction: li v677,4
li $t4,4
# Original instruction: li v678,0
li $t6,0
label_116_mem_copy_loop:
# Original instruction: beq v678,v677,label_117_mem_copy_end
beq $t6,$t4,label_117_mem_copy_end
# Original instruction: add v679,v675,v678
add $t0,$t1,$t6
# Original instruction: lb v681,0(v679)
lb $t3,0($t0)
# Original instruction: add v680,v676,v678
add $t0,$t5,$t6
# Original instruction: sb v681,0(v680)
sb $t3,0($t0)
# Original instruction: addi v678,v678,1
addi $t6,$t6,1
# Original instruction: j label_116_mem_copy_loop
j label_116_mem_copy_loop
label_117_mem_copy_end:
# 
# Original instruction: j label_113_end
j label_113_end
label_112_else:
label_113_end:
# Return statement start
# Original instruction: addiu v682,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v683,0(v682)
lw $t0,0($t0)
# Original instruction: addiu v684,v683,0
addiu $t0,$t0,0
# Original instruction: lw v685,0(v684)
lw $t1,0($t0)
# Original instruction: addiu v686,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v687,0(v686)
lw $t0,0($t0)
# Original instruction: add v688,v685,v687
add $t1,$t1,$t0
# Original instruction: addiu v689,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v690,0(v689)
lw $t0,0($t0)
# Original instruction: add v691,v688,v690
add $t1,$t1,$t0
# Original instruction: addiu v692,$fp,0
addiu $t0,$fp,0
# Loading from v691 from reg into v692
# Original instruction: sw v691,0(v692)
sw $t1,0($t0)
# Original instruction: jal sumTreeEND
jal sumTreeEND
# Return statement end
# BEGIN EPILOGUE
sumTreeEND:
# Original instruction: addi $sp,v637,0
addi $sp,$t2,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
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
# Clearing entire allocated stack frame of size 272
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
label_119_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,273
slti $t2,$t0,273
# Original instruction: bne $t2,$zero,label_119_clean_loop
bne $t2,$zero,label_119_clean_loop
label_120_clean_loop_end:
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
# Original instruction: addiu $sp,$fp,-272
addiu $sp,$fp,-272
# Original instruction: pushRegisters
# Registers:
addiu $sp,$sp,-4
sw $t0,0($sp)
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
addiu $sp,$sp,-4
sw $t4,0($sp)
addiu $sp,$sp,-4
sw $t5,0($sp)
addiu $sp,$sp,-4
sw $t6,0($sp)
# Original instruction: addi v693,$sp,0
addi $t1,$sp,0
# END PROLOGUE
# Original instruction: addi v694,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v695,$fp,-12
addiu $t2,$fp,-12
# Loading from v694 from reg into v695
# Original instruction: sw v694,0(v695)
sw $t0,0($t2)
# Original instruction: addi v696,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v697,$fp,-16
addiu $t2,$fp,-16
# Loading from v696 from reg into v697
# Original instruction: sw v696,0(v697)
sw $t0,0($t2)
label_121_while_start:
# Original instruction: addiu v698,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v699,0(v698)
lw $t2,0($t0)
# Original instruction: addi v700,$zero,3
addi $t0,$zero,3
# Original instruction: slt v701,v699,v700
slt $t0,$t2,$t0
# Original instruction: beqz v701,label_122_while_end
beqz $t0,label_122_while_end
# Original instruction: addi v702,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v703,$fp,-20
addiu $t2,$fp,-20
# Loading from v702 from reg into v703
# Original instruction: sw v702,0(v703)
sw $t0,0($t2)
label_123_while_start:
# Original instruction: addiu v704,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v705,0(v704)
lw $t2,0($t0)
# Original instruction: addi v706,$zero,3
addi $t0,$zero,3
# Original instruction: slt v707,v705,v706
slt $t0,$t2,$t0
# Original instruction: beqz v707,label_124_while_end
beqz $t0,label_124_while_end
# Original instruction: addiu v708,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v709,0(v708)
lw $t2,0($t0)
# Original instruction: addi v710,$zero,3
addi $t0,$zero,3
# Original instruction: mul v711,v709,v710
mul $t2,$t2,$t0
# Original instruction: addiu v712,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v713,0(v712)
lw $t0,0($t0)
# Original instruction: add v714,v711,v713
add $t0,$t2,$t0
# Original instruction: addi v715,$zero,1
addi $t2,$zero,1
# Original instruction: add v716,v714,v715
add $t2,$t0,$t2
# Original instruction: addiu v717,$fp,-152
addiu $t0,$fp,-152
# Original instruction: addiu v718,$fp,-16
addiu $t3,$fp,-16
# Original instruction: lw v719,0(v718)
lw $t4,0($t3)
# Original instruction: li v722,12
li $t3,12
# Original instruction: mul v721,v719,v722
mul $t3,$t4,$t3
# Original instruction: add v720,v717,v721
add $t3,$t0,$t3
# Original instruction: addiu v723,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v724,0(v723)
lw $t4,0($t0)
# Original instruction: li v727,4
li $t0,4
# Original instruction: mul v726,v724,v727
mul $t0,$t4,$t0
# Original instruction: add v725,v720,v726
add $t0,$t3,$t0
# Loading from v716 from reg into v725
# Original instruction: sw v716,0(v725)
sw $t2,0($t0)
# Original instruction: addiu v728,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v729,0(v728)
lw $t2,0($t0)
# Original instruction: addi v730,$zero,3
addi $t0,$zero,3
# Original instruction: mul v731,v729,v730
mul $t2,$t2,$t0
# Original instruction: addiu v732,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v733,0(v732)
lw $t0,0($t0)
# Original instruction: add v734,v731,v733
add $t0,$t2,$t0
# Original instruction: addi v735,$zero,1
addi $t2,$zero,1
# Original instruction: add v736,v734,v735
add $t2,$t0,$t2
# Original instruction: addi v737,$zero,2
addi $t0,$zero,2
# Original instruction: mul v738,v736,v737
mul $t3,$t2,$t0
# Original instruction: addiu v739,$fp,-188
addiu $t4,$fp,-188
# Original instruction: addiu v740,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v741,0(v740)
lw $t0,0($t0)
# Original instruction: li v744,12
li $t2,12
# Original instruction: mul v743,v741,v744
mul $t0,$t0,$t2
# Original instruction: add v742,v739,v743
add $t0,$t4,$t0
# Original instruction: addiu v745,$fp,-20
addiu $t2,$fp,-20
# Original instruction: lw v746,0(v745)
lw $t2,0($t2)
# Original instruction: li v749,4
li $t4,4
# Original instruction: mul v748,v746,v749
mul $t2,$t2,$t4
# Original instruction: add v747,v742,v748
add $t0,$t0,$t2
# Loading from v738 from reg into v747
# Original instruction: sw v738,0(v747)
sw $t3,0($t0)
# Original instruction: addiu v750,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v751,0(v750)
lw $t0,0($t0)
# Original instruction: addi v752,$zero,1
addi $t2,$zero,1
# Original instruction: add v753,v751,v752
add $t2,$t0,$t2
# Original instruction: addiu v754,$fp,-20
addiu $t0,$fp,-20
# Loading from v753 from reg into v754
# Original instruction: sw v753,0(v754)
sw $t2,0($t0)
# Original instruction: j label_123_while_start
j label_123_while_start
label_124_while_end:
# Original instruction: addiu v755,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v756,0(v755)
lw $t0,0($t0)
# Original instruction: addi v757,$zero,1
addi $t2,$zero,1
# Original instruction: add v758,v756,v757
add $t0,$t0,$t2
# Original instruction: addiu v759,$fp,-16
addiu $t2,$fp,-16
# Loading from v758 from reg into v759
# Original instruction: sw v758,0(v759)
sw $t0,0($t2)
# Original instruction: j label_121_while_start
j label_121_while_start
label_122_while_end:
# BEGIN FUNCALL EXPR FOR calculateDeterminant
# LOADING ARG: Array of Array of INT
# GETTING  VALUE
# Original instruction: addiu v760,$fp,-152
addiu $t2,$fp,-152
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v761,$sp,0
addi $t0,$sp,0
# Loading from v760 from reg into v761
# Original instruction: sw v760,0(v761)
sw $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal calculateDeterminant
jal calculateDeterminant
# BACK FROM FUNCTION
# Original instruction: addi v762,$sp,0
addi $t6,$sp,0
# Original instruction: addiu v763,$fp,-192
addiu $t2,$fp,-192
# 
# Loading from v762 from stack into v763
# Original instruction: li v764,4
li $t5,4
# Original instruction: li v765,0
li $t0,0
label_125_mem_copy_loop:
# Original instruction: beq v765,v764,label_126_mem_copy_end
beq $t0,$t5,label_126_mem_copy_end
# Original instruction: add v766,v762,v765
add $t3,$t6,$t0
# Original instruction: lb v768,0(v766)
lb $t3,0($t3)
# Original instruction: add v767,v763,v765
add $t4,$t2,$t0
# Original instruction: sb v768,0(v767)
sb $t3,0($t4)
# Original instruction: addi v765,v765,1
addi $t0,$t0,1
# Original instruction: j label_125_mem_copy_loop
j label_125_mem_copy_loop
label_126_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR calculateDeterminant
# LOADING ARG: Array of Array of INT
# GETTING  VALUE
# Original instruction: addiu v769,$fp,-188
addiu $t0,$fp,-188
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v770,$sp,0
addi $t2,$sp,0
# Loading from v769 from reg into v770
# Original instruction: sw v769,0(v770)
sw $t0,0($t2)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal calculateDeterminant
jal calculateDeterminant
# BACK FROM FUNCTION
# Original instruction: addi v771,$sp,0
addi $t3,$sp,0
# Original instruction: addiu v772,$fp,-196
addiu $t5,$fp,-196
# 
# Loading from v771 from stack into v772
# Original instruction: li v773,4
li $t2,4
# Original instruction: li v774,0
li $t4,0
label_127_mem_copy_loop:
# Original instruction: beq v774,v773,label_128_mem_copy_end
beq $t4,$t2,label_128_mem_copy_end
# Original instruction: add v775,v771,v774
add $t0,$t3,$t4
# Original instruction: lb v777,0(v775)
lb $t0,0($t0)
# Original instruction: add v776,v772,v774
add $t6,$t5,$t4
# Original instruction: sb v777,0(v776)
sb $t0,0($t6)
# Original instruction: addi v774,v774,1
addi $t4,$t4,1
# Original instruction: j label_127_mem_copy_loop
j label_127_mem_copy_loop
label_128_mem_copy_end:
# 
# Original instruction: addiu v778,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v779,0(v778)
lw $t2,0($t0)
# Original instruction: addiu v780,$fp,-192
addiu $t0,$fp,-192
# Original instruction: lw v781,0(v780)
lw $t0,0($t0)
# Original instruction: add v782,v779,v781
add $t2,$t2,$t0
# Original instruction: addiu v783,$fp,-196
addiu $t0,$fp,-196
# Original instruction: lw v784,0(v783)
lw $t0,0($t0)
# Original instruction: add v785,v782,v784
add $t2,$t2,$t0
# Original instruction: addiu v786,$fp,-12
addiu $t0,$fp,-12
# Loading from v785 from reg into v786
# Original instruction: sw v785,0(v786)
sw $t2,0($t0)
# BEGIN FUNCALL EXPR FOR createLinkedList
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v787,$zero,7
addi $t0,$zero,7
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v788,$sp,0
addi $t2,$sp,0
# Loading from v787 from reg into v788
# Original instruction: sw v787,0(v788)
sw $t0,0($t2)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal createLinkedList
jal createLinkedList
# BACK FROM FUNCTION
# Original instruction: addi v789,$sp,0
addi $t4,$sp,0
# Original instruction: addiu v790,$fp,-200
addiu $t0,$fp,-200
# 
# Loading from v789 from stack into v790
# Original instruction: li v791,4
li $t5,4
# Original instruction: li v792,0
li $t6,0
label_129_mem_copy_loop:
# Original instruction: beq v792,v791,label_130_mem_copy_end
beq $t6,$t5,label_130_mem_copy_end
# Original instruction: add v793,v789,v792
add $t2,$t4,$t6
# Original instruction: lb v795,0(v793)
lb $t3,0($t2)
# Original instruction: add v794,v790,v792
add $t2,$t0,$t6
# Original instruction: sb v795,0(v794)
sb $t3,0($t2)
# Original instruction: addi v792,v792,1
addi $t6,$t6,1
# Original instruction: j label_129_mem_copy_loop
j label_129_mem_copy_loop
label_130_mem_copy_end:
# 
# Original instruction: addi v796,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v797,$fp,-16
addiu $t2,$fp,-16
# Loading from v796 from reg into v797
# Original instruction: sw v796,0(v797)
sw $t0,0($t2)
# Original instruction: addi v798,$zero,7
addi $t0,$zero,7
# Original instruction: addiu v799,$fp,-36
addiu $t2,$fp,-36
# Loading from v798 from reg into v799
# Original instruction: sw v798,0(v799)
sw $t0,0($t2)
label_131_while_start:
# Original instruction: addiu v800,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v801,0(v800)
lw $t2,0($t0)
# Original instruction: addiu v802,$fp,-36
addiu $t0,$fp,-36
# Original instruction: lw v803,0(v802)
lw $t0,0($t0)
# Original instruction: slt v804,v801,v803
slt $t0,$t2,$t0
# Original instruction: beq v804,$zero,label_133_false_and
beq $t0,$zero,label_133_false_and
# Original instruction: addiu v805,$fp,-200
addiu $t0,$fp,-200
# Original instruction: lw v806,0(v805)
lw $t0,0($t0)
# Original instruction: addiu v807,v806,12
addiu $t0,$t0,12
# Original instruction: lw v808,0(v807)
lw $t0,0($t0)
# Original instruction: beq v808,$zero,label_133_false_and
beq $t0,$zero,label_133_false_and
# Original instruction: addi v809,$zero,1
addi $t0,$zero,1
# Original instruction: j label_134_end_and
j label_134_end_and
label_133_false_and:
# Original instruction: addi v809,$zero,0
addi $t0,$zero,0
label_134_end_and:
# Original instruction: beqz v809,label_132_while_end
beqz $t0,label_132_while_end
# Original instruction: addiu v810,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v811,0(v810)
lw $t0,0($t0)
# Original instruction: addiu v812,$fp,-200
addiu $t2,$fp,-200
# Original instruction: lw v813,0(v812)
lw $t2,0($t2)
# Original instruction: addiu v814,v813,0
addiu $t2,$t2,0
# Original instruction: lw v815,0(v814)
lw $t2,0($t2)
# Original instruction: add v816,v811,v815
add $t2,$t0,$t2
# Original instruction: addiu v817,$fp,-12
addiu $t0,$fp,-12
# Loading from v816 from reg into v817
# Original instruction: sw v816,0(v817)
sw $t2,0($t0)
# Original instruction: addiu v818,$fp,-200
addiu $t0,$fp,-200
# Original instruction: lw v819,0(v818)
lw $t0,0($t0)
# Original instruction: addiu v820,v819,16
addiu $t0,$t0,16
# Original instruction: lw v821,0(v820)
lw $t0,0($t0)
# Original instruction: beqz v821,label_135_else
beqz $t0,label_135_else
# Original instruction: addiu v822,$fp,-200
addiu $t0,$fp,-200
# Original instruction: lw v823,0(v822)
lw $t0,0($t0)
# Original instruction: addiu v824,v823,4
addiu $t3,$t0,4
# Original instruction: addiu v825,$fp,-200
addiu $t5,$fp,-200
# 
# Loading from v824 from stack into v825
# Original instruction: li v826,4
li $t6,4
# Original instruction: li v827,0
li $t4,0
label_137_mem_copy_loop:
# Original instruction: beq v827,v826,label_138_mem_copy_end
beq $t4,$t6,label_138_mem_copy_end
# Original instruction: add v828,v824,v827
add $t0,$t3,$t4
# Original instruction: lb v830,0(v828)
lb $t0,0($t0)
# Original instruction: add v829,v825,v827
add $t2,$t5,$t4
# Original instruction: sb v830,0(v829)
sb $t0,0($t2)
# Original instruction: addi v827,v827,1
addi $t4,$t4,1
# Original instruction: j label_137_mem_copy_loop
j label_137_mem_copy_loop
label_138_mem_copy_end:
# 
# Original instruction: j label_136_end
j label_136_end
label_135_else:
# Original instruction: j label_132_while_end
j label_132_while_end
label_136_end:
# Original instruction: addiu v831,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v832,0(v831)
lw $t2,0($t0)
# Original instruction: addi v833,$zero,1
addi $t0,$zero,1
# Original instruction: add v834,v832,v833
add $t0,$t2,$t0
# Original instruction: addiu v835,$fp,-16
addiu $t2,$fp,-16
# Loading from v834 from reg into v835
# Original instruction: sw v834,0(v835)
sw $t0,0($t2)
# Original instruction: j label_131_while_start
j label_131_while_start
label_132_while_end:
# Original instruction: addi v836,$zero,10
addi $t2,$zero,10
# Original instruction: addiu v837,$fp,-40
addiu $t0,$fp,-40
# Loading from v836 from reg into v837
# Original instruction: sw v836,0(v837)
sw $t2,0($t0)
# Original instruction: addi v838,$zero,20
addi $t0,$zero,20
# Original instruction: addiu v839,$fp,-44
addiu $t2,$fp,-44
# Loading from v838 from reg into v839
# Original instruction: sw v838,0(v839)
sw $t0,0($t2)
# Original instruction: addi v840,$zero,30
addi $t2,$zero,30
# Original instruction: addiu v841,$fp,-48
addiu $t0,$fp,-48
# Loading from v840 from reg into v841
# Original instruction: sw v840,0(v841)
sw $t2,0($t0)
# Original instruction: addi v842,$zero,40
addi $t2,$zero,40
# Original instruction: addiu v843,$fp,-52
addiu $t0,$fp,-52
# Loading from v842 from reg into v843
# Original instruction: sw v842,0(v843)
sw $t2,0($t0)
# Original instruction: addi v844,$zero,50
addi $t0,$zero,50
# Original instruction: addiu v845,$fp,-56
addiu $t2,$fp,-56
# Loading from v844 from reg into v845
# Original instruction: sw v844,0(v845)
sw $t0,0($t2)
# Original instruction: addi v846,$zero,60
addi $t2,$zero,60
# Original instruction: addiu v847,$fp,-60
addiu $t0,$fp,-60
# Loading from v846 from reg into v847
# Original instruction: sw v846,0(v847)
sw $t2,0($t0)
# Original instruction: addi v848,$zero,70
addi $t2,$zero,70
# Original instruction: addiu v849,$fp,-64
addiu $t0,$fp,-64
# Loading from v848 from reg into v849
# Original instruction: sw v848,0(v849)
sw $t2,0($t0)
# Original instruction: addi v850,$zero,80
addi $t0,$zero,80
# Original instruction: addiu v851,$fp,-68
addiu $t2,$fp,-68
# Loading from v850 from reg into v851
# Original instruction: sw v850,0(v851)
sw $t0,0($t2)
# Original instruction: addi v852,$zero,90
addi $t2,$zero,90
# Original instruction: addiu v853,$fp,-72
addiu $t0,$fp,-72
# Loading from v852 from reg into v853
# Original instruction: sw v852,0(v853)
sw $t2,0($t0)
# Original instruction: addi v854,$zero,100
addi $t2,$zero,100
# Original instruction: addiu v855,$fp,-76
addiu $t0,$fp,-76
# Loading from v854 from reg into v855
# Original instruction: sw v854,0(v855)
sw $t2,0($t0)
# Original instruction: addi v856,$zero,110
addi $t0,$zero,110
# Original instruction: addiu v857,$fp,-80
addiu $t2,$fp,-80
# Loading from v856 from reg into v857
# Original instruction: sw v856,0(v857)
sw $t0,0($t2)
# Original instruction: addi v858,$zero,120
addi $t0,$zero,120
# Original instruction: addiu v859,$fp,-84
addiu $t2,$fp,-84
# Loading from v858 from reg into v859
# Original instruction: sw v858,0(v859)
sw $t0,0($t2)
# Original instruction: addi v860,$zero,130
addi $t2,$zero,130
# Original instruction: addiu v861,$fp,-88
addiu $t0,$fp,-88
# Loading from v860 from reg into v861
# Original instruction: sw v860,0(v861)
sw $t2,0($t0)
# Original instruction: addi v862,$zero,140
addi $t0,$zero,140
# Original instruction: addiu v863,$fp,-92
addiu $t2,$fp,-92
# Loading from v862 from reg into v863
# Original instruction: sw v862,0(v863)
sw $t0,0($t2)
# Original instruction: addi v864,$zero,150
addi $t0,$zero,150
# Original instruction: addiu v865,$fp,-96
addiu $t2,$fp,-96
# Loading from v864 from reg into v865
# Original instruction: sw v864,0(v865)
sw $t0,0($t2)
# BEGIN FUNCALL EXPR FOR complexComputation
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v866,$fp,-40
addiu $t0,$fp,-40
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v867,$sp,0
addi $t5,$sp,0
# 
# Loading from v866 from stack into v867
# Original instruction: li v868,4
li $t4,4
# Original instruction: li v869,0
li $t2,0
label_139_mem_copy_loop:
# Original instruction: beq v869,v868,label_140_mem_copy_end
beq $t2,$t4,label_140_mem_copy_end
# Original instruction: add v870,v866,v869
add $t3,$t0,$t2
# Original instruction: lb v872,0(v870)
lb $t3,0($t3)
# Original instruction: add v871,v867,v869
add $t6,$t5,$t2
# Original instruction: sb v872,0(v871)
sb $t3,0($t6)
# Original instruction: addi v869,v869,1
addi $t2,$t2,1
# Original instruction: j label_139_mem_copy_loop
j label_139_mem_copy_loop
label_140_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v873,$fp,-44
addiu $t0,$fp,-44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v874,$sp,0
addi $t6,$sp,0
# 
# Loading from v873 from stack into v874
# Original instruction: li v875,4
li $t4,4
# Original instruction: li v876,0
li $t2,0
label_141_mem_copy_loop:
# Original instruction: beq v876,v875,label_142_mem_copy_end
beq $t2,$t4,label_142_mem_copy_end
# Original instruction: add v877,v873,v876
add $t3,$t0,$t2
# Original instruction: lb v879,0(v877)
lb $t3,0($t3)
# Original instruction: add v878,v874,v876
add $t5,$t6,$t2
# Original instruction: sb v879,0(v878)
sb $t3,0($t5)
# Original instruction: addi v876,v876,1
addi $t2,$t2,1
# Original instruction: j label_141_mem_copy_loop
j label_141_mem_copy_loop
label_142_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v880,$fp,-48
addiu $t3,$fp,-48
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v881,$sp,0
addi $t5,$sp,0
# 
# Loading from v880 from stack into v881
# Original instruction: li v882,4
li $t2,4
# Original instruction: li v883,0
li $t4,0
label_143_mem_copy_loop:
# Original instruction: beq v883,v882,label_144_mem_copy_end
beq $t4,$t2,label_144_mem_copy_end
# Original instruction: add v884,v880,v883
add $t0,$t3,$t4
# Original instruction: lb v886,0(v884)
lb $t0,0($t0)
# Original instruction: add v885,v881,v883
add $t6,$t5,$t4
# Original instruction: sb v886,0(v885)
sb $t0,0($t6)
# Original instruction: addi v883,v883,1
addi $t4,$t4,1
# Original instruction: j label_143_mem_copy_loop
j label_143_mem_copy_loop
label_144_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v887,$fp,-52
addiu $t5,$fp,-52
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v888,$sp,0
addi $t3,$sp,0
# 
# Loading from v887 from stack into v888
# Original instruction: li v889,4
li $t4,4
# Original instruction: li v890,0
li $t6,0
label_145_mem_copy_loop:
# Original instruction: beq v890,v889,label_146_mem_copy_end
beq $t6,$t4,label_146_mem_copy_end
# Original instruction: add v891,v887,v890
add $t0,$t5,$t6
# Original instruction: lb v893,0(v891)
lb $t2,0($t0)
# Original instruction: add v892,v888,v890
add $t0,$t3,$t6
# Original instruction: sb v893,0(v892)
sb $t2,0($t0)
# Original instruction: addi v890,v890,1
addi $t6,$t6,1
# Original instruction: j label_145_mem_copy_loop
j label_145_mem_copy_loop
label_146_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v894,$fp,-56
addiu $t5,$fp,-56
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v895,$sp,0
addi $t4,$sp,0
# 
# Loading from v894 from stack into v895
# Original instruction: li v896,4
li $t6,4
# Original instruction: li v897,0
li $t3,0
label_147_mem_copy_loop:
# Original instruction: beq v897,v896,label_148_mem_copy_end
beq $t3,$t6,label_148_mem_copy_end
# Original instruction: add v898,v894,v897
add $t0,$t5,$t3
# Original instruction: lb v900,0(v898)
lb $t0,0($t0)
# Original instruction: add v899,v895,v897
add $t2,$t4,$t3
# Original instruction: sb v900,0(v899)
sb $t0,0($t2)
# Original instruction: addi v897,v897,1
addi $t3,$t3,1
# Original instruction: j label_147_mem_copy_loop
j label_147_mem_copy_loop
label_148_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v901,$fp,-60
addiu $t5,$fp,-60
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v902,$sp,0
addi $t6,$sp,0
# 
# Loading from v901 from stack into v902
# Original instruction: li v903,4
li $t3,4
# Original instruction: li v904,0
li $t4,0
label_149_mem_copy_loop:
# Original instruction: beq v904,v903,label_150_mem_copy_end
beq $t4,$t3,label_150_mem_copy_end
# Original instruction: add v905,v901,v904
add $t0,$t5,$t4
# Original instruction: lb v907,0(v905)
lb $t0,0($t0)
# Original instruction: add v906,v902,v904
add $t2,$t6,$t4
# Original instruction: sb v907,0(v906)
sb $t0,0($t2)
# Original instruction: addi v904,v904,1
addi $t4,$t4,1
# Original instruction: j label_149_mem_copy_loop
j label_149_mem_copy_loop
label_150_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v908,$fp,-64
addiu $t4,$fp,-64
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v909,$sp,0
addi $t3,$sp,0
# 
# Loading from v908 from stack into v909
# Original instruction: li v910,4
li $t5,4
# Original instruction: li v911,0
li $t2,0
label_151_mem_copy_loop:
# Original instruction: beq v911,v910,label_152_mem_copy_end
beq $t2,$t5,label_152_mem_copy_end
# Original instruction: add v912,v908,v911
add $t0,$t4,$t2
# Original instruction: lb v914,0(v912)
lb $t6,0($t0)
# Original instruction: add v913,v909,v911
add $t0,$t3,$t2
# Original instruction: sb v914,0(v913)
sb $t6,0($t0)
# Original instruction: addi v911,v911,1
addi $t2,$t2,1
# Original instruction: j label_151_mem_copy_loop
j label_151_mem_copy_loop
label_152_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v915,$fp,-68
addiu $t4,$fp,-68
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v916,$sp,0
addi $t0,$sp,0
# 
# Loading from v915 from stack into v916
# Original instruction: li v917,4
li $t6,4
# Original instruction: li v918,0
li $t5,0
label_153_mem_copy_loop:
# Original instruction: beq v918,v917,label_154_mem_copy_end
beq $t5,$t6,label_154_mem_copy_end
# Original instruction: add v919,v915,v918
add $t2,$t4,$t5
# Original instruction: lb v921,0(v919)
lb $t3,0($t2)
# Original instruction: add v920,v916,v918
add $t2,$t0,$t5
# Original instruction: sb v921,0(v920)
sb $t3,0($t2)
# Original instruction: addi v918,v918,1
addi $t5,$t5,1
# Original instruction: j label_153_mem_copy_loop
j label_153_mem_copy_loop
label_154_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v922,$fp,-72
addiu $t4,$fp,-72
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v923,$sp,0
addi $t2,$sp,0
# 
# Loading from v922 from stack into v923
# Original instruction: li v924,4
li $t6,4
# Original instruction: li v925,0
li $t0,0
label_155_mem_copy_loop:
# Original instruction: beq v925,v924,label_156_mem_copy_end
beq $t0,$t6,label_156_mem_copy_end
# Original instruction: add v926,v922,v925
add $t3,$t4,$t0
# Original instruction: lb v928,0(v926)
lb $t3,0($t3)
# Original instruction: add v927,v923,v925
add $t5,$t2,$t0
# Original instruction: sb v928,0(v927)
sb $t3,0($t5)
# Original instruction: addi v925,v925,1
addi $t0,$t0,1
# Original instruction: j label_155_mem_copy_loop
j label_155_mem_copy_loop
label_156_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v929,$fp,-76
addiu $t4,$fp,-76
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v930,$sp,0
addi $t3,$sp,0
# 
# Loading from v929 from stack into v930
# Original instruction: li v931,4
li $t0,4
# Original instruction: li v932,0
li $t6,0
label_157_mem_copy_loop:
# Original instruction: beq v932,v931,label_158_mem_copy_end
beq $t6,$t0,label_158_mem_copy_end
# Original instruction: add v933,v929,v932
add $t2,$t4,$t6
# Original instruction: lb v935,0(v933)
lb $t5,0($t2)
# Original instruction: add v934,v930,v932
add $t2,$t3,$t6
# Original instruction: sb v935,0(v934)
sb $t5,0($t2)
# Original instruction: addi v932,v932,1
addi $t6,$t6,1
# Original instruction: j label_157_mem_copy_loop
j label_157_mem_copy_loop
label_158_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal complexComputation
jal complexComputation
# BACK FROM FUNCTION
# Original instruction: addi v936,$sp,0
addi $t3,$sp,0
# Original instruction: addiu v937,$fp,-104
addiu $t0,$fp,-104
# 
# Loading from v936 from stack into v937
# Original instruction: li v938,4
li $t6,4
# Original instruction: li v939,0
li $t4,0
label_159_mem_copy_loop:
# Original instruction: beq v939,v938,label_160_mem_copy_end
beq $t4,$t6,label_160_mem_copy_end
# Original instruction: add v940,v936,v939
add $t2,$t3,$t4
# Original instruction: lb v942,0(v940)
lb $t2,0($t2)
# Original instruction: add v941,v937,v939
add $t5,$t0,$t4
# Original instruction: sb v942,0(v941)
sb $t2,0($t5)
# Original instruction: addi v939,v939,1
addi $t4,$t4,1
# Original instruction: j label_159_mem_copy_loop
j label_159_mem_copy_loop
label_160_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR complexComputation
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v943,$fp,-44
addiu $t4,$fp,-44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v944,$sp,0
addi $t3,$sp,0
# 
# Loading from v943 from stack into v944
# Original instruction: li v945,4
li $t0,4
# Original instruction: li v946,0
li $t6,0
label_161_mem_copy_loop:
# Original instruction: beq v946,v945,label_162_mem_copy_end
beq $t6,$t0,label_162_mem_copy_end
# Original instruction: add v947,v943,v946
add $t2,$t4,$t6
# Original instruction: lb v949,0(v947)
lb $t2,0($t2)
# Original instruction: add v948,v944,v946
add $t5,$t3,$t6
# Original instruction: sb v949,0(v948)
sb $t2,0($t5)
# Original instruction: addi v946,v946,1
addi $t6,$t6,1
# Original instruction: j label_161_mem_copy_loop
j label_161_mem_copy_loop
label_162_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v950,$fp,-48
addiu $t0,$fp,-48
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v951,$sp,0
addi $t3,$sp,0
# 
# Loading from v950 from stack into v951
# Original instruction: li v952,4
li $t4,4
# Original instruction: li v953,0
li $t5,0
label_163_mem_copy_loop:
# Original instruction: beq v953,v952,label_164_mem_copy_end
beq $t5,$t4,label_164_mem_copy_end
# Original instruction: add v954,v950,v953
add $t2,$t0,$t5
# Original instruction: lb v956,0(v954)
lb $t6,0($t2)
# Original instruction: add v955,v951,v953
add $t2,$t3,$t5
# Original instruction: sb v956,0(v955)
sb $t6,0($t2)
# Original instruction: addi v953,v953,1
addi $t5,$t5,1
# Original instruction: j label_163_mem_copy_loop
j label_163_mem_copy_loop
label_164_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v957,$fp,-52
addiu $t2,$fp,-52
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v958,$sp,0
addi $t4,$sp,0
# 
# Loading from v957 from stack into v958
# Original instruction: li v959,4
li $t3,4
# Original instruction: li v960,0
li $t6,0
label_165_mem_copy_loop:
# Original instruction: beq v960,v959,label_166_mem_copy_end
beq $t6,$t3,label_166_mem_copy_end
# Original instruction: add v961,v957,v960
add $t0,$t2,$t6
# Original instruction: lb v963,0(v961)
lb $t5,0($t0)
# Original instruction: add v962,v958,v960
add $t0,$t4,$t6
# Original instruction: sb v963,0(v962)
sb $t5,0($t0)
# Original instruction: addi v960,v960,1
addi $t6,$t6,1
# Original instruction: j label_165_mem_copy_loop
j label_165_mem_copy_loop
label_166_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v964,$fp,-56
addiu $t4,$fp,-56
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v965,$sp,0
addi $t2,$sp,0
# 
# Loading from v964 from stack into v965
# Original instruction: li v966,4
li $t5,4
# Original instruction: li v967,0
li $t0,0
label_167_mem_copy_loop:
# Original instruction: beq v967,v966,label_168_mem_copy_end
beq $t0,$t5,label_168_mem_copy_end
# Original instruction: add v968,v964,v967
add $t3,$t4,$t0
# Original instruction: lb v970,0(v968)
lb $t3,0($t3)
# Original instruction: add v969,v965,v967
add $t6,$t2,$t0
# Original instruction: sb v970,0(v969)
sb $t3,0($t6)
# Original instruction: addi v967,v967,1
addi $t0,$t0,1
# Original instruction: j label_167_mem_copy_loop
j label_167_mem_copy_loop
label_168_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v971,$fp,-60
addiu $t5,$fp,-60
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v972,$sp,0
addi $t0,$sp,0
# 
# Loading from v971 from stack into v972
# Original instruction: li v973,4
li $t3,4
# Original instruction: li v974,0
li $t2,0
label_169_mem_copy_loop:
# Original instruction: beq v974,v973,label_170_mem_copy_end
beq $t2,$t3,label_170_mem_copy_end
# Original instruction: add v975,v971,v974
add $t4,$t5,$t2
# Original instruction: lb v977,0(v975)
lb $t4,0($t4)
# Original instruction: add v976,v972,v974
add $t6,$t0,$t2
# Original instruction: sb v977,0(v976)
sb $t4,0($t6)
# Original instruction: addi v974,v974,1
addi $t2,$t2,1
# Original instruction: j label_169_mem_copy_loop
j label_169_mem_copy_loop
label_170_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v978,$fp,-64
addiu $t0,$fp,-64
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v979,$sp,0
addi $t3,$sp,0
# 
# Loading from v978 from stack into v979
# Original instruction: li v980,4
li $t4,4
# Original instruction: li v981,0
li $t6,0
label_171_mem_copy_loop:
# Original instruction: beq v981,v980,label_172_mem_copy_end
beq $t6,$t4,label_172_mem_copy_end
# Original instruction: add v982,v978,v981
add $t2,$t0,$t6
# Original instruction: lb v984,0(v982)
lb $t2,0($t2)
# Original instruction: add v983,v979,v981
add $t5,$t3,$t6
# Original instruction: sb v984,0(v983)
sb $t2,0($t5)
# Original instruction: addi v981,v981,1
addi $t6,$t6,1
# Original instruction: j label_171_mem_copy_loop
j label_171_mem_copy_loop
label_172_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v985,$fp,-68
addiu $t2,$fp,-68
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v986,$sp,0
addi $t3,$sp,0
# 
# Loading from v985 from stack into v986
# Original instruction: li v987,4
li $t4,4
# Original instruction: li v988,0
li $t5,0
label_173_mem_copy_loop:
# Original instruction: beq v988,v987,label_174_mem_copy_end
beq $t5,$t4,label_174_mem_copy_end
# Original instruction: add v989,v985,v988
add $t0,$t2,$t5
# Original instruction: lb v991,0(v989)
lb $t6,0($t0)
# Original instruction: add v990,v986,v988
add $t0,$t3,$t5
# Original instruction: sb v991,0(v990)
sb $t6,0($t0)
# Original instruction: addi v988,v988,1
addi $t5,$t5,1
# Original instruction: j label_173_mem_copy_loop
j label_173_mem_copy_loop
label_174_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v992,$fp,-72
addiu $t5,$fp,-72
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v993,$sp,0
addi $t0,$sp,0
# 
# Loading from v992 from stack into v993
# Original instruction: li v994,4
li $t2,4
# Original instruction: li v995,0
li $t6,0
label_175_mem_copy_loop:
# Original instruction: beq v995,v994,label_176_mem_copy_end
beq $t6,$t2,label_176_mem_copy_end
# Original instruction: add v996,v992,v995
add $t3,$t5,$t6
# Original instruction: lb v998,0(v996)
lb $t4,0($t3)
# Original instruction: add v997,v993,v995
add $t3,$t0,$t6
# Original instruction: sb v998,0(v997)
sb $t4,0($t3)
# Original instruction: addi v995,v995,1
addi $t6,$t6,1
# Original instruction: j label_175_mem_copy_loop
j label_175_mem_copy_loop
label_176_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v999,$fp,-76
addiu $t0,$fp,-76
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1000,$sp,0
addi $t4,$sp,0
# 
# Loading from v999 from stack into v1000
# Original instruction: li v1001,4
li $t5,4
# Original instruction: li v1002,0
li $t6,0
label_177_mem_copy_loop:
# Original instruction: beq v1002,v1001,label_178_mem_copy_end
beq $t6,$t5,label_178_mem_copy_end
# Original instruction: add v1003,v999,v1002
add $t2,$t0,$t6
# Original instruction: lb v1005,0(v1003)
lb $t2,0($t2)
# Original instruction: add v1004,v1000,v1002
add $t3,$t4,$t6
# Original instruction: sb v1005,0(v1004)
sb $t2,0($t3)
# Original instruction: addi v1002,v1002,1
addi $t6,$t6,1
# Original instruction: j label_177_mem_copy_loop
j label_177_mem_copy_loop
label_178_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1006,$fp,-40
addiu $t2,$fp,-40
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1007,$sp,0
addi $t5,$sp,0
# 
# Loading from v1006 from stack into v1007
# Original instruction: li v1008,4
li $t6,4
# Original instruction: li v1009,0
li $t3,0
label_179_mem_copy_loop:
# Original instruction: beq v1009,v1008,label_180_mem_copy_end
beq $t3,$t6,label_180_mem_copy_end
# Original instruction: add v1010,v1006,v1009
add $t0,$t2,$t3
# Original instruction: lb v1012,0(v1010)
lb $t4,0($t0)
# Original instruction: add v1011,v1007,v1009
add $t0,$t5,$t3
# Original instruction: sb v1012,0(v1011)
sb $t4,0($t0)
# Original instruction: addi v1009,v1009,1
addi $t3,$t3,1
# Original instruction: j label_179_mem_copy_loop
j label_179_mem_copy_loop
label_180_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal complexComputation
jal complexComputation
# BACK FROM FUNCTION
# Original instruction: addi v1013,$sp,0
addi $t3,$sp,0
# Original instruction: addiu v1014,$fp,-108
addiu $t4,$fp,-108
# 
# Loading from v1013 from stack into v1014
# Original instruction: li v1015,4
li $t6,4
# Original instruction: li v1016,0
li $t2,0
label_181_mem_copy_loop:
# Original instruction: beq v1016,v1015,label_182_mem_copy_end
beq $t2,$t6,label_182_mem_copy_end
# Original instruction: add v1017,v1013,v1016
add $t0,$t3,$t2
# Original instruction: lb v1019,0(v1017)
lb $t5,0($t0)
# Original instruction: add v1018,v1014,v1016
add $t0,$t4,$t2
# Original instruction: sb v1019,0(v1018)
sb $t5,0($t0)
# Original instruction: addi v1016,v1016,1
addi $t2,$t2,1
# Original instruction: j label_181_mem_copy_loop
j label_181_mem_copy_loop
label_182_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR complexComputation
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1020,$fp,-56
addiu $t3,$fp,-56
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1021,$sp,0
addi $t0,$sp,0
# 
# Loading from v1020 from stack into v1021
# Original instruction: li v1022,4
li $t6,4
# Original instruction: li v1023,0
li $t2,0
label_183_mem_copy_loop:
# Original instruction: beq v1023,v1022,label_184_mem_copy_end
beq $t2,$t6,label_184_mem_copy_end
# Original instruction: add v1024,v1020,v1023
add $t4,$t3,$t2
# Original instruction: lb v1026,0(v1024)
lb $t5,0($t4)
# Original instruction: add v1025,v1021,v1023
add $t4,$t0,$t2
# Original instruction: sb v1026,0(v1025)
sb $t5,0($t4)
# Original instruction: addi v1023,v1023,1
addi $t2,$t2,1
# Original instruction: j label_183_mem_copy_loop
j label_183_mem_copy_loop
label_184_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1027,$fp,-60
addiu $t6,$fp,-60
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1028,$sp,0
addi $t5,$sp,0
# 
# Loading from v1027 from stack into v1028
# Original instruction: li v1029,4
li $t0,4
# Original instruction: li v1030,0
li $t3,0
label_185_mem_copy_loop:
# Original instruction: beq v1030,v1029,label_186_mem_copy_end
beq $t3,$t0,label_186_mem_copy_end
# Original instruction: add v1031,v1027,v1030
add $t2,$t6,$t3
# Original instruction: lb v1033,0(v1031)
lb $t2,0($t2)
# Original instruction: add v1032,v1028,v1030
add $t4,$t5,$t3
# Original instruction: sb v1033,0(v1032)
sb $t2,0($t4)
# Original instruction: addi v1030,v1030,1
addi $t3,$t3,1
# Original instruction: j label_185_mem_copy_loop
j label_185_mem_copy_loop
label_186_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1034,$fp,-64
addiu $t5,$fp,-64
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1035,$sp,0
addi $t0,$sp,0
# 
# Loading from v1034 from stack into v1035
# Original instruction: li v1036,4
li $t2,4
# Original instruction: li v1037,0
li $t3,0
label_187_mem_copy_loop:
# Original instruction: beq v1037,v1036,label_188_mem_copy_end
beq $t3,$t2,label_188_mem_copy_end
# Original instruction: add v1038,v1034,v1037
add $t4,$t5,$t3
# Original instruction: lb v1040,0(v1038)
lb $t4,0($t4)
# Original instruction: add v1039,v1035,v1037
add $t6,$t0,$t3
# Original instruction: sb v1040,0(v1039)
sb $t4,0($t6)
# Original instruction: addi v1037,v1037,1
addi $t3,$t3,1
# Original instruction: j label_187_mem_copy_loop
j label_187_mem_copy_loop
label_188_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1041,$fp,-68
addiu $t5,$fp,-68
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1042,$sp,0
addi $t0,$sp,0
# 
# Loading from v1041 from stack into v1042
# Original instruction: li v1043,4
li $t3,4
# Original instruction: li v1044,0
li $t2,0
label_189_mem_copy_loop:
# Original instruction: beq v1044,v1043,label_190_mem_copy_end
beq $t2,$t3,label_190_mem_copy_end
# Original instruction: add v1045,v1041,v1044
add $t4,$t5,$t2
# Original instruction: lb v1047,0(v1045)
lb $t4,0($t4)
# Original instruction: add v1046,v1042,v1044
add $t6,$t0,$t2
# Original instruction: sb v1047,0(v1046)
sb $t4,0($t6)
# Original instruction: addi v1044,v1044,1
addi $t2,$t2,1
# Original instruction: j label_189_mem_copy_loop
j label_189_mem_copy_loop
label_190_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1048,$fp,-72
addiu $t2,$fp,-72
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1049,$sp,0
addi $t4,$sp,0
# 
# Loading from v1048 from stack into v1049
# Original instruction: li v1050,4
li $t3,4
# Original instruction: li v1051,0
li $t5,0
label_191_mem_copy_loop:
# Original instruction: beq v1051,v1050,label_192_mem_copy_end
beq $t5,$t3,label_192_mem_copy_end
# Original instruction: add v1052,v1048,v1051
add $t0,$t2,$t5
# Original instruction: lb v1054,0(v1052)
lb $t6,0($t0)
# Original instruction: add v1053,v1049,v1051
add $t0,$t4,$t5
# Original instruction: sb v1054,0(v1053)
sb $t6,0($t0)
# Original instruction: addi v1051,v1051,1
addi $t5,$t5,1
# Original instruction: j label_191_mem_copy_loop
j label_191_mem_copy_loop
label_192_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1055,$fp,-76
addiu $t6,$fp,-76
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1056,$sp,0
addi $t0,$sp,0
# 
# Loading from v1055 from stack into v1056
# Original instruction: li v1057,4
li $t3,4
# Original instruction: li v1058,0
li $t5,0
label_193_mem_copy_loop:
# Original instruction: beq v1058,v1057,label_194_mem_copy_end
beq $t5,$t3,label_194_mem_copy_end
# Original instruction: add v1059,v1055,v1058
add $t2,$t6,$t5
# Original instruction: lb v1061,0(v1059)
lb $t2,0($t2)
# Original instruction: add v1060,v1056,v1058
add $t4,$t0,$t5
# Original instruction: sb v1061,0(v1060)
sb $t2,0($t4)
# Original instruction: addi v1058,v1058,1
addi $t5,$t5,1
# Original instruction: j label_193_mem_copy_loop
j label_193_mem_copy_loop
label_194_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1062,$fp,-40
addiu $t6,$fp,-40
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1063,$sp,0
addi $t3,$sp,0
# 
# Loading from v1062 from stack into v1063
# Original instruction: li v1064,4
li $t0,4
# Original instruction: li v1065,0
li $t5,0
label_195_mem_copy_loop:
# Original instruction: beq v1065,v1064,label_196_mem_copy_end
beq $t5,$t0,label_196_mem_copy_end
# Original instruction: add v1066,v1062,v1065
add $t2,$t6,$t5
# Original instruction: lb v1068,0(v1066)
lb $t4,0($t2)
# Original instruction: add v1067,v1063,v1065
add $t2,$t3,$t5
# Original instruction: sb v1068,0(v1067)
sb $t4,0($t2)
# Original instruction: addi v1065,v1065,1
addi $t5,$t5,1
# Original instruction: j label_195_mem_copy_loop
j label_195_mem_copy_loop
label_196_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1069,$fp,-44
addiu $t6,$fp,-44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1070,$sp,0
addi $t4,$sp,0
# 
# Loading from v1069 from stack into v1070
# Original instruction: li v1071,4
li $t3,4
# Original instruction: li v1072,0
li $t2,0
label_197_mem_copy_loop:
# Original instruction: beq v1072,v1071,label_198_mem_copy_end
beq $t2,$t3,label_198_mem_copy_end
# Original instruction: add v1073,v1069,v1072
add $t0,$t6,$t2
# Original instruction: lb v1075,0(v1073)
lb $t0,0($t0)
# Original instruction: add v1074,v1070,v1072
add $t5,$t4,$t2
# Original instruction: sb v1075,0(v1074)
sb $t0,0($t5)
# Original instruction: addi v1072,v1072,1
addi $t2,$t2,1
# Original instruction: j label_197_mem_copy_loop
j label_197_mem_copy_loop
label_198_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1076,$fp,-48
addiu $t0,$fp,-48
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1077,$sp,0
addi $t4,$sp,0
# 
# Loading from v1076 from stack into v1077
# Original instruction: li v1078,4
li $t3,4
# Original instruction: li v1079,0
li $t5,0
label_199_mem_copy_loop:
# Original instruction: beq v1079,v1078,label_200_mem_copy_end
beq $t5,$t3,label_200_mem_copy_end
# Original instruction: add v1080,v1076,v1079
add $t2,$t0,$t5
# Original instruction: lb v1082,0(v1080)
lb $t2,0($t2)
# Original instruction: add v1081,v1077,v1079
add $t6,$t4,$t5
# Original instruction: sb v1082,0(v1081)
sb $t2,0($t6)
# Original instruction: addi v1079,v1079,1
addi $t5,$t5,1
# Original instruction: j label_199_mem_copy_loop
j label_199_mem_copy_loop
label_200_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1083,$fp,-52
addiu $t4,$fp,-52
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1084,$sp,0
addi $t0,$sp,0
# 
# Loading from v1083 from stack into v1084
# Original instruction: li v1085,4
li $t6,4
# Original instruction: li v1086,0
li $t5,0
label_201_mem_copy_loop:
# Original instruction: beq v1086,v1085,label_202_mem_copy_end
beq $t5,$t6,label_202_mem_copy_end
# Original instruction: add v1087,v1083,v1086
add $t2,$t4,$t5
# Original instruction: lb v1089,0(v1087)
lb $t2,0($t2)
# Original instruction: add v1088,v1084,v1086
add $t3,$t0,$t5
# Original instruction: sb v1089,0(v1088)
sb $t2,0($t3)
# Original instruction: addi v1086,v1086,1
addi $t5,$t5,1
# Original instruction: j label_201_mem_copy_loop
j label_201_mem_copy_loop
label_202_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal complexComputation
jal complexComputation
# BACK FROM FUNCTION
# Original instruction: addi v1090,$sp,0
addi $t3,$sp,0
# Original instruction: addiu v1091,$fp,-112
addiu $t4,$fp,-112
# 
# Loading from v1090 from stack into v1091
# Original instruction: li v1092,4
li $t5,4
# Original instruction: li v1093,0
li $t6,0
label_203_mem_copy_loop:
# Original instruction: beq v1093,v1092,label_204_mem_copy_end
beq $t6,$t5,label_204_mem_copy_end
# Original instruction: add v1094,v1090,v1093
add $t0,$t3,$t6
# Original instruction: lb v1096,0(v1094)
lb $t2,0($t0)
# Original instruction: add v1095,v1091,v1093
add $t0,$t4,$t6
# Original instruction: sb v1096,0(v1095)
sb $t2,0($t0)
# Original instruction: addi v1093,v1093,1
addi $t6,$t6,1
# Original instruction: j label_203_mem_copy_loop
j label_203_mem_copy_loop
label_204_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR complexComputation
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1097,$fp,-76
addiu $t4,$fp,-76
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1098,$sp,0
addi $t5,$sp,0
# 
# Loading from v1097 from stack into v1098
# Original instruction: li v1099,4
li $t6,4
# Original instruction: li v1100,0
li $t2,0
label_205_mem_copy_loop:
# Original instruction: beq v1100,v1099,label_206_mem_copy_end
beq $t2,$t6,label_206_mem_copy_end
# Original instruction: add v1101,v1097,v1100
add $t0,$t4,$t2
# Original instruction: lb v1103,0(v1101)
lb $t0,0($t0)
# Original instruction: add v1102,v1098,v1100
add $t3,$t5,$t2
# Original instruction: sb v1103,0(v1102)
sb $t0,0($t3)
# Original instruction: addi v1100,v1100,1
addi $t2,$t2,1
# Original instruction: j label_205_mem_copy_loop
j label_205_mem_copy_loop
label_206_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1104,$fp,-72
addiu $t0,$fp,-72
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1105,$sp,0
addi $t5,$sp,0
# 
# Loading from v1104 from stack into v1105
# Original instruction: li v1106,4
li $t6,4
# Original instruction: li v1107,0
li $t3,0
label_207_mem_copy_loop:
# Original instruction: beq v1107,v1106,label_208_mem_copy_end
beq $t3,$t6,label_208_mem_copy_end
# Original instruction: add v1108,v1104,v1107
add $t2,$t0,$t3
# Original instruction: lb v1110,0(v1108)
lb $t4,0($t2)
# Original instruction: add v1109,v1105,v1107
add $t2,$t5,$t3
# Original instruction: sb v1110,0(v1109)
sb $t4,0($t2)
# Original instruction: addi v1107,v1107,1
addi $t3,$t3,1
# Original instruction: j label_207_mem_copy_loop
j label_207_mem_copy_loop
label_208_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1111,$fp,-68
addiu $t6,$fp,-68
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1112,$sp,0
addi $t2,$sp,0
# 
# Loading from v1111 from stack into v1112
# Original instruction: li v1113,4
li $t3,4
# Original instruction: li v1114,0
li $t0,0
label_209_mem_copy_loop:
# Original instruction: beq v1114,v1113,label_210_mem_copy_end
beq $t0,$t3,label_210_mem_copy_end
# Original instruction: add v1115,v1111,v1114
add $t4,$t6,$t0
# Original instruction: lb v1117,0(v1115)
lb $t5,0($t4)
# Original instruction: add v1116,v1112,v1114
add $t4,$t2,$t0
# Original instruction: sb v1117,0(v1116)
sb $t5,0($t4)
# Original instruction: addi v1114,v1114,1
addi $t0,$t0,1
# Original instruction: j label_209_mem_copy_loop
j label_209_mem_copy_loop
label_210_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1118,$fp,-64
addiu $t2,$fp,-64
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1119,$sp,0
addi $t3,$sp,0
# 
# Loading from v1118 from stack into v1119
# Original instruction: li v1120,4
li $t6,4
# Original instruction: li v1121,0
li $t4,0
label_211_mem_copy_loop:
# Original instruction: beq v1121,v1120,label_212_mem_copy_end
beq $t4,$t6,label_212_mem_copy_end
# Original instruction: add v1122,v1118,v1121
add $t0,$t2,$t4
# Original instruction: lb v1124,0(v1122)
lb $t5,0($t0)
# Original instruction: add v1123,v1119,v1121
add $t0,$t3,$t4
# Original instruction: sb v1124,0(v1123)
sb $t5,0($t0)
# Original instruction: addi v1121,v1121,1
addi $t4,$t4,1
# Original instruction: j label_211_mem_copy_loop
j label_211_mem_copy_loop
label_212_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1125,$fp,-60
addiu $t5,$fp,-60
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1126,$sp,0
addi $t6,$sp,0
# 
# Loading from v1125 from stack into v1126
# Original instruction: li v1127,4
li $t4,4
# Original instruction: li v1128,0
li $t3,0
label_213_mem_copy_loop:
# Original instruction: beq v1128,v1127,label_214_mem_copy_end
beq $t3,$t4,label_214_mem_copy_end
# Original instruction: add v1129,v1125,v1128
add $t0,$t5,$t3
# Original instruction: lb v1131,0(v1129)
lb $t0,0($t0)
# Original instruction: add v1130,v1126,v1128
add $t2,$t6,$t3
# Original instruction: sb v1131,0(v1130)
sb $t0,0($t2)
# Original instruction: addi v1128,v1128,1
addi $t3,$t3,1
# Original instruction: j label_213_mem_copy_loop
j label_213_mem_copy_loop
label_214_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1132,$fp,-56
addiu $t3,$fp,-56
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1133,$sp,0
addi $t0,$sp,0
# 
# Loading from v1132 from stack into v1133
# Original instruction: li v1134,4
li $t4,4
# Original instruction: li v1135,0
li $t6,0
label_215_mem_copy_loop:
# Original instruction: beq v1135,v1134,label_216_mem_copy_end
beq $t6,$t4,label_216_mem_copy_end
# Original instruction: add v1136,v1132,v1135
add $t2,$t3,$t6
# Original instruction: lb v1138,0(v1136)
lb $t2,0($t2)
# Original instruction: add v1137,v1133,v1135
add $t5,$t0,$t6
# Original instruction: sb v1138,0(v1137)
sb $t2,0($t5)
# Original instruction: addi v1135,v1135,1
addi $t6,$t6,1
# Original instruction: j label_215_mem_copy_loop
j label_215_mem_copy_loop
label_216_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1139,$fp,-52
addiu $t2,$fp,-52
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1140,$sp,0
addi $t6,$sp,0
# 
# Loading from v1139 from stack into v1140
# Original instruction: li v1141,4
li $t5,4
# Original instruction: li v1142,0
li $t4,0
label_217_mem_copy_loop:
# Original instruction: beq v1142,v1141,label_218_mem_copy_end
beq $t4,$t5,label_218_mem_copy_end
# Original instruction: add v1143,v1139,v1142
add $t0,$t2,$t4
# Original instruction: lb v1145,0(v1143)
lb $t3,0($t0)
# Original instruction: add v1144,v1140,v1142
add $t0,$t6,$t4
# Original instruction: sb v1145,0(v1144)
sb $t3,0($t0)
# Original instruction: addi v1142,v1142,1
addi $t4,$t4,1
# Original instruction: j label_217_mem_copy_loop
j label_217_mem_copy_loop
label_218_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1146,$fp,-48
addiu $t2,$fp,-48
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1147,$sp,0
addi $t5,$sp,0
# 
# Loading from v1146 from stack into v1147
# Original instruction: li v1148,4
li $t0,4
# Original instruction: li v1149,0
li $t4,0
label_219_mem_copy_loop:
# Original instruction: beq v1149,v1148,label_220_mem_copy_end
beq $t4,$t0,label_220_mem_copy_end
# Original instruction: add v1150,v1146,v1149
add $t3,$t2,$t4
# Original instruction: lb v1152,0(v1150)
lb $t3,0($t3)
# Original instruction: add v1151,v1147,v1149
add $t6,$t5,$t4
# Original instruction: sb v1152,0(v1151)
sb $t3,0($t6)
# Original instruction: addi v1149,v1149,1
addi $t4,$t4,1
# Original instruction: j label_219_mem_copy_loop
j label_219_mem_copy_loop
label_220_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1153,$fp,-44
addiu $t2,$fp,-44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1154,$sp,0
addi $t5,$sp,0
# 
# Loading from v1153 from stack into v1154
# Original instruction: li v1155,4
li $t0,4
# Original instruction: li v1156,0
li $t4,0
label_221_mem_copy_loop:
# Original instruction: beq v1156,v1155,label_222_mem_copy_end
beq $t4,$t0,label_222_mem_copy_end
# Original instruction: add v1157,v1153,v1156
add $t3,$t2,$t4
# Original instruction: lb v1159,0(v1157)
lb $t3,0($t3)
# Original instruction: add v1158,v1154,v1156
add $t6,$t5,$t4
# Original instruction: sb v1159,0(v1158)
sb $t3,0($t6)
# Original instruction: addi v1156,v1156,1
addi $t4,$t4,1
# Original instruction: j label_221_mem_copy_loop
j label_221_mem_copy_loop
label_222_mem_copy_end:
# 
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1160,$fp,-40
addiu $t4,$fp,-40
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1161,$sp,0
addi $t6,$sp,0
# 
# Loading from v1160 from stack into v1161
# Original instruction: li v1162,4
li $t3,4
# Original instruction: li v1163,0
li $t0,0
label_223_mem_copy_loop:
# Original instruction: beq v1163,v1162,label_224_mem_copy_end
beq $t0,$t3,label_224_mem_copy_end
# Original instruction: add v1164,v1160,v1163
add $t2,$t4,$t0
# Original instruction: lb v1166,0(v1164)
lb $t5,0($t2)
# Original instruction: add v1165,v1161,v1163
add $t2,$t6,$t0
# Original instruction: sb v1166,0(v1165)
sb $t5,0($t2)
# Original instruction: addi v1163,v1163,1
addi $t0,$t0,1
# Original instruction: j label_223_mem_copy_loop
j label_223_mem_copy_loop
label_224_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal complexComputation
jal complexComputation
# BACK FROM FUNCTION
# Original instruction: addi v1167,$sp,0
addi $t3,$sp,0
# Original instruction: addiu v1168,$fp,-116
addiu $t5,$fp,-116
# 
# Loading from v1167 from stack into v1168
# Original instruction: li v1169,4
li $t0,4
# Original instruction: li v1170,0
li $t6,0
label_225_mem_copy_loop:
# Original instruction: beq v1170,v1169,label_226_mem_copy_end
beq $t6,$t0,label_226_mem_copy_end
# Original instruction: add v1171,v1167,v1170
add $t2,$t3,$t6
# Original instruction: lb v1173,0(v1171)
lb $t2,0($t2)
# Original instruction: add v1172,v1168,v1170
add $t4,$t5,$t6
# Original instruction: sb v1173,0(v1172)
sb $t2,0($t4)
# Original instruction: addi v1170,v1170,1
addi $t6,$t6,1
# Original instruction: j label_225_mem_copy_loop
j label_225_mem_copy_loop
label_226_mem_copy_end:
# 
# Original instruction: addiu v1174,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v1175,0(v1174)
lw $t0,0($t0)
# Original instruction: addiu v1176,$fp,-104
addiu $t2,$fp,-104
# Original instruction: lw v1177,0(v1176)
lw $t2,0($t2)
# Original instruction: add v1178,v1175,v1177
add $t2,$t0,$t2
# Original instruction: addiu v1179,$fp,-108
addiu $t0,$fp,-108
# Original instruction: lw v1180,0(v1179)
lw $t0,0($t0)
# Original instruction: add v1181,v1178,v1180
add $t2,$t2,$t0
# Original instruction: addiu v1182,$fp,-112
addiu $t0,$fp,-112
# Original instruction: lw v1183,0(v1182)
lw $t0,0($t0)
# Original instruction: add v1184,v1181,v1183
add $t0,$t2,$t0
# Original instruction: addiu v1185,$fp,-116
addiu $t2,$fp,-116
# Original instruction: lw v1186,0(v1185)
lw $t2,0($t2)
# Original instruction: add v1187,v1184,v1186
add $t2,$t0,$t2
# Original instruction: addiu v1188,$fp,-12
addiu $t0,$fp,-12
# Loading from v1187 from reg into v1188
# Original instruction: sw v1187,0(v1188)
sw $t2,0($t0)
# Original instruction: addi v1189,$zero,1
addi $t0,$zero,1
# Original instruction: addiu v1190,$fp,-16
addiu $t2,$fp,-16
# Loading from v1189 from reg into v1190
# Original instruction: sw v1189,0(v1190)
sw $t0,0($t2)
label_227_while_start:
# Original instruction: addiu v1191,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1192,0(v1191)
lw $t0,0($t0)
# Original instruction: addi v1193,$zero,3
addi $t2,$zero,3
# Original instruction: slt v1195,v1193,v1192
slt $t2,$t2,$t0
# Original instruction: addi v1196,$zero,1
addi $t0,$zero,1
# Original instruction: sub v1194,v1196,v1195
sub $t0,$t0,$t2
# Original instruction: beqz v1194,label_228_while_end
beqz $t0,label_228_while_end
# Original instruction: addi v1197,$zero,1
addi $t0,$zero,1
# Original instruction: addiu v1198,$fp,-20
addiu $t2,$fp,-20
# Loading from v1197 from reg into v1198
# Original instruction: sw v1197,0(v1198)
sw $t0,0($t2)
label_229_while_start:
# Original instruction: addiu v1199,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v1200,0(v1199)
lw $t0,0($t0)
# Original instruction: addi v1201,$zero,3
addi $t2,$zero,3
# Original instruction: slt v1203,v1201,v1200
slt $t0,$t2,$t0
# Original instruction: addi v1204,$zero,1
addi $t2,$zero,1
# Original instruction: sub v1202,v1204,v1203
sub $t0,$t2,$t0
# Original instruction: beqz v1202,label_230_while_end
beqz $t0,label_230_while_end
# Original instruction: addi v1205,$zero,1
addi $t2,$zero,1
# Original instruction: addiu v1206,$fp,-24
addiu $t0,$fp,-24
# Loading from v1205 from reg into v1206
# Original instruction: sw v1205,0(v1206)
sw $t2,0($t0)
label_231_while_start:
# Original instruction: addiu v1207,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v1208,0(v1207)
lw $t2,0($t0)
# Original instruction: addi v1209,$zero,3
addi $t0,$zero,3
# Original instruction: slt v1211,v1209,v1208
slt $t2,$t0,$t2
# Original instruction: addi v1212,$zero,1
addi $t0,$zero,1
# Original instruction: sub v1210,v1212,v1211
sub $t0,$t0,$t2
# Original instruction: beqz v1210,label_232_while_end
beqz $t0,label_232_while_end
# BEGIN FUNCALL EXPR FOR stressFibonacci
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1213,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1214,0(v1213)
lw $t2,0($t0)
# Original instruction: addiu v1215,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v1216,0(v1215)
lw $t0,0($t0)
# Original instruction: add v1217,v1214,v1216
add $t0,$t2,$t0
# Original instruction: addiu v1218,$fp,-24
addiu $t2,$fp,-24
# Original instruction: lw v1219,0(v1218)
lw $t2,0($t2)
# Original instruction: add v1220,v1217,v1219
add $t2,$t0,$t2
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1221,$sp,0
addi $t0,$sp,0
# Loading from v1220 from reg into v1221
# Original instruction: sw v1220,0(v1221)
sw $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal stressFibonacci
jal stressFibonacci
# BACK FROM FUNCTION
# Original instruction: addi v1222,$sp,0
addi $t3,$sp,0
# Original instruction: addiu v1223,$fp,-28
addiu $t0,$fp,-28
# 
# Loading from v1222 from stack into v1223
# Original instruction: li v1224,4
li $t5,4
# Original instruction: li v1225,0
li $t4,0
label_233_mem_copy_loop:
# Original instruction: beq v1225,v1224,label_234_mem_copy_end
beq $t4,$t5,label_234_mem_copy_end
# Original instruction: add v1226,v1222,v1225
add $t2,$t3,$t4
# Original instruction: lb v1228,0(v1226)
lb $t2,0($t2)
# Original instruction: add v1227,v1223,v1225
add $t6,$t0,$t4
# Original instruction: sb v1228,0(v1227)
sb $t2,0($t6)
# Original instruction: addi v1225,v1225,1
addi $t4,$t4,1
# Original instruction: j label_233_mem_copy_loop
j label_233_mem_copy_loop
label_234_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR stressFibonacci
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1229,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1230,0(v1229)
lw $t2,0($t0)
# Original instruction: addiu v1231,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v1232,0(v1231)
lw $t0,0($t0)
# Original instruction: mul v1233,v1230,v1232
mul $t0,$t2,$t0
# Original instruction: addiu v1234,$fp,-24
addiu $t2,$fp,-24
# Original instruction: lw v1235,0(v1234)
lw $t2,0($t2)
# Original instruction: mul v1236,v1233,v1235
mul $t0,$t0,$t2
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1237,$sp,0
addi $t2,$sp,0
# Loading from v1236 from reg into v1237
# Original instruction: sw v1236,0(v1237)
sw $t0,0($t2)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal stressFibonacci
jal stressFibonacci
# BACK FROM FUNCTION
# Original instruction: addi v1238,$sp,0
addi $t0,$sp,0
# Original instruction: addiu v1239,$fp,-32
addiu $t2,$fp,-32
# 
# Loading from v1238 from stack into v1239
# Original instruction: li v1240,4
li $t3,4
# Original instruction: li v1241,0
li $t5,0
label_235_mem_copy_loop:
# Original instruction: beq v1241,v1240,label_236_mem_copy_end
beq $t5,$t3,label_236_mem_copy_end
# Original instruction: add v1242,v1238,v1241
add $t4,$t0,$t5
# Original instruction: lb v1244,0(v1242)
lb $t4,0($t4)
# Original instruction: add v1243,v1239,v1241
add $t6,$t2,$t5
# Original instruction: sb v1244,0(v1243)
sb $t4,0($t6)
# Original instruction: addi v1241,v1241,1
addi $t5,$t5,1
# Original instruction: j label_235_mem_copy_loop
j label_235_mem_copy_loop
label_236_mem_copy_end:
# 
# Original instruction: addiu v1245,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v1246,0(v1245)
lw $t0,0($t0)
# Original instruction: addiu v1247,$fp,-28
addiu $t2,$fp,-28
# Original instruction: lw v1248,0(v1247)
lw $t2,0($t2)
# Original instruction: add v1249,v1246,v1248
add $t2,$t0,$t2
# Original instruction: addiu v1250,$fp,-32
addiu $t0,$fp,-32
# Original instruction: lw v1251,0(v1250)
lw $t0,0($t0)
# Original instruction: add v1252,v1249,v1251
add $t2,$t2,$t0
# Original instruction: addiu v1253,$fp,-12
addiu $t0,$fp,-12
# Loading from v1252 from reg into v1253
# Original instruction: sw v1252,0(v1253)
sw $t2,0($t0)
# Original instruction: addiu v1254,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v1255,0(v1254)
lw $t0,0($t0)
# Original instruction: addi v1256,$zero,1
addi $t2,$zero,1
# Original instruction: add v1257,v1255,v1256
add $t2,$t0,$t2
# Original instruction: addiu v1258,$fp,-24
addiu $t0,$fp,-24
# Loading from v1257 from reg into v1258
# Original instruction: sw v1257,0(v1258)
sw $t2,0($t0)
# Original instruction: j label_231_while_start
j label_231_while_start
label_232_while_end:
# Original instruction: addiu v1259,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v1260,0(v1259)
lw $t2,0($t0)
# Original instruction: addi v1261,$zero,1
addi $t0,$zero,1
# Original instruction: add v1262,v1260,v1261
add $t0,$t2,$t0
# Original instruction: addiu v1263,$fp,-20
addiu $t2,$fp,-20
# Loading from v1262 from reg into v1263
# Original instruction: sw v1262,0(v1263)
sw $t0,0($t2)
# Original instruction: j label_229_while_start
j label_229_while_start
label_230_while_end:
# Original instruction: addiu v1264,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1265,0(v1264)
lw $t0,0($t0)
# Original instruction: addi v1266,$zero,1
addi $t2,$zero,1
# Original instruction: add v1267,v1265,v1266
add $t0,$t0,$t2
# Original instruction: addiu v1268,$fp,-16
addiu $t2,$fp,-16
# Loading from v1267 from reg into v1268
# Original instruction: sw v1267,0(v1268)
sw $t0,0($t2)
# Original instruction: j label_227_while_start
j label_227_while_start
label_228_while_end:
# BEGIN FUNCALL EXPR FOR createTree
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v1269,$zero,3
addi $t0,$zero,3
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1270,$sp,0
addi $t2,$sp,0
# Loading from v1269 from reg into v1270
# Original instruction: sw v1269,0(v1270)
sw $t0,0($t2)
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v1271,$zero,1
addi $t0,$zero,1
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1272,$sp,0
addi $t2,$sp,0
# Loading from v1271 from reg into v1272
# Original instruction: sw v1271,0(v1272)
sw $t0,0($t2)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal createTree
jal createTree
# BACK FROM FUNCTION
# Original instruction: addi v1273,$sp,0
addi $t5,$sp,0
# Original instruction: addiu v1274,$fp,-256
addiu $t3,$fp,-256
# 
# Loading from v1273 from stack into v1274
# Original instruction: li v1275,4
li $t4,4
# Original instruction: li v1276,0
li $t0,0
label_237_mem_copy_loop:
# Original instruction: beq v1276,v1275,label_238_mem_copy_end
beq $t0,$t4,label_238_mem_copy_end
# Original instruction: add v1277,v1273,v1276
add $t2,$t5,$t0
# Original instruction: lb v1279,0(v1277)
lb $t2,0($t2)
# Original instruction: add v1278,v1274,v1276
add $t6,$t3,$t0
# Original instruction: sb v1279,0(v1278)
sb $t2,0($t6)
# Original instruction: addi v1276,v1276,1
addi $t0,$t0,1
# Original instruction: j label_237_mem_copy_loop
j label_237_mem_copy_loop
label_238_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR sumTree
# LOADING ARG: Pointer of ast.StructType@51399530
# GETTING  VALUE
# Original instruction: addiu v1280,$fp,-256
addiu $t3,$fp,-256
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1281,$sp,0
addi $t5,$sp,0
# 
# Loading from v1280 from stack into v1281
# Original instruction: li v1282,4
li $t4,4
# Original instruction: li v1283,0
li $t0,0
label_239_mem_copy_loop:
# Original instruction: beq v1283,v1282,label_240_mem_copy_end
beq $t0,$t4,label_240_mem_copy_end
# Original instruction: add v1284,v1280,v1283
add $t2,$t3,$t0
# Original instruction: lb v1286,0(v1284)
lb $t6,0($t2)
# Original instruction: add v1285,v1281,v1283
add $t2,$t5,$t0
# Original instruction: sb v1286,0(v1285)
sb $t6,0($t2)
# Original instruction: addi v1283,v1283,1
addi $t0,$t0,1
# Original instruction: j label_239_mem_copy_loop
j label_239_mem_copy_loop
label_240_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal sumTree
jal sumTree
# BACK FROM FUNCTION
# Original instruction: addi v1287,$sp,0
addi $t4,$sp,0
# Original instruction: addiu v1288,$fp,-260
addiu $t3,$fp,-260
# 
# Loading from v1287 from stack into v1288
# Original instruction: li v1289,4
li $t6,4
# Original instruction: li v1290,0
li $t5,0
label_241_mem_copy_loop:
# Original instruction: beq v1290,v1289,label_242_mem_copy_end
beq $t5,$t6,label_242_mem_copy_end
# Original instruction: add v1291,v1287,v1290
add $t0,$t4,$t5
# Original instruction: lb v1293,0(v1291)
lb $t0,0($t0)
# Original instruction: add v1292,v1288,v1290
add $t2,$t3,$t5
# Original instruction: sb v1293,0(v1292)
sb $t0,0($t2)
# Original instruction: addi v1290,v1290,1
addi $t5,$t5,1
# Original instruction: j label_241_mem_copy_loop
j label_241_mem_copy_loop
label_242_mem_copy_end:
# 
# Original instruction: addiu v1294,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v1295,0(v1294)
lw $t0,0($t0)
# Original instruction: addiu v1296,$fp,-260
addiu $t2,$fp,-260
# Original instruction: lw v1297,0(v1296)
lw $t2,0($t2)
# Original instruction: add v1298,v1295,v1297
add $t2,$t0,$t2
# Original instruction: addiu v1299,$fp,-12
addiu $t0,$fp,-12
# Loading from v1298 from reg into v1299
# Original instruction: sw v1298,0(v1299)
sw $t2,0($t0)
# BEGIN FUNCALL EXPR FOR mcmalloc
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v1300,$zero,10
addi $t2,$zero,10
# Original instruction: addi v1301,$zero,4
addi $t0,$zero,4
# Original instruction: mul v1302,v1300,v1301
mul $t2,$t2,$t0
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1303,$sp,0
addi $t0,$sp,0
# Loading from v1302 from reg into v1303
# Original instruction: sw v1302,0(v1303)
sw $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal mcmalloc
jal mcmalloc
# BACK FROM FUNCTION
# Original instruction: addi v1304,$sp,0
addi $t0,$sp,0
# Original instruction: lw v1305,0(v1304)
lw $t0,0($t0)
# Original instruction: addiu v1306,$fp,-264
addiu $t2,$fp,-264
# Loading from v1305 from reg into v1306
# Original instruction: sw v1305,0(v1306)
sw $t0,0($t2)
# Original instruction: addi v1307,$zero,0
addi $t2,$zero,0
# Original instruction: addiu v1308,$fp,-16
addiu $t0,$fp,-16
# Loading from v1307 from reg into v1308
# Original instruction: sw v1307,0(v1308)
sw $t2,0($t0)
label_243_while_start:
# Original instruction: addiu v1309,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1310,0(v1309)
lw $t0,0($t0)
# Original instruction: addi v1311,$zero,10
addi $t2,$zero,10
# Original instruction: slt v1312,v1310,v1311
slt $t0,$t0,$t2
# Original instruction: beqz v1312,label_244_while_end
beqz $t0,label_244_while_end
# Original instruction: addiu v1313,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1314,0(v1313)
lw $t0,0($t0)
# Original instruction: addiu v1315,$fp,-16
addiu $t2,$fp,-16
# Original instruction: lw v1316,0(v1315)
lw $t2,0($t2)
# Original instruction: mul v1317,v1314,v1316
mul $t2,$t0,$t2
# Original instruction: addiu v1318,$fp,-264
addiu $t0,$fp,-264
# Original instruction: lw v1318,0(v1318)
lw $t0,0($t0)
# Original instruction: addiu v1319,$fp,-16
addiu $t3,$fp,-16
# Original instruction: lw v1320,0(v1319)
lw $t3,0($t3)
# Original instruction: li v1323,4
li $t4,4
# Original instruction: mul v1322,v1320,v1323
mul $t3,$t3,$t4
# Original instruction: add v1321,v1318,v1322
add $t0,$t0,$t3
# Loading from v1317 from reg into v1321
# Original instruction: sw v1317,0(v1321)
sw $t2,0($t0)
# Original instruction: addiu v1324,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1325,0(v1324)
lw $t2,0($t0)
# Original instruction: addi v1326,$zero,1
addi $t0,$zero,1
# Original instruction: add v1327,v1325,v1326
add $t0,$t2,$t0
# Original instruction: addiu v1328,$fp,-16
addiu $t2,$fp,-16
# Loading from v1327 from reg into v1328
# Original instruction: sw v1327,0(v1328)
sw $t0,0($t2)
# Original instruction: j label_243_while_start
j label_243_while_start
label_244_while_end:
# Original instruction: addi v1329,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v1330,$fp,-268
addiu $t2,$fp,-268
# Loading from v1329 from reg into v1330
# Original instruction: sw v1329,0(v1330)
sw $t0,0($t2)
# Original instruction: addi v1331,$zero,0
addi $t2,$zero,0
# Original instruction: addiu v1332,$fp,-16
addiu $t0,$fp,-16
# Loading from v1331 from reg into v1332
# Original instruction: sw v1331,0(v1332)
sw $t2,0($t0)
label_245_while_start:
# Original instruction: addiu v1333,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1334,0(v1333)
lw $t0,0($t0)
# Original instruction: addi v1335,$zero,10
addi $t2,$zero,10
# Original instruction: slt v1336,v1334,v1335
slt $t0,$t0,$t2
# Original instruction: beqz v1336,label_246_while_end
beqz $t0,label_246_while_end
# Original instruction: addiu v1337,$fp,-268
addiu $t0,$fp,-268
# Original instruction: lw v1338,0(v1337)
lw $t2,0($t0)
# Original instruction: addiu v1339,$fp,-264
addiu $t4,$fp,-264
# Original instruction: lw v1339,0(v1339)
lw $t4,0($t4)
# Original instruction: addiu v1340,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1341,0(v1340)
lw $t3,0($t0)
# Original instruction: li v1344,4
li $t0,4
# Original instruction: mul v1343,v1341,v1344
mul $t0,$t3,$t0
# Original instruction: add v1342,v1339,v1343
add $t0,$t4,$t0
# Original instruction: lw v1345,0(v1342)
lw $t0,0($t0)
# Original instruction: add v1346,v1338,v1345
add $t2,$t2,$t0
# Original instruction: addiu v1347,$fp,-268
addiu $t0,$fp,-268
# Loading from v1346 from reg into v1347
# Original instruction: sw v1346,0(v1347)
sw $t2,0($t0)
# Original instruction: addiu v1348,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1349,0(v1348)
lw $t2,0($t0)
# Original instruction: addi v1350,$zero,1
addi $t0,$zero,1
# Original instruction: add v1351,v1349,v1350
add $t2,$t2,$t0
# Original instruction: addiu v1352,$fp,-16
addiu $t0,$fp,-16
# Loading from v1351 from reg into v1352
# Original instruction: sw v1351,0(v1352)
sw $t2,0($t0)
# Original instruction: j label_245_while_start
j label_245_while_start
label_246_while_end:
# Original instruction: addiu v1353,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v1354,0(v1353)
lw $t2,0($t0)
# Original instruction: addiu v1355,$fp,-268
addiu $t0,$fp,-268
# Original instruction: lw v1356,0(v1355)
lw $t0,0($t0)
# Original instruction: add v1357,v1354,v1356
add $t0,$t2,$t0
# Original instruction: addiu v1358,$fp,-12
addiu $t2,$fp,-12
# Loading from v1357 from reg into v1358
# Original instruction: sw v1357,0(v1358)
sw $t0,0($t2)
# Original instruction: addi v1359,$zero,0
addi $t2,$zero,0
# Original instruction: addiu v1360,$fp,-16
addiu $t0,$fp,-16
# Loading from v1359 from reg into v1360
# Original instruction: sw v1359,0(v1360)
sw $t2,0($t0)
label_247_while_start:
# Original instruction: addiu v1361,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1362,0(v1361)
lw $t0,0($t0)
# Original instruction: addi v1363,$zero,3
addi $t2,$zero,3
# Original instruction: slt v1364,v1362,v1363
slt $t0,$t0,$t2
# Original instruction: beqz v1364,label_248_while_end
beqz $t0,label_248_while_end
# Original instruction: addi v1365,$zero,0
addi $t2,$zero,0
# Original instruction: addiu v1366,$fp,-20
addiu $t0,$fp,-20
# Loading from v1365 from reg into v1366
# Original instruction: sw v1365,0(v1366)
sw $t2,0($t0)
label_249_while_start:
# Original instruction: addiu v1367,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v1368,0(v1367)
lw $t2,0($t0)
# Original instruction: addi v1369,$zero,3
addi $t0,$zero,3
# Original instruction: slt v1370,v1368,v1369
slt $t0,$t2,$t0
# Original instruction: beqz v1370,label_250_while_end
beqz $t0,label_250_while_end
# Original instruction: addiu v1371,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1372,0(v1371)
lw $t2,0($t0)
# Original instruction: addiu v1373,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v1374,0(v1373)
lw $t0,0($t0)
# Original instruction: add v1375,v1372,v1374
add $t3,$t2,$t0
# Original instruction: addiu v1376,$fp,-252
addiu $t0,$fp,-252
# Original instruction: addiu v1377,v1376,0
addiu $t2,$t0,0
# Original instruction: addiu v1378,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1379,0(v1378)
lw $t4,0($t0)
# Original instruction: li v1382,12
li $t0,12
# Original instruction: mul v1381,v1379,v1382
mul $t0,$t4,$t0
# Original instruction: add v1380,v1377,v1381
add $t2,$t2,$t0
# Original instruction: addiu v1383,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v1384,0(v1383)
lw $t0,0($t0)
# Original instruction: li v1387,4
li $t4,4
# Original instruction: mul v1386,v1384,v1387
mul $t0,$t0,$t4
# Original instruction: add v1385,v1380,v1386
add $t0,$t2,$t0
# Loading from v1375 from reg into v1385
# Original instruction: sw v1375,0(v1385)
sw $t3,0($t0)
# Original instruction: addiu v1388,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v1389,0(v1388)
lw $t0,0($t0)
# Original instruction: addi v1390,$zero,1
addi $t2,$zero,1
# Original instruction: add v1391,v1389,v1390
add $t2,$t0,$t2
# Original instruction: addiu v1392,$fp,-20
addiu $t0,$fp,-20
# Loading from v1391 from reg into v1392
# Original instruction: sw v1391,0(v1392)
sw $t2,0($t0)
# Original instruction: j label_249_while_start
j label_249_while_start
label_250_while_end:
# BEGIN FUNCALL EXPR FOR createLinkedList
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1393,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1394,0(v1393)
lw $t2,0($t0)
# Original instruction: addi v1395,$zero,3
addi $t0,$zero,3
# Original instruction: add v1396,v1394,v1395
add $t2,$t2,$t0
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1397,$sp,0
addi $t0,$sp,0
# Loading from v1396 from reg into v1397
# Original instruction: sw v1396,0(v1397)
sw $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal createLinkedList
jal createLinkedList
# BACK FROM FUNCTION
# Original instruction: addi v1398,$sp,0
addi $t5,$sp,0
# Original instruction: addiu v1399,$fp,-252
addiu $t0,$fp,-252
# Original instruction: addiu v1400,v1399,40
addiu $t2,$t0,40
# Original instruction: addiu v1401,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1402,0(v1401)
lw $t0,0($t0)
# Original instruction: li v1405,4
li $t3,4
# Original instruction: mul v1404,v1402,v1405
mul $t0,$t0,$t3
# Original instruction: add v1403,v1400,v1404
add $t0,$t2,$t0
# 
# Loading from v1398 from stack into v1403
# Original instruction: li v1406,4
li $t2,4
# Original instruction: li v1407,0
li $t6,0
label_251_mem_copy_loop:
# Original instruction: beq v1407,v1406,label_252_mem_copy_end
beq $t6,$t2,label_252_mem_copy_end
# Original instruction: add v1408,v1398,v1407
add $t3,$t5,$t6
# Original instruction: lb v1410,0(v1408)
lb $t3,0($t3)
# Original instruction: add v1409,v1403,v1407
add $t4,$t0,$t6
# Original instruction: sb v1410,0(v1409)
sb $t3,0($t4)
# Original instruction: addi v1407,v1407,1
addi $t6,$t6,1
# Original instruction: j label_251_mem_copy_loop
j label_251_mem_copy_loop
label_252_mem_copy_end:
# 
# Original instruction: addiu v1411,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1412,0(v1411)
lw $t2,0($t0)
# Original instruction: addi v1413,$zero,1
addi $t0,$zero,1
# Original instruction: add v1414,v1412,v1413
add $t2,$t2,$t0
# Original instruction: addiu v1415,$fp,-16
addiu $t0,$fp,-16
# Loading from v1414 from reg into v1415
# Original instruction: sw v1414,0(v1415)
sw $t2,0($t0)
# Original instruction: j label_247_while_start
j label_247_while_start
label_248_while_end:
# BEGIN FUNCALL EXPR FOR calculateDeterminant
# LOADING ARG: Array of Array of INT
# GETTING  VALUE
# Original instruction: addiu v1416,$fp,-252
addiu $t0,$fp,-252
# Original instruction: addiu v1417,v1416,0
addiu $t2,$t0,0
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1418,$sp,0
addi $t0,$sp,0
# Loading from v1417 from reg into v1418
# Original instruction: sw v1417,0(v1418)
sw $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal calculateDeterminant
jal calculateDeterminant
# BACK FROM FUNCTION
# Original instruction: addi v1419,$sp,0
addi $t3,$sp,0
# Original instruction: addiu v1420,$fp,-252
addiu $t0,$fp,-252
# Original instruction: addiu v1421,v1420,36
addiu $t5,$t0,36
# 
# Loading from v1419 from stack into v1421
# Original instruction: li v1422,4
li $t4,4
# Original instruction: li v1423,0
li $t0,0
label_253_mem_copy_loop:
# Original instruction: beq v1423,v1422,label_254_mem_copy_end
beq $t0,$t4,label_254_mem_copy_end
# Original instruction: add v1424,v1419,v1423
add $t2,$t3,$t0
# Original instruction: lb v1426,0(v1424)
lb $t2,0($t2)
# Original instruction: add v1425,v1421,v1423
add $t6,$t5,$t0
# Original instruction: sb v1426,0(v1425)
sb $t2,0($t6)
# Original instruction: addi v1423,v1423,1
addi $t0,$t0,1
# Original instruction: j label_253_mem_copy_loop
j label_253_mem_copy_loop
label_254_mem_copy_end:
# 
# Original instruction: addiu v1427,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v1428,0(v1427)
lw $t2,0($t0)
# Original instruction: addiu v1429,$fp,-252
addiu $t0,$fp,-252
# Original instruction: addiu v1430,v1429,36
addiu $t0,$t0,36
# Original instruction: lw v1431,0(v1430)
lw $t0,0($t0)
# Original instruction: add v1432,v1428,v1431
add $t2,$t2,$t0
# Original instruction: addiu v1433,$fp,-12
addiu $t0,$fp,-12
# Loading from v1432 from reg into v1433
# Original instruction: sw v1432,0(v1433)
sw $t2,0($t0)
# Original instruction: addi v1434,$zero,0
addi $t2,$zero,0
# Original instruction: addiu v1435,$fp,-16
addiu $t0,$fp,-16
# Loading from v1434 from reg into v1435
# Original instruction: sw v1434,0(v1435)
sw $t2,0($t0)
label_255_while_start:
# Original instruction: addiu v1436,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1437,0(v1436)
lw $t2,0($t0)
# Original instruction: addi v1438,$zero,3
addi $t0,$zero,3
# Original instruction: slt v1439,v1437,v1438
slt $t0,$t2,$t0
# Original instruction: beqz v1439,label_256_while_end
beqz $t0,label_256_while_end
# Original instruction: addiu v1440,$fp,-252
addiu $t0,$fp,-252
# Original instruction: addiu v1441,v1440,40
addiu $t0,$t0,40
# Original instruction: addiu v1442,$fp,-16
addiu $t2,$fp,-16
# Original instruction: lw v1443,0(v1442)
lw $t2,0($t2)
# Original instruction: li v1446,4
li $t3,4
# Original instruction: mul v1445,v1443,v1446
mul $t2,$t2,$t3
# Original instruction: add v1444,v1441,v1445
add $t4,$t0,$t2
# Original instruction: addiu v1447,$fp,-272
addiu $t6,$fp,-272
# 
# Loading from v1444 from stack into v1447
# Original instruction: li v1448,4
li $t2,4
# Original instruction: li v1449,0
li $t3,0
label_257_mem_copy_loop:
# Original instruction: beq v1449,v1448,label_258_mem_copy_end
beq $t3,$t2,label_258_mem_copy_end
# Original instruction: add v1450,v1444,v1449
add $t0,$t4,$t3
# Original instruction: lb v1452,0(v1450)
lb $t5,0($t0)
# Original instruction: add v1451,v1447,v1449
add $t0,$t6,$t3
# Original instruction: sb v1452,0(v1451)
sb $t5,0($t0)
# Original instruction: addi v1449,v1449,1
addi $t3,$t3,1
# Original instruction: j label_257_mem_copy_loop
j label_257_mem_copy_loop
label_258_mem_copy_end:
# 
# Original instruction: addi v1453,$zero,0
addi $t2,$zero,0
# Original instruction: addiu v1454,$fp,-20
addiu $t0,$fp,-20
# Loading from v1453 from reg into v1454
# Original instruction: sw v1453,0(v1454)
sw $t2,0($t0)
label_259_while_start:
# Original instruction: addiu v1455,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v1456,0(v1455)
lw $t3,0($t0)
# Original instruction: addiu v1457,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1458,0(v1457)
lw $t2,0($t0)
# Original instruction: addi v1459,$zero,3
addi $t0,$zero,3
# Original instruction: add v1460,v1458,v1459
add $t0,$t2,$t0
# Original instruction: slt v1461,v1456,v1460
slt $t0,$t3,$t0
# Original instruction: beq v1461,$zero,label_261_false_and
beq $t0,$zero,label_261_false_and
# Original instruction: addiu v1462,$fp,-272
addiu $t0,$fp,-272
# Original instruction: lw v1463,0(v1462)
lw $t0,0($t0)
# Original instruction: addiu v1464,v1463,12
addiu $t0,$t0,12
# Original instruction: lw v1465,0(v1464)
lw $t0,0($t0)
# Original instruction: beq v1465,$zero,label_261_false_and
beq $t0,$zero,label_261_false_and
# Original instruction: addi v1466,$zero,1
addi $t0,$zero,1
# Original instruction: j label_262_end_and
j label_262_end_and
label_261_false_and:
# Original instruction: addi v1466,$zero,0
addi $t0,$zero,0
label_262_end_and:
# Original instruction: beqz v1466,label_260_while_end
beqz $t0,label_260_while_end
# Original instruction: addiu v1467,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v1468,0(v1467)
lw $t2,0($t0)
# Original instruction: addiu v1469,$fp,-272
addiu $t0,$fp,-272
# Original instruction: lw v1470,0(v1469)
lw $t0,0($t0)
# Original instruction: addiu v1471,v1470,0
addiu $t0,$t0,0
# Original instruction: lw v1472,0(v1471)
lw $t0,0($t0)
# Original instruction: add v1473,v1468,v1472
add $t2,$t2,$t0
# Original instruction: addiu v1474,$fp,-12
addiu $t0,$fp,-12
# Loading from v1473 from reg into v1474
# Original instruction: sw v1473,0(v1474)
sw $t2,0($t0)
# Original instruction: addiu v1475,$fp,-272
addiu $t0,$fp,-272
# Original instruction: lw v1476,0(v1475)
lw $t0,0($t0)
# Original instruction: addiu v1477,v1476,16
addiu $t0,$t0,16
# Original instruction: lw v1478,0(v1477)
lw $t0,0($t0)
# Original instruction: beqz v1478,label_263_else
beqz $t0,label_263_else
# Original instruction: addiu v1479,$fp,-272
addiu $t0,$fp,-272
# Original instruction: lw v1480,0(v1479)
lw $t0,0($t0)
# Original instruction: addiu v1481,v1480,4
addiu $t3,$t0,4
# Original instruction: addiu v1482,$fp,-272
addiu $t2,$fp,-272
# 
# Loading from v1481 from stack into v1482
# Original instruction: li v1483,4
li $t4,4
# Original instruction: li v1484,0
li $t6,0
label_265_mem_copy_loop:
# Original instruction: beq v1484,v1483,label_266_mem_copy_end
beq $t6,$t4,label_266_mem_copy_end
# Original instruction: add v1485,v1481,v1484
add $t0,$t3,$t6
# Original instruction: lb v1487,0(v1485)
lb $t0,0($t0)
# Original instruction: add v1486,v1482,v1484
add $t5,$t2,$t6
# Original instruction: sb v1487,0(v1486)
sb $t0,0($t5)
# Original instruction: addi v1484,v1484,1
addi $t6,$t6,1
# Original instruction: j label_265_mem_copy_loop
j label_265_mem_copy_loop
label_266_mem_copy_end:
# 
# Original instruction: j label_264_end
j label_264_end
label_263_else:
# Original instruction: j label_260_while_end
j label_260_while_end
label_264_end:
# Original instruction: addiu v1488,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v1489,0(v1488)
lw $t0,0($t0)
# Original instruction: addi v1490,$zero,1
addi $t2,$zero,1
# Original instruction: add v1491,v1489,v1490
add $t0,$t0,$t2
# Original instruction: addiu v1492,$fp,-20
addiu $t2,$fp,-20
# Loading from v1491 from reg into v1492
# Original instruction: sw v1491,0(v1492)
sw $t0,0($t2)
# Original instruction: j label_259_while_start
j label_259_while_start
label_260_while_end:
# Original instruction: addiu v1493,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v1494,0(v1493)
lw $t0,0($t0)
# Original instruction: addi v1495,$zero,1
addi $t2,$zero,1
# Original instruction: add v1496,v1494,v1495
add $t2,$t0,$t2
# Original instruction: addiu v1497,$fp,-16
addiu $t0,$fp,-16
# Loading from v1496 from reg into v1497
# Original instruction: sw v1496,0(v1497)
sw $t2,0($t0)
# Original instruction: j label_255_while_start
j label_255_while_start
label_256_while_end:
# Original instruction: addiu v1498,$fp,-40
addiu $t0,$fp,-40
# Original instruction: lw v1499,0(v1498)
lw $t2,0($t0)
# Original instruction: addiu v1500,$fp,-44
addiu $t0,$fp,-44
# Original instruction: lw v1501,0(v1500)
lw $t0,0($t0)
# Original instruction: add v1502,v1499,v1501
add $t2,$t2,$t0
# Original instruction: addiu v1503,$fp,-48
addiu $t0,$fp,-48
# Original instruction: lw v1504,0(v1503)
lw $t3,0($t0)
# Original instruction: addiu v1505,$fp,-52
addiu $t0,$fp,-52
# Original instruction: lw v1506,0(v1505)
lw $t0,0($t0)
# Original instruction: sub v1507,v1504,v1506
sub $t0,$t3,$t0
# Original instruction: mul v1508,v1502,v1507
mul $t0,$t2,$t0
# Original instruction: addiu v1509,$fp,-56
addiu $t2,$fp,-56
# Original instruction: lw v1510,0(v1509)
lw $t2,0($t2)
# Original instruction: addi v1511,$zero,1
addi $t3,$zero,1
# Original instruction: add v1512,v1510,v1511
add $t2,$t2,$t3
# Original instruction: div v1508,v1512
div $t0,$t2
# Original instruction: mflo v1513
mflo $t2
# Original instruction: addiu v1514,$fp,-60
addiu $t0,$fp,-60
# Original instruction: lw v1515,0(v1514)
lw $t0,0($t0)
# Original instruction: addiu v1516,$fp,-64
addiu $t3,$fp,-64
# Original instruction: lw v1517,0(v1516)
lw $t3,0($t3)
# Original instruction: sub v1518,v1515,v1517
sub $t0,$t0,$t3
# Original instruction: addiu v1519,$fp,-68
addiu $t3,$fp,-68
# Original instruction: lw v1520,0(v1519)
lw $t3,0($t3)
# Original instruction: addiu v1521,$fp,-72
addiu $t4,$fp,-72
# Original instruction: lw v1522,0(v1521)
lw $t4,0($t4)
# Original instruction: add v1523,v1520,v1522
add $t3,$t3,$t4
# Original instruction: mul v1524,v1518,v1523
mul $t3,$t0,$t3
# Original instruction: addiu v1525,$fp,-76
addiu $t0,$fp,-76
# Original instruction: lw v1526,0(v1525)
lw $t4,0($t0)
# Original instruction: addi v1527,$zero,1
addi $t0,$zero,1
# Original instruction: add v1528,v1526,v1527
add $t0,$t4,$t0
# Original instruction: div v1524,v1528
div $t3,$t0
# Original instruction: mflo v1529
mflo $t0
# Original instruction: add v1530,v1513,v1529
add $t3,$t2,$t0
# Original instruction: addiu v1531,$fp,-80
addiu $t0,$fp,-80
# Original instruction: lw v1532,0(v1531)
lw $t2,0($t0)
# Original instruction: addiu v1533,$fp,-84
addiu $t0,$fp,-84
# Original instruction: lw v1534,0(v1533)
lw $t0,0($t0)
# Original instruction: add v1535,v1532,v1534
add $t0,$t2,$t0
# Original instruction: addiu v1536,$fp,-88
addiu $t2,$fp,-88
# Original instruction: lw v1537,0(v1536)
lw $t4,0($t2)
# Original instruction: addiu v1538,$fp,-92
addiu $t2,$fp,-92
# Original instruction: lw v1539,0(v1538)
lw $t2,0($t2)
# Original instruction: sub v1540,v1537,v1539
sub $t2,$t4,$t2
# Original instruction: mul v1541,v1535,v1540
mul $t4,$t0,$t2
# Original instruction: addiu v1542,$fp,-96
addiu $t0,$fp,-96
# Original instruction: lw v1543,0(v1542)
lw $t2,0($t0)
# Original instruction: addi v1544,$zero,1
addi $t0,$zero,1
# Original instruction: add v1545,v1543,v1544
add $t0,$t2,$t0
# Original instruction: div v1541,v1545
div $t4,$t0
# Original instruction: mflo v1546
mflo $t0
# Original instruction: sub v1547,v1530,v1546
sub $t0,$t3,$t0
# Original instruction: addiu v1548,$fp,-100
addiu $t2,$fp,-100
# Loading from v1547 from reg into v1548
# Original instruction: sw v1547,0(v1548)
sw $t0,0($t2)
# Original instruction: addiu v1549,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v1550,0(v1549)
lw $t2,0($t0)
# Original instruction: addiu v1551,$fp,-100
addiu $t0,$fp,-100
# Original instruction: lw v1552,0(v1551)
lw $t0,0($t0)
# Original instruction: add v1553,v1550,v1552
add $t2,$t2,$t0
# Original instruction: addiu v1554,$fp,-12
addiu $t0,$fp,-12
# Loading from v1553 from reg into v1554
# Original instruction: sw v1553,0(v1554)
sw $t2,0($t0)
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v1555,$fp,-12
addiu $t4,$fp,-12
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v1556,$sp,0
addi $t2,$sp,0
# 
# Loading from v1555 from stack into v1556
# Original instruction: li v1557,4
li $t3,4
# Original instruction: li v1558,0
li $t5,0
label_267_mem_copy_loop:
# Original instruction: beq v1558,v1557,label_268_mem_copy_end
beq $t5,$t3,label_268_mem_copy_end
# Original instruction: add v1559,v1555,v1558
add $t0,$t4,$t5
# Original instruction: lb v1561,0(v1559)
lb $t0,0($t0)
# Original instruction: add v1560,v1556,v1558
add $t6,$t2,$t5
# Original instruction: sb v1561,0(v1560)
sb $t0,0($t6)
# Original instruction: addi v1558,v1558,1
addi $t5,$t5,1
# Original instruction: j label_267_mem_copy_loop
j label_267_mem_copy_loop
label_268_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# Return statement start
# Original instruction: addi v1563,$zero,0
addi $t2,$zero,0
# Original instruction: addiu v1564,$fp,0
addiu $t0,$fp,0
# Loading from v1563 from reg into v1564
# Original instruction: sw v1563,0(v1564)
sw $t2,0($t0)
# Original instruction: jal mainEND
jal mainEND
# Return statement end
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v693,0
addi $sp,$t1,0
# Original instruction: popRegisters
# Labels:
# Registers:
lw $t6,0($sp)
addiu $sp,$sp,4
lw $t5,0($sp)
addiu $sp,$sp,4
lw $t4,0($sp)
addiu $sp,$sp,4
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

