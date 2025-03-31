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
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
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
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
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
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
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
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
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
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
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
# Registers:
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
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
registerStress:
# Clearing entire allocated stack frame of size 92
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
# Original instruction: slti $t2,$t0,93
slti $t2,$t0,93
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
# Original instruction: addiu $sp,$fp,-92
addiu $sp,$fp,-92
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
addi $t1,$sp,0
# END PROLOGUE
# Original instruction: addi v7,$zero,1
addi $t0,$zero,1
# Original instruction: addiu v8,$fp,-12
addiu $t2,$fp,-12
# Loading from v7 from reg into v8
# Original instruction: sw v7,0(v8)
sw $t0,0($t2)
# Original instruction: addi v9,$zero,2
addi $t2,$zero,2
# Original instruction: addiu v10,$fp,-16
addiu $t0,$fp,-16
# Loading from v9 from reg into v10
# Original instruction: sw v9,0(v10)
sw $t2,0($t0)
# Original instruction: addi v11,$zero,3
addi $t0,$zero,3
# Original instruction: addiu v12,$fp,-20
addiu $t2,$fp,-20
# Loading from v11 from reg into v12
# Original instruction: sw v11,0(v12)
sw $t0,0($t2)
# Original instruction: addi v13,$zero,4
addi $t2,$zero,4
# Original instruction: addiu v14,$fp,-24
addiu $t0,$fp,-24
# Loading from v13 from reg into v14
# Original instruction: sw v13,0(v14)
sw $t2,0($t0)
# Original instruction: addi v15,$zero,5
addi $t0,$zero,5
# Original instruction: addiu v16,$fp,-28
addiu $t2,$fp,-28
# Loading from v15 from reg into v16
# Original instruction: sw v15,0(v16)
sw $t0,0($t2)
# Original instruction: addi v17,$zero,6
addi $t2,$zero,6
# Original instruction: addiu v18,$fp,-32
addiu $t0,$fp,-32
# Loading from v17 from reg into v18
# Original instruction: sw v17,0(v18)
sw $t2,0($t0)
# Original instruction: addi v19,$zero,7
addi $t2,$zero,7
# Original instruction: addiu v20,$fp,-36
addiu $t0,$fp,-36
# Loading from v19 from reg into v20
# Original instruction: sw v19,0(v20)
sw $t2,0($t0)
# Original instruction: addi v21,$zero,8
addi $t0,$zero,8
# Original instruction: addiu v22,$fp,-40
addiu $t2,$fp,-40
# Loading from v21 from reg into v22
# Original instruction: sw v21,0(v22)
sw $t0,0($t2)
# Original instruction: addi v23,$zero,9
addi $t0,$zero,9
# Original instruction: addiu v24,$fp,-44
addiu $t2,$fp,-44
# Loading from v23 from reg into v24
# Original instruction: sw v23,0(v24)
sw $t0,0($t2)
# Original instruction: addi v25,$zero,10
addi $t2,$zero,10
# Original instruction: addiu v26,$fp,-48
addiu $t0,$fp,-48
# Loading from v25 from reg into v26
# Original instruction: sw v25,0(v26)
sw $t2,0($t0)
# Original instruction: addi v27,$zero,11
addi $t2,$zero,11
# Original instruction: addiu v28,$fp,-52
addiu $t0,$fp,-52
# Loading from v27 from reg into v28
# Original instruction: sw v27,0(v28)
sw $t2,0($t0)
# Original instruction: addi v29,$zero,12
addi $t2,$zero,12
# Original instruction: addiu v30,$fp,-56
addiu $t0,$fp,-56
# Loading from v29 from reg into v30
# Original instruction: sw v29,0(v30)
sw $t2,0($t0)
# Original instruction: addi v31,$zero,13
addi $t2,$zero,13
# Original instruction: addiu v32,$fp,-60
addiu $t0,$fp,-60
# Loading from v31 from reg into v32
# Original instruction: sw v31,0(v32)
sw $t2,0($t0)
# Original instruction: addi v33,$zero,14
addi $t0,$zero,14
# Original instruction: addiu v34,$fp,-64
addiu $t2,$fp,-64
# Loading from v33 from reg into v34
# Original instruction: sw v33,0(v34)
sw $t0,0($t2)
# Original instruction: addi v35,$zero,15
addi $t2,$zero,15
# Original instruction: addiu v36,$fp,-68
addiu $t0,$fp,-68
# Loading from v35 from reg into v36
# Original instruction: sw v35,0(v36)
sw $t2,0($t0)
# Original instruction: addi v37,$zero,16
addi $t0,$zero,16
# Original instruction: addiu v38,$fp,-72
addiu $t2,$fp,-72
# Loading from v37 from reg into v38
# Original instruction: sw v37,0(v38)
sw $t0,0($t2)
# Original instruction: addi v39,$zero,17
addi $t0,$zero,17
# Original instruction: addiu v40,$fp,-76
addiu $t2,$fp,-76
# Loading from v39 from reg into v40
# Original instruction: sw v39,0(v40)
sw $t0,0($t2)
# Original instruction: addi v41,$zero,18
addi $t2,$zero,18
# Original instruction: addiu v42,$fp,-80
addiu $t0,$fp,-80
# Loading from v41 from reg into v42
# Original instruction: sw v41,0(v42)
sw $t2,0($t0)
# Original instruction: addi v43,$zero,19
addi $t2,$zero,19
# Original instruction: addiu v44,$fp,-84
addiu $t0,$fp,-84
# Loading from v43 from reg into v44
# Original instruction: sw v43,0(v44)
sw $t2,0($t0)
# Original instruction: addi v45,$zero,20
addi $t0,$zero,20
# Original instruction: addiu v46,$fp,-88
addiu $t2,$fp,-88
# Loading from v45 from reg into v46
# Original instruction: sw v45,0(v46)
sw $t0,0($t2)
# Original instruction: addiu v47,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v48,0(v47)
lw $t0,0($t0)
# Original instruction: addiu v49,$fp,-16
addiu $t2,$fp,-16
# Original instruction: lw v50,0(v49)
lw $t2,0($t2)
# Original instruction: add v51,v48,v50
add $t0,$t0,$t2
# Original instruction: addiu v52,$fp,-20
addiu $t2,$fp,-20
# Original instruction: lw v53,0(v52)
lw $t2,0($t2)
# Original instruction: add v54,v51,v53
add $t2,$t0,$t2
# Original instruction: addiu v55,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v56,0(v55)
lw $t0,0($t0)
# Original instruction: add v57,v54,v56
add $t0,$t2,$t0
# Original instruction: addiu v58,$fp,-28
addiu $t2,$fp,-28
# Original instruction: lw v59,0(v58)
lw $t2,0($t2)
# Original instruction: add v60,v57,v59
add $t2,$t0,$t2
# Original instruction: addiu v61,$fp,-32
addiu $t0,$fp,-32
# Original instruction: lw v62,0(v61)
lw $t0,0($t0)
# Original instruction: add v63,v60,v62
add $t2,$t2,$t0
# Original instruction: addiu v64,$fp,-36
addiu $t0,$fp,-36
# Original instruction: lw v65,0(v64)
lw $t0,0($t0)
# Original instruction: add v66,v63,v65
add $t0,$t2,$t0
# Original instruction: addiu v67,$fp,-40
addiu $t2,$fp,-40
# Original instruction: lw v68,0(v67)
lw $t2,0($t2)
# Original instruction: add v69,v66,v68
add $t2,$t0,$t2
# Original instruction: addiu v70,$fp,-44
addiu $t0,$fp,-44
# Original instruction: lw v71,0(v70)
lw $t0,0($t0)
# Original instruction: add v72,v69,v71
add $t0,$t2,$t0
# Original instruction: addiu v73,$fp,-48
addiu $t2,$fp,-48
# Original instruction: lw v74,0(v73)
lw $t2,0($t2)
# Original instruction: add v75,v72,v74
add $t2,$t0,$t2
# Original instruction: addiu v76,$fp,-52
addiu $t0,$fp,-52
# Original instruction: lw v77,0(v76)
lw $t0,0($t0)
# Original instruction: add v78,v75,v77
add $t2,$t2,$t0
# Original instruction: addiu v79,$fp,-56
addiu $t0,$fp,-56
# Original instruction: lw v80,0(v79)
lw $t0,0($t0)
# Original instruction: add v81,v78,v80
add $t0,$t2,$t0
# Original instruction: addiu v82,$fp,-60
addiu $t2,$fp,-60
# Original instruction: lw v83,0(v82)
lw $t2,0($t2)
# Original instruction: add v84,v81,v83
add $t0,$t0,$t2
# Original instruction: addiu v85,$fp,-64
addiu $t2,$fp,-64
# Original instruction: lw v86,0(v85)
lw $t2,0($t2)
# Original instruction: add v87,v84,v86
add $t0,$t0,$t2
# Original instruction: addiu v88,$fp,-68
addiu $t2,$fp,-68
# Original instruction: lw v89,0(v88)
lw $t2,0($t2)
# Original instruction: add v90,v87,v89
add $t2,$t0,$t2
# Original instruction: addiu v91,$fp,-72
addiu $t0,$fp,-72
# Original instruction: lw v92,0(v91)
lw $t0,0($t0)
# Original instruction: add v93,v90,v92
add $t2,$t2,$t0
# Original instruction: addiu v94,$fp,-76
addiu $t0,$fp,-76
# Original instruction: lw v95,0(v94)
lw $t0,0($t0)
# Original instruction: add v96,v93,v95
add $t0,$t2,$t0
# Original instruction: addiu v97,$fp,-80
addiu $t2,$fp,-80
# Original instruction: lw v98,0(v97)
lw $t2,0($t2)
# Original instruction: add v99,v96,v98
add $t2,$t0,$t2
# Original instruction: addiu v100,$fp,-84
addiu $t0,$fp,-84
# Original instruction: lw v101,0(v100)
lw $t0,0($t0)
# Original instruction: add v102,v99,v101
add $t2,$t2,$t0
# Original instruction: addiu v103,$fp,-88
addiu $t0,$fp,-88
# Original instruction: lw v104,0(v103)
lw $t0,0($t0)
# Original instruction: add v105,v102,v104
add $t0,$t2,$t0
# Original instruction: addiu v106,$fp,-92
addiu $t2,$fp,-92
# Loading from v105 from reg into v106
# Original instruction: sw v105,0(v106)
sw $t0,0($t2)
# Return statement start
# Original instruction: addiu v107,$fp,-92
addiu $t5,$fp,-92
# Original instruction: addiu v108,$fp,0
addiu $t6,$fp,0
# 
# Loading from v107 from stack into v108
# Original instruction: li v109,4
li $t3,4
# Original instruction: li v110,0
li $t4,0
label_28_mem_copy_loop:
# Original instruction: beq v110,v109,label_29_mem_copy_end
beq $t4,$t3,label_29_mem_copy_end
# Original instruction: add v111,v107,v110
add $t0,$t5,$t4
# Original instruction: lb v113,0(v111)
lb $t0,0($t0)
# Original instruction: add v112,v108,v110
add $t2,$t6,$t4
# Original instruction: sb v113,0(v112)
sb $t0,0($t2)
# Original instruction: addi v110,v110,1
addi $t4,$t4,1
# Original instruction: j label_28_mem_copy_loop
j label_28_mem_copy_loop
label_29_mem_copy_end:
# 
# Original instruction: jal registerStressEND
jal registerStressEND
# Return statement end
# BEGIN EPILOGUE
registerStressEND:
# Original instruction: addi $sp,v6,0
addi $sp,$t1,0
# Original instruction: popRegisters
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
# Labels:
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
complexLogic:
# Clearing entire allocated stack frame of size 24
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
# Original instruction: slti $t2,$t0,25
slti $t2,$t0,25
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
# Original instruction: addiu $sp,$fp,-24
addiu $sp,$fp,-24
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
# Original instruction: addi v114,$sp,0
addi $t2,$sp,0
# END PROLOGUE
# Original instruction: addiu v115,$fp,4
addiu $t1,$fp,4
# Original instruction: addiu v116,$fp,-12
addiu $t0,$fp,-12
# 
# Loading from v115 from stack into v116
# Original instruction: li v117,4
li $t6,4
# Original instruction: li v118,0
li $t4,0
label_34_mem_copy_loop:
# Original instruction: beq v118,v117,label_35_mem_copy_end
beq $t4,$t6,label_35_mem_copy_end
# Original instruction: add v119,v115,v118
add $t3,$t1,$t4
# Original instruction: lb v121,0(v119)
lb $t5,0($t3)
# Original instruction: add v120,v116,v118
add $t3,$t0,$t4
# Original instruction: sb v121,0(v120)
sb $t5,0($t3)
# Original instruction: addi v118,v118,1
addi $t4,$t4,1
# Original instruction: j label_34_mem_copy_loop
j label_34_mem_copy_loop
label_35_mem_copy_end:
# 
# Original instruction: addiu v122,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v123,0(v122)
lw $t1,0($t0)
# Original instruction: addi v124,$zero,50
addi $t0,$zero,50
# Original instruction: sub v125,v123,v124
sub $t0,$t1,$t0
# Original instruction: beqz v125,label_36_else
beqz $t0,label_36_else
# Original instruction: addiu v126,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v127,0(v126)
lw $t0,0($t0)
# Original instruction: addi v128,$zero,100
addi $t1,$zero,100
# Original instruction: add v129,v127,v128
add $t1,$t0,$t1
# Original instruction: addiu v130,$fp,-12
addiu $t0,$fp,-12
# Loading from v129 from reg into v130
# Original instruction: sw v129,0(v130)
sw $t1,0($t0)
# Original instruction: j label_37_end
j label_37_end
label_36_else:
# Original instruction: addiu v131,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v132,0(v131)
lw $t0,0($t0)
# Original instruction: addi v133,$zero,50
addi $t1,$zero,50
# Original instruction: sub v134,v132,v133
sub $t1,$t0,$t1
# Original instruction: addiu v135,$fp,-12
addiu $t0,$fp,-12
# Loading from v134 from reg into v135
# Original instruction: sw v134,0(v135)
sw $t1,0($t0)
label_37_end:
# Original instruction: addiu v136,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v137,0(v136)
lw $t1,0($t0)
# Original instruction: addi v138,$zero,2
addi $t0,$zero,2
# Original instruction: mul v139,v137,v138
mul $t0,$t1,$t0
# Original instruction: addiu v140,$fp,-24
addiu $t1,$fp,-24
# Loading from v139 from reg into v140
# Original instruction: sw v139,0(v140)
sw $t0,0($t1)
# Original instruction: addiu v141,$fp,-24
addiu $t0,$fp,-24
# Original instruction: lw v142,0(v141)
lw $t0,0($t0)
# Original instruction: addi v143,$zero,10
addi $t1,$zero,10
# Original instruction: sub v144,v142,v143
sub $t0,$t0,$t1
# Original instruction: beqz v144,label_38_else
beqz $t0,label_38_else
# Original instruction: addiu v145,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v146,0(v145)
lw $t0,0($t0)
# Original instruction: addiu v147,$fp,-24
addiu $t1,$fp,-24
# Original instruction: lw v148,0(v147)
lw $t1,0($t1)
# Original instruction: add v149,v146,v148
add $t0,$t0,$t1
# Original instruction: addiu v150,$fp,-12
addiu $t1,$fp,-12
# Loading from v149 from reg into v150
# Original instruction: sw v149,0(v150)
sw $t0,0($t1)
# Original instruction: j label_39_end
j label_39_end
label_38_else:
# Original instruction: addiu v151,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v152,0(v151)
lw $t0,0($t0)
# Original instruction: addiu v153,$fp,-24
addiu $t1,$fp,-24
# Original instruction: lw v154,0(v153)
lw $t1,0($t1)
# Original instruction: sub v155,v152,v154
sub $t1,$t0,$t1
# Original instruction: addiu v156,$fp,-12
addiu $t0,$fp,-12
# Loading from v155 from reg into v156
# Original instruction: sw v155,0(v156)
sw $t1,0($t0)
label_39_end:
# Original instruction: addi v157,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v158,$fp,-16
addiu $t1,$fp,-16
# Loading from v157 from reg into v158
# Original instruction: sw v157,0(v158)
sw $t0,0($t1)
label_40_while_start:
# Original instruction: addiu v159,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v160,0(v159)
lw $t1,0($t0)
# Original instruction: addi v161,$zero,5
addi $t0,$zero,5
# Original instruction: slt v162,v160,v161
slt $t0,$t1,$t0
# Original instruction: beqz v162,label_41_while_end
beqz $t0,label_41_while_end
# Original instruction: addiu v163,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v164,0(v163)
lw $t0,0($t0)
# Original instruction: addi v165,$zero,3
addi $t1,$zero,3
# Original instruction: mul v166,v164,v165
mul $t0,$t0,$t1
# Original instruction: addiu v167,$fp,-20
addiu $t1,$fp,-20
# Loading from v166 from reg into v167
# Original instruction: sw v166,0(v167)
sw $t0,0($t1)
# Original instruction: addiu v168,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v169,0(v168)
lw $t1,0($t0)
# Original instruction: addi v170,$zero,5
addi $t0,$zero,5
# Original instruction: sub v171,v169,v170
sub $t0,$t1,$t0
# Original instruction: beqz v171,label_42_else
beqz $t0,label_42_else
# Original instruction: addiu v172,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v173,0(v172)
lw $t1,0($t0)
# Original instruction: addiu v174,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v175,0(v174)
lw $t0,0($t0)
# Original instruction: add v176,v173,v175
add $t1,$t1,$t0
# Original instruction: addiu v177,$fp,-12
addiu $t0,$fp,-12
# Loading from v176 from reg into v177
# Original instruction: sw v176,0(v177)
sw $t1,0($t0)
# Original instruction: j label_43_end
j label_43_end
label_42_else:
# Original instruction: addiu v178,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v179,0(v178)
lw $t0,0($t0)
# Original instruction: addiu v180,$fp,-20
addiu $t1,$fp,-20
# Original instruction: lw v181,0(v180)
lw $t1,0($t1)
# Original instruction: sub v182,v179,v181
sub $t0,$t0,$t1
# Original instruction: addiu v183,$fp,-12
addiu $t1,$fp,-12
# Loading from v182 from reg into v183
# Original instruction: sw v182,0(v183)
sw $t0,0($t1)
label_43_end:
# Original instruction: addiu v184,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v185,0(v184)
lw $t1,0($t0)
# Original instruction: addi v186,$zero,1
addi $t0,$zero,1
# Original instruction: add v187,v185,v186
add $t1,$t1,$t0
# Original instruction: addiu v188,$fp,-16
addiu $t0,$fp,-16
# Loading from v187 from reg into v188
# Original instruction: sw v187,0(v188)
sw $t1,0($t0)
# Original instruction: j label_40_while_start
j label_40_while_start
label_41_while_end:
# Return statement start
# Original instruction: addiu v189,$fp,-12
addiu $t4,$fp,-12
# Original instruction: addiu v190,$fp,0
addiu $t1,$fp,0
# 
# Loading from v189 from stack into v190
# Original instruction: li v191,4
li $t5,4
# Original instruction: li v192,0
li $t6,0
label_44_mem_copy_loop:
# Original instruction: beq v192,v191,label_45_mem_copy_end
beq $t6,$t5,label_45_mem_copy_end
# Original instruction: add v193,v189,v192
add $t0,$t4,$t6
# Original instruction: lb v195,0(v193)
lb $t0,0($t0)
# Original instruction: add v194,v190,v192
add $t3,$t1,$t6
# Original instruction: sb v195,0(v194)
sb $t0,0($t3)
# Original instruction: addi v192,v192,1
addi $t6,$t6,1
# Original instruction: j label_44_mem_copy_loop
j label_44_mem_copy_loop
label_45_mem_copy_end:
# 
# Original instruction: jal complexLogicEND
jal complexLogicEND
# Return statement end
# BEGIN EPILOGUE
complexLogicEND:
# Original instruction: addi $sp,v114,0
addi $sp,$t2,0
# Original instruction: popRegisters
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
# Labels:
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
processBigData:
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
label_48_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,13
slti $t2,$t0,13
# Original instruction: bne $t2,$zero,label_48_clean_loop
bne $t2,$zero,label_48_clean_loop
label_49_clean_loop_end:
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
# Original instruction: addi v196,$sp,0
addi $t1,$sp,0
# END PROLOGUE
# Original instruction: addi v197,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v198,$fp,-12
addiu $t2,$fp,-12
# Loading from v197 from reg into v198
# Original instruction: sw v197,0(v198)
sw $t0,0($t2)
label_50_while_start:
# Original instruction: addiu v199,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v200,0(v199)
lw $t2,0($t0)
# Original instruction: addi v201,$zero,10
addi $t0,$zero,10
# Original instruction: slt v202,v200,v201
slt $t0,$t2,$t0
# Original instruction: beqz v202,label_51_while_end
beqz $t0,label_51_while_end
# Original instruction: addiu v203,$fp,48
addiu $t0,$fp,48
# Original instruction: addiu v204,v203,4
addiu $t3,$t0,4
# Original instruction: addiu v205,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v206,0(v205)
lw $t0,0($t0)
# Original instruction: li v209,4
li $t2,4
# Original instruction: mul v208,v206,v209
mul $t0,$t0,$t2
# Original instruction: add v207,v204,v208
add $t0,$t3,$t0
# Original instruction: lw v210,0(v207)
lw $t2,0($t0)
# Original instruction: addiu v211,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v212,0(v211)
lw $t3,0($t0)
# Original instruction: addi v213,$zero,2
addi $t0,$zero,2
# Original instruction: add v214,v212,v213
add $t0,$t3,$t0
# Original instruction: mul v215,v210,v214
mul $t0,$t2,$t0
# Original instruction: addiu v216,$fp,48
addiu $t2,$fp,48
# Original instruction: addiu v217,v216,4
addiu $t3,$t2,4
# Original instruction: addiu v218,$fp,-12
addiu $t2,$fp,-12
# Original instruction: lw v219,0(v218)
lw $t4,0($t2)
# Original instruction: li v222,4
li $t2,4
# Original instruction: mul v221,v219,v222
mul $t2,$t4,$t2
# Original instruction: add v220,v217,v221
add $t2,$t3,$t2
# Loading from v215 from reg into v220
# Original instruction: sw v215,0(v220)
sw $t0,0($t2)
# Original instruction: addiu v223,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v224,0(v223)
lw $t2,0($t0)
# Original instruction: addi v225,$zero,1
addi $t0,$zero,1
# Original instruction: add v226,v224,v225
add $t0,$t2,$t0
# Original instruction: addiu v227,$fp,-12
addiu $t2,$fp,-12
# Loading from v226 from reg into v227
# Original instruction: sw v226,0(v227)
sw $t0,0($t2)
# Original instruction: j label_50_while_start
j label_50_while_start
label_51_while_end:
# Original instruction: addiu v228,$fp,48
addiu $t0,$fp,48
# Original instruction: addiu v229,v228,0
addiu $t0,$t0,0
# Original instruction: lw v230,0(v229)
lw $t0,0($t0)
# Original instruction: addi v231,$zero,100
addi $t2,$zero,100
# Original instruction: sub v232,v230,v231
sub $t0,$t0,$t2
# Original instruction: beqz v232,label_52_else
beqz $t0,label_52_else
# Original instruction: addiu v233,$fp,48
addiu $t0,$fp,48
# Original instruction: addiu v234,v233,0
addiu $t0,$t0,0
# Original instruction: lw v235,0(v234)
lw $t0,0($t0)
# Original instruction: addi v236,$zero,50
addi $t2,$zero,50
# Original instruction: add v237,v235,v236
add $t2,$t0,$t2
# Original instruction: addiu v238,$fp,48
addiu $t0,$fp,48
# Original instruction: addiu v239,v238,0
addiu $t0,$t0,0
# Loading from v237 from reg into v239
# Original instruction: sw v237,0(v239)
sw $t2,0($t0)
# Original instruction: j label_53_end
j label_53_end
label_52_else:
# Original instruction: addiu v240,$fp,48
addiu $t0,$fp,48
# Original instruction: addiu v241,v240,0
addiu $t0,$t0,0
# Original instruction: lw v242,0(v241)
lw $t0,0($t0)
# Original instruction: addi v243,$zero,20
addi $t2,$zero,20
# Original instruction: sub v244,v242,v243
sub $t2,$t0,$t2
# Original instruction: addiu v245,$fp,48
addiu $t0,$fp,48
# Original instruction: addiu v246,v245,0
addiu $t0,$t0,0
# Loading from v244 from reg into v246
# Original instruction: sw v244,0(v246)
sw $t2,0($t0)
label_53_end:
# Return statement start
# Original instruction: addiu v247,$fp,48
addiu $t6,$fp,48
# Original instruction: addiu v248,$fp,0
addiu $t4,$fp,0
# 
# Loading from v247 from stack into v248
# Original instruction: li v249,48
li $t2,48
# Original instruction: li v250,0
li $t3,0
label_54_mem_copy_loop:
# Original instruction: beq v250,v249,label_55_mem_copy_end
beq $t3,$t2,label_55_mem_copy_end
# Original instruction: add v251,v247,v250
add $t0,$t6,$t3
# Original instruction: lb v253,0(v251)
lb $t5,0($t0)
# Original instruction: add v252,v248,v250
add $t0,$t4,$t3
# Original instruction: sb v253,0(v252)
sb $t5,0($t0)
# Original instruction: addi v250,v250,1
addi $t3,$t3,1
# Original instruction: j label_54_mem_copy_loop
j label_54_mem_copy_loop
label_55_mem_copy_end:
# 
# Original instruction: jal processBigDataEND
jal processBigDataEND
# Return statement end
# BEGIN EPILOGUE
processBigDataEND:
# Original instruction: addi $sp,v196,0
addi $sp,$t1,0
# Original instruction: popRegisters
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
# Labels:
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
recursiveSum:
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
label_58_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_58_clean_loop
bne $t2,$zero,label_58_clean_loop
label_59_clean_loop_end:
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
addiu $sp,$sp,-4
sw $t1,0($sp)
addiu $sp,$sp,-4
sw $t2,0($sp)
addiu $sp,$sp,-4
sw $t3,0($sp)
# Original instruction: addi v254,$sp,0
addi $t1,$sp,0
# END PROLOGUE
# Original instruction: addiu v255,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v256,0(v255)
lw $t0,0($t0)
# Original instruction: beqz v256,label_60_else
beqz $t0,label_60_else
# Return statement start
# Original instruction: addiu v257,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v258,0(v257)
lw $t3,0($t0)
# BEGIN FUNCALL EXPR FOR recursiveSum
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v259,$fp,4
addiu $t0,$fp,4
# Original instruction: lw v260,0(v259)
lw $t0,0($t0)
# Original instruction: addi v261,$zero,1
addi $t2,$zero,1
# Original instruction: sub v262,v260,v261
sub $t2,$t0,$t2
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v263,$sp,0
addi $t0,$sp,0
# Loading from v262 from reg into v263
# Original instruction: sw v262,0(v263)
sw $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal recursiveSum
jal recursiveSum
# BACK FROM FUNCTION
# Original instruction: addi v264,$sp,0
addi $t0,$sp,0
# Original instruction: lw v265,0(v264)
lw $t0,0($t0)
# Original instruction: add v266,v258,v265
add $t2,$t3,$t0
# Original instruction: addiu v267,$fp,0
addiu $t0,$fp,0
# Loading from v266 from reg into v267
# Original instruction: sw v266,0(v267)
sw $t2,0($t0)
# Original instruction: jal recursiveSumEND
jal recursiveSumEND
# Return statement end
# Original instruction: j label_61_end
j label_61_end
label_60_else:
# Return statement start
# Original instruction: addi v268,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v269,$fp,0
addiu $t2,$fp,0
# Loading from v268 from reg into v269
# Original instruction: sw v268,0(v269)
sw $t0,0($t2)
# Original instruction: jal recursiveSumEND
jal recursiveSumEND
# Return statement end
label_61_end:
# BEGIN EPILOGUE
recursiveSumEND:
# Original instruction: addi $sp,v254,0
addi $sp,$t1,0
# Original instruction: popRegisters
# Registers:
lw $t3,0($sp)
addiu $sp,$sp,4
lw $t2,0($sp)
addiu $sp,$sp,4
lw $t1,0($sp)
addiu $sp,$sp,4
lw $t0,0($sp)
addiu $sp,$sp,4
# Labels:
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
matrixCalc:
# Clearing entire allocated stack frame of size 56
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
# Original instruction: slti $t2,$t0,57
slti $t2,$t0,57
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
# Original instruction: addiu $sp,$fp,-56
addiu $sp,$fp,-56
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
# Original instruction: addi v270,$sp,0
addi $t1,$sp,0
# END PROLOGUE
# Original instruction: addi v271,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v272,$fp,-48
addiu $t2,$fp,-48
# Loading from v271 from reg into v272
# Original instruction: sw v271,0(v272)
sw $t0,0($t2)
label_66_while_start:
# Original instruction: addiu v273,$fp,-48
addiu $t0,$fp,-48
# Original instruction: lw v274,0(v273)
lw $t0,0($t0)
# Original instruction: addi v275,$zero,3
addi $t2,$zero,3
# Original instruction: slt v276,v274,v275
slt $t0,$t0,$t2
# Original instruction: beqz v276,label_67_while_end
beqz $t0,label_67_while_end
# Original instruction: addi v277,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v278,$fp,-52
addiu $t2,$fp,-52
# Loading from v277 from reg into v278
# Original instruction: sw v277,0(v278)
sw $t0,0($t2)
label_68_while_start:
# Original instruction: addiu v279,$fp,-52
addiu $t0,$fp,-52
# Original instruction: lw v280,0(v279)
lw $t0,0($t0)
# Original instruction: addi v281,$zero,3
addi $t2,$zero,3
# Original instruction: slt v282,v280,v281
slt $t0,$t0,$t2
# Original instruction: beqz v282,label_69_while_end
beqz $t0,label_69_while_end
# Original instruction: addiu v283,$fp,-48
addiu $t0,$fp,-48
# Original instruction: lw v284,0(v283)
lw $t0,0($t0)
# Original instruction: addi v285,$zero,3
addi $t2,$zero,3
# Original instruction: mul v286,v284,v285
mul $t0,$t0,$t2
# Original instruction: addiu v287,$fp,-52
addiu $t2,$fp,-52
# Original instruction: lw v288,0(v287)
lw $t2,0($t2)
# Original instruction: add v289,v286,v288
add $t2,$t0,$t2
# Original instruction: addi v290,$zero,1
addi $t0,$zero,1
# Original instruction: add v291,v289,v290
add $t2,$t2,$t0
# Original instruction: addiu v292,$fp,-44
addiu $t4,$fp,-44
# Original instruction: addiu v293,$fp,-48
addiu $t0,$fp,-48
# Original instruction: lw v294,0(v293)
lw $t0,0($t0)
# Original instruction: li v297,12
li $t3,12
# Original instruction: mul v296,v294,v297
mul $t0,$t0,$t3
# Original instruction: add v295,v292,v296
add $t4,$t4,$t0
# Original instruction: addiu v298,$fp,-52
addiu $t0,$fp,-52
# Original instruction: lw v299,0(v298)
lw $t0,0($t0)
# Original instruction: li v302,4
li $t3,4
# Original instruction: mul v301,v299,v302
mul $t0,$t0,$t3
# Original instruction: add v300,v295,v301
add $t0,$t4,$t0
# Loading from v291 from reg into v300
# Original instruction: sw v291,0(v300)
sw $t2,0($t0)
# Original instruction: addiu v303,$fp,-52
addiu $t0,$fp,-52
# Original instruction: lw v304,0(v303)
lw $t0,0($t0)
# Original instruction: addi v305,$zero,1
addi $t2,$zero,1
# Original instruction: add v306,v304,v305
add $t2,$t0,$t2
# Original instruction: addiu v307,$fp,-52
addiu $t0,$fp,-52
# Loading from v306 from reg into v307
# Original instruction: sw v306,0(v307)
sw $t2,0($t0)
# Original instruction: j label_68_while_start
j label_68_while_start
label_69_while_end:
# Original instruction: addiu v308,$fp,-48
addiu $t0,$fp,-48
# Original instruction: lw v309,0(v308)
lw $t2,0($t0)
# Original instruction: addi v310,$zero,1
addi $t0,$zero,1
# Original instruction: add v311,v309,v310
add $t0,$t2,$t0
# Original instruction: addiu v312,$fp,-48
addiu $t2,$fp,-48
# Loading from v311 from reg into v312
# Original instruction: sw v311,0(v312)
sw $t0,0($t2)
# Original instruction: j label_66_while_start
j label_66_while_start
label_67_while_end:
# Original instruction: addi v313,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v314,$fp,-56
addiu $t2,$fp,-56
# Loading from v313 from reg into v314
# Original instruction: sw v313,0(v314)
sw $t0,0($t2)
# Original instruction: addi v315,$zero,0
addi $t2,$zero,0
# Original instruction: addiu v316,$fp,-48
addiu $t0,$fp,-48
# Loading from v315 from reg into v316
# Original instruction: sw v315,0(v316)
sw $t2,0($t0)
label_70_while_start:
# Original instruction: addiu v317,$fp,-48
addiu $t0,$fp,-48
# Original instruction: lw v318,0(v317)
lw $t2,0($t0)
# Original instruction: addi v319,$zero,3
addi $t0,$zero,3
# Original instruction: slt v320,v318,v319
slt $t0,$t2,$t0
# Original instruction: beqz v320,label_71_while_end
beqz $t0,label_71_while_end
# Original instruction: addi v321,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v322,$fp,-52
addiu $t2,$fp,-52
# Loading from v321 from reg into v322
# Original instruction: sw v321,0(v322)
sw $t0,0($t2)
label_72_while_start:
# Original instruction: addiu v323,$fp,-52
addiu $t0,$fp,-52
# Original instruction: lw v324,0(v323)
lw $t2,0($t0)
# Original instruction: addi v325,$zero,3
addi $t0,$zero,3
# Original instruction: slt v326,v324,v325
slt $t0,$t2,$t0
# Original instruction: beqz v326,label_73_while_end
beqz $t0,label_73_while_end
# Original instruction: addiu v327,$fp,-44
addiu $t2,$fp,-44
# Original instruction: addiu v328,$fp,-48
addiu $t0,$fp,-48
# Original instruction: lw v329,0(v328)
lw $t3,0($t0)
# Original instruction: li v332,12
li $t0,12
# Original instruction: mul v331,v329,v332
mul $t0,$t3,$t0
# Original instruction: add v330,v327,v331
add $t0,$t2,$t0
# Original instruction: addiu v333,$fp,-52
addiu $t2,$fp,-52
# Original instruction: lw v334,0(v333)
lw $t2,0($t2)
# Original instruction: li v337,4
li $t3,4
# Original instruction: mul v336,v334,v337
mul $t2,$t2,$t3
# Original instruction: add v335,v330,v336
add $t0,$t0,$t2
# Original instruction: lw v338,0(v335)
lw $t0,0($t0)
# Original instruction: addi v339,$zero,2
addi $t2,$zero,2
# Original instruction: div v338,v339
div $t0,$t2
# Original instruction: mfhi v340
mfhi $t0
# Original instruction: beqz v340,label_74_else
beqz $t0,label_74_else
# Original instruction: addiu v341,$fp,-56
addiu $t0,$fp,-56
# Original instruction: lw v342,0(v341)
lw $t4,0($t0)
# Original instruction: addiu v343,$fp,-44
addiu $t2,$fp,-44
# Original instruction: addiu v344,$fp,-48
addiu $t0,$fp,-48
# Original instruction: lw v345,0(v344)
lw $t0,0($t0)
# Original instruction: li v348,12
li $t3,12
# Original instruction: mul v347,v345,v348
mul $t0,$t0,$t3
# Original instruction: add v346,v343,v347
add $t2,$t2,$t0
# Original instruction: addiu v349,$fp,-52
addiu $t0,$fp,-52
# Original instruction: lw v350,0(v349)
lw $t3,0($t0)
# Original instruction: li v353,4
li $t0,4
# Original instruction: mul v352,v350,v353
mul $t0,$t3,$t0
# Original instruction: add v351,v346,v352
add $t0,$t2,$t0
# Original instruction: lw v354,0(v351)
lw $t0,0($t0)
# Original instruction: add v355,v342,v354
add $t0,$t4,$t0
# Original instruction: addiu v356,$fp,-56
addiu $t2,$fp,-56
# Loading from v355 from reg into v356
# Original instruction: sw v355,0(v356)
sw $t0,0($t2)
# Original instruction: j label_75_end
j label_75_end
label_74_else:
# Original instruction: addiu v357,$fp,-56
addiu $t0,$fp,-56
# Original instruction: lw v358,0(v357)
lw $t4,0($t0)
# Original instruction: addiu v359,$fp,-44
addiu $t2,$fp,-44
# Original instruction: addiu v360,$fp,-48
addiu $t0,$fp,-48
# Original instruction: lw v361,0(v360)
lw $t0,0($t0)
# Original instruction: li v364,12
li $t3,12
# Original instruction: mul v363,v361,v364
mul $t0,$t0,$t3
# Original instruction: add v362,v359,v363
add $t3,$t2,$t0
# Original instruction: addiu v365,$fp,-52
addiu $t0,$fp,-52
# Original instruction: lw v366,0(v365)
lw $t0,0($t0)
# Original instruction: li v369,4
li $t2,4
# Original instruction: mul v368,v366,v369
mul $t0,$t0,$t2
# Original instruction: add v367,v362,v368
add $t0,$t3,$t0
# Original instruction: lw v370,0(v367)
lw $t0,0($t0)
# Original instruction: sub v371,v358,v370
sub $t0,$t4,$t0
# Original instruction: addiu v372,$fp,-56
addiu $t2,$fp,-56
# Loading from v371 from reg into v372
# Original instruction: sw v371,0(v372)
sw $t0,0($t2)
label_75_end:
# Original instruction: addiu v373,$fp,-52
addiu $t0,$fp,-52
# Original instruction: lw v374,0(v373)
lw $t0,0($t0)
# Original instruction: addi v375,$zero,1
addi $t2,$zero,1
# Original instruction: add v376,v374,v375
add $t0,$t0,$t2
# Original instruction: addiu v377,$fp,-52
addiu $t2,$fp,-52
# Loading from v376 from reg into v377
# Original instruction: sw v376,0(v377)
sw $t0,0($t2)
# Original instruction: j label_72_while_start
j label_72_while_start
label_73_while_end:
# Original instruction: addiu v378,$fp,-48
addiu $t0,$fp,-48
# Original instruction: lw v379,0(v378)
lw $t0,0($t0)
# Original instruction: addi v380,$zero,1
addi $t2,$zero,1
# Original instruction: add v381,v379,v380
add $t2,$t0,$t2
# Original instruction: addiu v382,$fp,-48
addiu $t0,$fp,-48
# Loading from v381 from reg into v382
# Original instruction: sw v381,0(v382)
sw $t2,0($t0)
# Original instruction: j label_70_while_start
j label_70_while_start
label_71_while_end:
# Return statement start
# Original instruction: addiu v383,$fp,-56
addiu $t0,$fp,-56
# Original instruction: addiu v384,$fp,0
addiu $t6,$fp,0
# 
# Loading from v383 from stack into v384
# Original instruction: li v385,4
li $t2,4
# Original instruction: li v386,0
li $t5,0
label_76_mem_copy_loop:
# Original instruction: beq v386,v385,label_77_mem_copy_end
beq $t5,$t2,label_77_mem_copy_end
# Original instruction: add v387,v383,v386
add $t3,$t0,$t5
# Original instruction: lb v389,0(v387)
lb $t4,0($t3)
# Original instruction: add v388,v384,v386
add $t3,$t6,$t5
# Original instruction: sb v389,0(v388)
sb $t4,0($t3)
# Original instruction: addi v386,v386,1
addi $t5,$t5,1
# Original instruction: j label_76_mem_copy_loop
j label_76_mem_copy_loop
label_77_mem_copy_end:
# 
# Original instruction: jal matrixCalcEND
jal matrixCalcEND
# Return statement end
# BEGIN EPILOGUE
matrixCalcEND:
# Original instruction: addi $sp,v270,0
addi $sp,$t1,0
# Original instruction: popRegisters
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
# Labels:
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
deepNestedCalculations:
# Clearing entire allocated stack frame of size 28
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
label_80_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,29
slti $t2,$t0,29
# Original instruction: bne $t2,$zero,label_80_clean_loop
bne $t2,$zero,label_80_clean_loop
label_81_clean_loop_end:
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
# Original instruction: addiu $sp,$fp,-28
addiu $sp,$fp,-28
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
# Original instruction: addi v390,$sp,0
addi $t2,$sp,0
# END PROLOGUE
# Original instruction: addiu v391,$fp,12
addiu $t0,$fp,12
# Original instruction: lw v392,0(v391)
lw $t0,0($t0)
# Original instruction: addiu v393,$fp,8
addiu $t1,$fp,8
# Original instruction: lw v394,0(v393)
lw $t1,0($t1)
# Original instruction: add v395,v392,v394
add $t0,$t0,$t1
# Original instruction: addiu v396,$fp,-12
addiu $t1,$fp,-12
# Loading from v395 from reg into v396
# Original instruction: sw v395,0(v396)
sw $t0,0($t1)
# Original instruction: addiu v397,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v398,0(v397)
lw $t0,0($t0)
# Original instruction: addiu v399,$fp,4
addiu $t1,$fp,4
# Original instruction: lw v400,0(v399)
lw $t1,0($t1)
# Original instruction: mul v401,v398,v400
mul $t0,$t0,$t1
# Original instruction: addiu v402,$fp,-28
addiu $t1,$fp,-28
# Loading from v401 from reg into v402
# Original instruction: sw v401,0(v402)
sw $t0,0($t1)
# Original instruction: addiu v403,$fp,-28
addiu $t0,$fp,-28
# Original instruction: lw v404,0(v403)
lw $t1,0($t0)
# Original instruction: addi v405,$zero,100
addi $t0,$zero,100
# Original instruction: sub v406,v404,v405
sub $t0,$t1,$t0
# Original instruction: beqz v406,label_82_else
beqz $t0,label_82_else
# Original instruction: addiu v407,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v408,0(v407)
lw $t0,0($t0)
# Original instruction: addiu v409,$fp,-28
addiu $t1,$fp,-28
# Original instruction: lw v410,0(v409)
lw $t1,0($t1)
# Original instruction: add v411,v408,v410
add $t1,$t0,$t1
# Original instruction: addiu v412,$fp,-12
addiu $t0,$fp,-12
# Loading from v411 from reg into v412
# Original instruction: sw v411,0(v412)
sw $t1,0($t0)
# Original instruction: j label_83_end
j label_83_end
label_82_else:
# Original instruction: addiu v413,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v414,0(v413)
lw $t0,0($t0)
# Original instruction: addiu v415,$fp,-28
addiu $t1,$fp,-28
# Original instruction: lw v416,0(v415)
lw $t1,0($t1)
# Original instruction: sub v417,v414,v416
sub $t1,$t0,$t1
# Original instruction: addiu v418,$fp,-12
addiu $t0,$fp,-12
# Loading from v417 from reg into v418
# Original instruction: sw v417,0(v418)
sw $t1,0($t0)
label_83_end:
# Original instruction: addi v419,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v420,$fp,-16
addiu $t1,$fp,-16
# Loading from v419 from reg into v420
# Original instruction: sw v419,0(v420)
sw $t0,0($t1)
label_84_while_start:
# Original instruction: addiu v421,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v422,0(v421)
lw $t0,0($t0)
# Original instruction: addi v423,$zero,3
addi $t1,$zero,3
# Original instruction: slt v424,v422,v423
slt $t0,$t0,$t1
# Original instruction: beqz v424,label_85_while_end
beqz $t0,label_85_while_end
# Original instruction: addi v425,$zero,0
addi $t1,$zero,0
# Original instruction: addiu v426,$fp,-20
addiu $t0,$fp,-20
# Loading from v425 from reg into v426
# Original instruction: sw v425,0(v426)
sw $t1,0($t0)
label_86_while_start:
# Original instruction: addiu v427,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v428,0(v427)
lw $t0,0($t0)
# Original instruction: addi v429,$zero,3
addi $t1,$zero,3
# Original instruction: slt v430,v428,v429
slt $t0,$t0,$t1
# Original instruction: beqz v430,label_87_while_end
beqz $t0,label_87_while_end
# Original instruction: addiu v431,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v432,0(v431)
lw $t0,0($t0)
# Original instruction: addiu v433,$fp,-20
addiu $t1,$fp,-20
# Original instruction: lw v434,0(v433)
lw $t1,0($t1)
# Original instruction: mul v435,v432,v434
mul $t1,$t0,$t1
# Original instruction: addi v436,$zero,2
addi $t0,$zero,2
# Original instruction: sub v437,v435,v436
sub $t0,$t1,$t0
# Original instruction: beqz v437,label_88_else
beqz $t0,label_88_else
# Original instruction: addiu v438,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v439,0(v438)
lw $t1,0($t0)
# Original instruction: addiu v440,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v441,0(v440)
lw $t0,0($t0)
# Original instruction: addiu v442,$fp,-20
addiu $t3,$fp,-20
# Original instruction: lw v443,0(v442)
lw $t3,0($t3)
# Original instruction: mul v444,v441,v443
mul $t0,$t0,$t3
# Original instruction: add v445,v439,v444
add $t1,$t1,$t0
# Original instruction: addiu v446,$fp,-12
addiu $t0,$fp,-12
# Loading from v445 from reg into v446
# Original instruction: sw v445,0(v446)
sw $t1,0($t0)
# Original instruction: j label_89_end
j label_89_end
label_88_else:
# Original instruction: addiu v447,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v448,0(v447)
lw $t3,0($t0)
# Original instruction: addiu v449,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v450,0(v449)
lw $t0,0($t0)
# Original instruction: addiu v451,$fp,-20
addiu $t1,$fp,-20
# Original instruction: lw v452,0(v451)
lw $t1,0($t1)
# Original instruction: add v453,v450,v452
add $t0,$t0,$t1
# Original instruction: sub v454,v448,v453
sub $t1,$t3,$t0
# Original instruction: addiu v455,$fp,-12
addiu $t0,$fp,-12
# Loading from v454 from reg into v455
# Original instruction: sw v454,0(v455)
sw $t1,0($t0)
label_89_end:
# Original instruction: addiu v456,$fp,-20
addiu $t0,$fp,-20
# Original instruction: lw v457,0(v456)
lw $t1,0($t0)
# Original instruction: addi v458,$zero,1
addi $t0,$zero,1
# Original instruction: add v459,v457,v458
add $t1,$t1,$t0
# Original instruction: addiu v460,$fp,-20
addiu $t0,$fp,-20
# Loading from v459 from reg into v460
# Original instruction: sw v459,0(v460)
sw $t1,0($t0)
# Original instruction: j label_86_while_start
j label_86_while_start
label_87_while_end:
# Original instruction: addiu v461,$fp,-16
addiu $t0,$fp,-16
# Original instruction: lw v462,0(v461)
lw $t1,0($t0)
# Original instruction: addi v463,$zero,1
addi $t0,$zero,1
# Original instruction: add v464,v462,v463
add $t0,$t1,$t0
# Original instruction: addiu v465,$fp,-16
addiu $t1,$fp,-16
# Loading from v464 from reg into v465
# Original instruction: sw v464,0(v465)
sw $t0,0($t1)
# Original instruction: j label_84_while_start
j label_84_while_start
label_85_while_end:
# Return statement start
# Original instruction: addiu v466,$fp,-12
addiu $t6,$fp,-12
# Original instruction: addiu v467,$fp,0
addiu $t3,$fp,0
# 
# Loading from v466 from stack into v467
# Original instruction: li v468,4
li $t5,4
# Original instruction: li v469,0
li $t4,0
label_90_mem_copy_loop:
# Original instruction: beq v469,v468,label_91_mem_copy_end
beq $t4,$t5,label_91_mem_copy_end
# Original instruction: add v470,v466,v469
add $t0,$t6,$t4
# Original instruction: lb v472,0(v470)
lb $t1,0($t0)
# Original instruction: add v471,v467,v469
add $t0,$t3,$t4
# Original instruction: sb v472,0(v471)
sb $t1,0($t0)
# Original instruction: addi v469,v469,1
addi $t4,$t4,1
# Original instruction: j label_90_mem_copy_loop
j label_90_mem_copy_loop
label_91_mem_copy_end:
# 
# Original instruction: jal deepNestedCalculationsEND
jal deepNestedCalculationsEND
# Return statement end
# BEGIN EPILOGUE
deepNestedCalculationsEND:
# Original instruction: addi $sp,v390,0
addi $sp,$t2,0
# Original instruction: popRegisters
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
# Labels:
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
# Clearing entire allocated stack frame of size 100
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
label_93_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,101
slti $t2,$t0,101
# Original instruction: bne $t2,$zero,label_93_clean_loop
bne $t2,$zero,label_93_clean_loop
label_94_clean_loop_end:
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
# Original instruction: addiu $sp,$fp,-100
addiu $sp,$fp,-100
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
# Original instruction: addi v473,$sp,0
addi $t1,$sp,0
# END PROLOGUE
# BEGIN FUNCALL EXPR FOR registerStress
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal registerStress
jal registerStress
# BACK FROM FUNCTION
# Original instruction: addi v474,$sp,0
addi $t4,$sp,0
# Original instruction: addiu v475,$fp,-12
addiu $t6,$fp,-12
# 
# Loading from v474 from stack into v475
# Original instruction: li v476,4
li $t5,4
# Original instruction: li v477,0
li $t2,0
label_95_mem_copy_loop:
# Original instruction: beq v477,v476,label_96_mem_copy_end
beq $t2,$t5,label_96_mem_copy_end
# Original instruction: add v478,v474,v477
add $t0,$t4,$t2
# Original instruction: lb v480,0(v478)
lb $t0,0($t0)
# Original instruction: add v479,v475,v477
add $t3,$t6,$t2
# Original instruction: sb v480,0(v479)
sb $t0,0($t3)
# Original instruction: addi v477,v477,1
addi $t2,$t2,1
# Original instruction: j label_95_mem_copy_loop
j label_95_mem_copy_loop
label_96_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR complexLogic
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v481,$zero,42
addi $t2,$zero,42
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v482,$sp,0
addi $t0,$sp,0
# Loading from v481 from reg into v482
# Original instruction: sw v481,0(v482)
sw $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal complexLogic
jal complexLogic
# BACK FROM FUNCTION
# Original instruction: addi v483,$sp,0
addi $t2,$sp,0
# Original instruction: addiu v484,$fp,-16
addiu $t4,$fp,-16
# 
# Loading from v483 from stack into v484
# Original instruction: li v485,4
li $t3,4
# Original instruction: li v486,0
li $t0,0
label_97_mem_copy_loop:
# Original instruction: beq v486,v485,label_98_mem_copy_end
beq $t0,$t3,label_98_mem_copy_end
# Original instruction: add v487,v483,v486
add $t5,$t2,$t0
# Original instruction: lb v489,0(v487)
lb $t5,0($t5)
# Original instruction: add v488,v484,v486
add $t6,$t4,$t0
# Original instruction: sb v489,0(v488)
sb $t5,0($t6)
# Original instruction: addi v486,v486,1
addi $t0,$t0,1
# Original instruction: j label_97_mem_copy_loop
j label_97_mem_copy_loop
label_98_mem_copy_end:
# 
# Original instruction: addi v490,$zero,80
addi $t2,$zero,80
# Original instruction: addiu v491,$fp,-64
addiu $t0,$fp,-64
# Original instruction: addiu v492,v491,0
addiu $t0,$t0,0
# Loading from v490 from reg into v492
# Original instruction: sw v490,0(v492)
sw $t2,0($t0)
# Original instruction: addi v493,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v494,$fp,-68
addiu $t2,$fp,-68
# Loading from v493 from reg into v494
# Original instruction: sw v493,0(v494)
sw $t0,0($t2)
label_99_while_start:
# Original instruction: addiu v495,$fp,-68
addiu $t0,$fp,-68
# Original instruction: lw v496,0(v495)
lw $t0,0($t0)
# Original instruction: addi v497,$zero,10
addi $t2,$zero,10
# Original instruction: slt v498,v496,v497
slt $t0,$t0,$t2
# Original instruction: beqz v498,label_100_while_end
beqz $t0,label_100_while_end
# Original instruction: addiu v499,$fp,-68
addiu $t0,$fp,-68
# Original instruction: lw v500,0(v499)
lw $t2,0($t0)
# Original instruction: addi v501,$zero,1
addi $t0,$zero,1
# Original instruction: add v502,v500,v501
add $t0,$t2,$t0
# Original instruction: addiu v503,$fp,-64
addiu $t2,$fp,-64
# Original instruction: addiu v504,v503,4
addiu $t3,$t2,4
# Original instruction: addiu v505,$fp,-68
addiu $t2,$fp,-68
# Original instruction: lw v506,0(v505)
lw $t2,0($t2)
# Original instruction: li v509,4
li $t4,4
# Original instruction: mul v508,v506,v509
mul $t2,$t2,$t4
# Original instruction: add v507,v504,v508
add $t2,$t3,$t2
# Loading from v502 from reg into v507
# Original instruction: sw v502,0(v507)
sw $t0,0($t2)
# Original instruction: addiu v510,$fp,-68
addiu $t0,$fp,-68
# Original instruction: lw v511,0(v510)
lw $t0,0($t0)
# Original instruction: addi v512,$zero,1
addi $t2,$zero,1
# Original instruction: add v513,v511,v512
add $t2,$t0,$t2
# Original instruction: addiu v514,$fp,-68
addiu $t0,$fp,-68
# Loading from v513 from reg into v514
# Original instruction: sw v513,0(v514)
sw $t2,0($t0)
# Original instruction: j label_99_while_start
j label_99_while_start
label_100_while_end:
# Original instruction: addi v515,$zero,88
addi $t2,$zero,88
# Original instruction: addiu v516,$fp,-64
addiu $t0,$fp,-64
# Original instruction: addiu v517,v516,44
addiu $t0,$t0,44
# Loading from v515 from reg into v517
# Original instruction: sb v515,0(v517)
sb $t2,0($t0)
# BEGIN FUNCALL EXPR FOR processBigData
# LOADING ARG: ast.StructType@799f10e1
# GETTING  VALUE
# Original instruction: addiu v518,$fp,-64
addiu $t3,$fp,-64
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-48
addiu $sp,$sp,-48
# Original instruction: addi v519,$sp,0
addi $t4,$sp,0
# 
# Loading from v518 from stack into v519
# Original instruction: li v520,48
li $t6,48
# Original instruction: li v521,0
li $t2,0
label_101_mem_copy_loop:
# Original instruction: beq v521,v520,label_102_mem_copy_end
beq $t2,$t6,label_102_mem_copy_end
# Original instruction: add v522,v518,v521
add $t0,$t3,$t2
# Original instruction: lb v524,0(v522)
lb $t0,0($t0)
# Original instruction: add v523,v519,v521
add $t5,$t4,$t2
# Original instruction: sb v524,0(v523)
sb $t0,0($t5)
# Original instruction: addi v521,v521,1
addi $t2,$t2,1
# Original instruction: j label_101_mem_copy_loop
j label_101_mem_copy_loop
label_102_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-48
addiu $sp,$sp,-48
# GO TO FUNCTION
# Original instruction: jal processBigData
jal processBigData
# BACK FROM FUNCTION
# Original instruction: addi v525,$sp,0
addi $t6,$sp,0
# Original instruction: addiu v526,$fp,-64
addiu $t2,$fp,-64
# 
# Loading from v525 from stack into v526
# Original instruction: li v527,48
li $t5,48
# Original instruction: li v528,0
li $t0,0
label_103_mem_copy_loop:
# Original instruction: beq v528,v527,label_104_mem_copy_end
beq $t0,$t5,label_104_mem_copy_end
# Original instruction: add v529,v525,v528
add $t3,$t6,$t0
# Original instruction: lb v531,0(v529)
lb $t3,0($t3)
# Original instruction: add v530,v526,v528
add $t4,$t2,$t0
# Original instruction: sb v531,0(v530)
sb $t3,0($t4)
# Original instruction: addi v528,v528,1
addi $t0,$t0,1
# Original instruction: j label_103_mem_copy_loop
j label_103_mem_copy_loop
label_104_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR recursiveSum
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v532,$zero,5
addi $t2,$zero,5
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v533,$sp,0
addi $t0,$sp,0
# Loading from v532 from reg into v533
# Original instruction: sw v532,0(v533)
sw $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal recursiveSum
jal recursiveSum
# BACK FROM FUNCTION
# Original instruction: addi v534,$sp,0
addi $t6,$sp,0
# Original instruction: addiu v535,$fp,-72
addiu $t0,$fp,-72
# 
# Loading from v534 from stack into v535
# Original instruction: li v536,4
li $t5,4
# Original instruction: li v537,0
li $t2,0
label_105_mem_copy_loop:
# Original instruction: beq v537,v536,label_106_mem_copy_end
beq $t2,$t5,label_106_mem_copy_end
# Original instruction: add v538,v534,v537
add $t3,$t6,$t2
# Original instruction: lb v540,0(v538)
lb $t3,0($t3)
# Original instruction: add v539,v535,v537
add $t4,$t0,$t2
# Original instruction: sb v540,0(v539)
sb $t3,0($t4)
# Original instruction: addi v537,v537,1
addi $t2,$t2,1
# Original instruction: j label_105_mem_copy_loop
j label_105_mem_copy_loop
label_106_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR matrixCalc
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal matrixCalc
jal matrixCalc
# BACK FROM FUNCTION
# Original instruction: addi v541,$sp,0
addi $t5,$sp,0
# Original instruction: addiu v542,$fp,-80
addiu $t0,$fp,-80
# 
# Loading from v541 from stack into v542
# Original instruction: li v543,4
li $t6,4
# Original instruction: li v544,0
li $t3,0
label_107_mem_copy_loop:
# Original instruction: beq v544,v543,label_108_mem_copy_end
beq $t3,$t6,label_108_mem_copy_end
# Original instruction: add v545,v541,v544
add $t2,$t5,$t3
# Original instruction: lb v547,0(v545)
lb $t4,0($t2)
# Original instruction: add v546,v542,v544
add $t2,$t0,$t3
# Original instruction: sb v547,0(v546)
sb $t4,0($t2)
# Original instruction: addi v544,v544,1
addi $t3,$t3,1
# Original instruction: j label_107_mem_copy_loop
j label_107_mem_copy_loop
label_108_mem_copy_end:
# 
# BEGIN FUNCALL EXPR FOR deepNestedCalculations
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v548,$zero,3
addi $t2,$zero,3
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v549,$sp,0
addi $t0,$sp,0
# Loading from v548 from reg into v549
# Original instruction: sw v548,0(v549)
sw $t2,0($t0)
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v550,$zero,4
addi $t2,$zero,4
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v551,$sp,0
addi $t0,$sp,0
# Loading from v550 from reg into v551
# Original instruction: sw v550,0(v551)
sw $t2,0($t0)
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addi v552,$zero,5
addi $t2,$zero,5
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v553,$sp,0
addi $t0,$sp,0
# Loading from v552 from reg into v553
# Original instruction: sw v552,0(v553)
sw $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# GO TO FUNCTION
# Original instruction: jal deepNestedCalculations
jal deepNestedCalculations
# BACK FROM FUNCTION
# Original instruction: addi v554,$sp,0
addi $t3,$sp,0
# Original instruction: addiu v555,$fp,-76
addiu $t4,$fp,-76
# 
# Loading from v554 from stack into v555
# Original instruction: li v556,4
li $t5,4
# Original instruction: li v557,0
li $t2,0
label_109_mem_copy_loop:
# Original instruction: beq v557,v556,label_110_mem_copy_end
beq $t2,$t5,label_110_mem_copy_end
# Original instruction: add v558,v554,v557
add $t0,$t3,$t2
# Original instruction: lb v560,0(v558)
lb $t0,0($t0)
# Original instruction: add v559,v555,v557
add $t6,$t4,$t2
# Original instruction: sb v560,0(v559)
sb $t0,0($t6)
# Original instruction: addi v557,v557,1
addi $t2,$t2,1
# Original instruction: j label_109_mem_copy_loop
j label_109_mem_copy_loop
label_110_mem_copy_end:
# 
# Original instruction: addiu v561,$fp,-12
addiu $t0,$fp,-12
# Original instruction: lw v562,0(v561)
lw $t0,0($t0)
# Original instruction: addiu v563,$fp,-16
addiu $t2,$fp,-16
# Original instruction: lw v564,0(v563)
lw $t2,0($t2)
# Original instruction: add v565,v562,v564
add $t0,$t0,$t2
# Original instruction: addiu v566,$fp,-64
addiu $t2,$fp,-64
# Original instruction: addiu v567,v566,0
addiu $t2,$t2,0
# Original instruction: lw v568,0(v567)
lw $t2,0($t2)
# Original instruction: add v569,v565,v568
add $t2,$t0,$t2
# Original instruction: addiu v570,$fp,-72
addiu $t0,$fp,-72
# Original instruction: lw v571,0(v570)
lw $t0,0($t0)
# Original instruction: add v572,v569,v571
add $t2,$t2,$t0
# Original instruction: addiu v573,$fp,-80
addiu $t0,$fp,-80
# Original instruction: lw v574,0(v573)
lw $t0,0($t0)
# Original instruction: add v575,v572,v574
add $t2,$t2,$t0
# Original instruction: addiu v576,$fp,-76
addiu $t0,$fp,-76
# Original instruction: lw v577,0(v576)
lw $t0,0($t0)
# Original instruction: add v578,v575,v577
add $t0,$t2,$t0
# Original instruction: addiu v579,$fp,-84
addiu $t2,$fp,-84
# Loading from v578 from reg into v579
# Original instruction: sw v578,0(v579)
sw $t0,0($t2)
# Original instruction: addi v580,$zero,1000
addi $t0,$zero,1000
# Original instruction: addiu v581,$fp,-88
addiu $t2,$fp,-88
# Loading from v580 from reg into v581
# Original instruction: sw v580,0(v581)
sw $t0,0($t2)
# Original instruction: addiu v582,$fp,-88
addiu $t0,$fp,-88
# Original instruction: lw v583,0(v582)
lw $t2,0($t0)
# Original instruction: addi v584,$zero,500
addi $t0,$zero,500
# Original instruction: add v585,v583,v584
add $t0,$t2,$t0
# Original instruction: addiu v586,$fp,-92
addiu $t2,$fp,-92
# Loading from v585 from reg into v586
# Original instruction: sw v585,0(v586)
sw $t0,0($t2)
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v587,$fp,-92
addiu $t3,$fp,-92
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v588,$sp,0
addi $t6,$sp,0
# 
# Loading from v587 from stack into v588
# Original instruction: li v589,4
li $t0,4
# Original instruction: li v590,0
li $t5,0
label_111_mem_copy_loop:
# Original instruction: beq v590,v589,label_112_mem_copy_end
beq $t5,$t0,label_112_mem_copy_end
# Original instruction: add v591,v587,v590
add $t2,$t3,$t5
# Original instruction: lb v593,0(v591)
lb $t2,0($t2)
# Original instruction: add v592,v588,v590
add $t4,$t6,$t5
# Original instruction: sb v593,0(v592)
sb $t2,0($t4)
# Original instruction: addi v590,v590,1
addi $t5,$t5,1
# Original instruction: j label_111_mem_copy_loop
j label_111_mem_copy_loop
label_112_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v595,$zero,44
addi $t2,$zero,44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v596,$sp,0
addi $t0,$sp,0
# Loading from v595 from reg into v596
# Original instruction: sb v595,0(v596)
sb $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v598,$fp,-88
addiu $t2,$fp,-88
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v599,$sp,0
addi $t3,$sp,0
# 
# Loading from v598 from stack into v599
# Original instruction: li v600,4
li $t4,4
# Original instruction: li v601,0
li $t6,0
label_113_mem_copy_loop:
# Original instruction: beq v601,v600,label_114_mem_copy_end
beq $t6,$t4,label_114_mem_copy_end
# Original instruction: add v602,v598,v601
add $t0,$t2,$t6
# Original instruction: lb v604,0(v602)
lb $t0,0($t0)
# Original instruction: add v603,v599,v601
add $t5,$t3,$t6
# Original instruction: sb v604,0(v603)
sb $t0,0($t5)
# Original instruction: addi v601,v601,1
addi $t6,$t6,1
# Original instruction: j label_113_mem_copy_loop
j label_113_mem_copy_loop
label_114_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v606,$zero,44
addi $t0,$zero,44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v607,$sp,0
addi $t2,$sp,0
# Loading from v606 from reg into v607
# Original instruction: sb v606,0(v607)
sb $t0,0($t2)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# Original instruction: addi v609,$zero,300
addi $t0,$zero,300
# Original instruction: addiu v610,$fp,-96
addiu $t2,$fp,-96
# Loading from v609 from reg into v610
# Original instruction: sw v609,0(v610)
sw $t0,0($t2)
# Original instruction: addi v611,$zero,400
addi $t2,$zero,400
# Original instruction: addiu v612,$fp,-100
addiu $t0,$fp,-100
# Loading from v611 from reg into v612
# Original instruction: sw v611,0(v612)
sw $t2,0($t0)
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v613,$fp,-100
addiu $t3,$fp,-100
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v614,$sp,0
addi $t6,$sp,0
# 
# Loading from v613 from stack into v614
# Original instruction: li v615,4
li $t2,4
# Original instruction: li v616,0
li $t5,0
label_115_mem_copy_loop:
# Original instruction: beq v616,v615,label_116_mem_copy_end
beq $t5,$t2,label_116_mem_copy_end
# Original instruction: add v617,v613,v616
add $t0,$t3,$t5
# Original instruction: lb v619,0(v617)
lb $t0,0($t0)
# Original instruction: add v618,v614,v616
add $t4,$t6,$t5
# Original instruction: sb v619,0(v618)
sb $t0,0($t4)
# Original instruction: addi v616,v616,1
addi $t5,$t5,1
# Original instruction: j label_115_mem_copy_loop
j label_115_mem_copy_loop
label_116_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v621,$zero,44
addi $t0,$zero,44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v622,$sp,0
addi $t2,$sp,0
# Loading from v621 from reg into v622
# Original instruction: sb v621,0(v622)
sb $t0,0($t2)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v624,$fp,-96
addiu $t2,$fp,-96
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v625,$sp,0
addi $t5,$sp,0
# 
# Loading from v624 from stack into v625
# Original instruction: li v626,4
li $t0,4
# Original instruction: li v627,0
li $t3,0
label_117_mem_copy_loop:
# Original instruction: beq v627,v626,label_118_mem_copy_end
beq $t3,$t0,label_118_mem_copy_end
# Original instruction: add v628,v624,v627
add $t4,$t2,$t3
# Original instruction: lb v630,0(v628)
lb $t6,0($t4)
# Original instruction: add v629,v625,v627
add $t4,$t5,$t3
# Original instruction: sb v630,0(v629)
sb $t6,0($t4)
# Original instruction: addi v627,v627,1
addi $t3,$t3,1
# Original instruction: j label_117_mem_copy_loop
j label_117_mem_copy_loop
label_118_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v632,$zero,44
addi $t2,$zero,44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v633,$sp,0
addi $t0,$sp,0
# Loading from v632 from reg into v633
# Original instruction: sb v632,0(v633)
sb $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v635,$fp,-84
addiu $t4,$fp,-84
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v636,$sp,0
addi $t0,$sp,0
# 
# Loading from v635 from stack into v636
# Original instruction: li v637,4
li $t2,4
# Original instruction: li v638,0
li $t5,0
label_119_mem_copy_loop:
# Original instruction: beq v638,v637,label_120_mem_copy_end
beq $t5,$t2,label_120_mem_copy_end
# Original instruction: add v639,v635,v638
add $t3,$t4,$t5
# Original instruction: lb v641,0(v639)
lb $t3,0($t3)
# Original instruction: add v640,v636,v638
add $t6,$t0,$t5
# Original instruction: sb v641,0(v640)
sb $t3,0($t6)
# Original instruction: addi v638,v638,1
addi $t5,$t5,1
# Original instruction: j label_119_mem_copy_loop
j label_119_mem_copy_loop
label_120_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v643,$zero,44
addi $t2,$zero,44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v644,$sp,0
addi $t0,$sp,0
# Loading from v643 from reg into v644
# Original instruction: sb v643,0(v644)
sb $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v646,$fp,-12
addiu $t6,$fp,-12
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v647,$sp,0
addi $t2,$sp,0
# 
# Loading from v646 from stack into v647
# Original instruction: li v648,4
li $t0,4
# Original instruction: li v649,0
li $t5,0
label_121_mem_copy_loop:
# Original instruction: beq v649,v648,label_122_mem_copy_end
beq $t5,$t0,label_122_mem_copy_end
# Original instruction: add v650,v646,v649
add $t3,$t6,$t5
# Original instruction: lb v652,0(v650)
lb $t4,0($t3)
# Original instruction: add v651,v647,v649
add $t3,$t2,$t5
# Original instruction: sb v652,0(v651)
sb $t4,0($t3)
# Original instruction: addi v649,v649,1
addi $t5,$t5,1
# Original instruction: j label_121_mem_copy_loop
j label_121_mem_copy_loop
label_122_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v654,$zero,44
addi $t0,$zero,44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v655,$sp,0
addi $t2,$sp,0
# Loading from v654 from reg into v655
# Original instruction: sb v654,0(v655)
sb $t0,0($t2)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v657,$fp,-16
addiu $t0,$fp,-16
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v658,$sp,0
addi $t3,$sp,0
# 
# Loading from v657 from stack into v658
# Original instruction: li v659,4
li $t5,4
# Original instruction: li v660,0
li $t2,0
label_123_mem_copy_loop:
# Original instruction: beq v660,v659,label_124_mem_copy_end
beq $t2,$t5,label_124_mem_copy_end
# Original instruction: add v661,v657,v660
add $t4,$t0,$t2
# Original instruction: lb v663,0(v661)
lb $t6,0($t4)
# Original instruction: add v662,v658,v660
add $t4,$t3,$t2
# Original instruction: sb v663,0(v662)
sb $t6,0($t4)
# Original instruction: addi v660,v660,1
addi $t2,$t2,1
# Original instruction: j label_123_mem_copy_loop
j label_123_mem_copy_loop
label_124_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v665,$zero,44
addi $t0,$zero,44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v666,$sp,0
addi $t2,$sp,0
# Loading from v665 from reg into v666
# Original instruction: sb v665,0(v666)
sb $t0,0($t2)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v668,$fp,-64
addiu $t0,$fp,-64
# Original instruction: addiu v669,v668,0
addiu $t2,$t0,0
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v670,$sp,0
addi $t6,$sp,0
# 
# Loading from v669 from stack into v670
# Original instruction: li v671,4
li $t4,4
# Original instruction: li v672,0
li $t5,0
label_125_mem_copy_loop:
# Original instruction: beq v672,v671,label_126_mem_copy_end
beq $t5,$t4,label_126_mem_copy_end
# Original instruction: add v673,v669,v672
add $t0,$t2,$t5
# Original instruction: lb v675,0(v673)
lb $t3,0($t0)
# Original instruction: add v674,v670,v672
add $t0,$t6,$t5
# Original instruction: sb v675,0(v674)
sb $t3,0($t0)
# Original instruction: addi v672,v672,1
addi $t5,$t5,1
# Original instruction: j label_125_mem_copy_loop
j label_125_mem_copy_loop
label_126_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v677,$zero,44
addi $t0,$zero,44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v678,$sp,0
addi $t2,$sp,0
# Loading from v677 from reg into v678
# Original instruction: sb v677,0(v678)
sb $t0,0($t2)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v680,$fp,-72
addiu $t3,$fp,-72
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v681,$sp,0
addi $t6,$sp,0
# 
# Loading from v680 from stack into v681
# Original instruction: li v682,4
li $t0,4
# Original instruction: li v683,0
li $t4,0
label_127_mem_copy_loop:
# Original instruction: beq v683,v682,label_128_mem_copy_end
beq $t4,$t0,label_128_mem_copy_end
# Original instruction: add v684,v680,v683
add $t2,$t3,$t4
# Original instruction: lb v686,0(v684)
lb $t5,0($t2)
# Original instruction: add v685,v681,v683
add $t2,$t6,$t4
# Original instruction: sb v686,0(v685)
sb $t5,0($t2)
# Original instruction: addi v683,v683,1
addi $t4,$t4,1
# Original instruction: j label_127_mem_copy_loop
j label_127_mem_copy_loop
label_128_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v688,$zero,44
addi $t2,$zero,44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v689,$sp,0
addi $t0,$sp,0
# Loading from v688 from reg into v689
# Original instruction: sb v688,0(v689)
sb $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v691,$fp,-80
addiu $t3,$fp,-80
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v692,$sp,0
addi $t5,$sp,0
# 
# Loading from v691 from stack into v692
# Original instruction: li v693,4
li $t0,4
# Original instruction: li v694,0
li $t6,0
label_129_mem_copy_loop:
# Original instruction: beq v694,v693,label_130_mem_copy_end
beq $t6,$t0,label_130_mem_copy_end
# Original instruction: add v695,v691,v694
add $t2,$t3,$t6
# Original instruction: lb v697,0(v695)
lb $t4,0($t2)
# Original instruction: add v696,v692,v694
add $t2,$t5,$t6
# Original instruction: sb v697,0(v696)
sb $t4,0($t2)
# Original instruction: addi v694,v694,1
addi $t6,$t6,1
# Original instruction: j label_129_mem_copy_loop
j label_129_mem_copy_loop
label_130_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v699,$zero,44
addi $t2,$zero,44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v700,$sp,0
addi $t0,$sp,0
# Loading from v699 from reg into v700
# Original instruction: sb v699,0(v700)
sb $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v702,$fp,-76
addiu $t2,$fp,-76
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v703,$sp,0
addi $t5,$sp,0
# 
# Loading from v702 from stack into v703
# Original instruction: li v704,4
li $t6,4
# Original instruction: li v705,0
li $t3,0
label_131_mem_copy_loop:
# Original instruction: beq v705,v704,label_132_mem_copy_end
beq $t3,$t6,label_132_mem_copy_end
# Original instruction: add v706,v702,v705
add $t0,$t2,$t3
# Original instruction: lb v708,0(v706)
lb $t4,0($t0)
# Original instruction: add v707,v703,v705
add $t0,$t5,$t3
# Original instruction: sb v708,0(v707)
sb $t4,0($t0)
# Original instruction: addi v705,v705,1
addi $t3,$t3,1
# Original instruction: j label_131_mem_copy_loop
j label_131_mem_copy_loop
label_132_mem_copy_end:
# 
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_c
# LOADING ARG: CHAR
# GETTING  VALUE
# Original instruction: addi v710,$zero,44
addi $t0,$zero,44
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v711,$sp,0
addi $t2,$sp,0
# Loading from v710 from reg into v711
# Original instruction: sb v710,0(v711)
sb $t0,0($t2)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_c
jal print_c
# BACK FROM FUNCTION
# BEGIN FUNCALL EXPR FOR print_i
# LOADING ARG: INT
# GETTING  VALUE
# Original instruction: addiu v713,$fp,-84
addiu $t0,$fp,-84
# Original instruction: lw v714,0(v713)
lw $t0,0($t0)
# Original instruction: addiu v715,$fp,-12
addiu $t2,$fp,-12
# Original instruction: lw v716,0(v715)
lw $t2,0($t2)
# Original instruction: add v717,v714,v716
add $t0,$t0,$t2
# Original instruction: addiu v718,$fp,-16
addiu $t2,$fp,-16
# Original instruction: lw v719,0(v718)
lw $t2,0($t2)
# Original instruction: add v720,v717,v719
add $t2,$t0,$t2
# VALUE CAUGHT
# Original instruction: addiu $sp,$sp,-4
addiu $sp,$sp,-4
# Original instruction: addi v721,$sp,0
addi $t0,$sp,0
# Loading from v720 from reg into v721
# Original instruction: sw v720,0(v721)
sw $t2,0($t0)
# SPACE FOR RETURN VALUE
# Original instruction: addiu $sp,$sp,0
addiu $sp,$sp,0
# GO TO FUNCTION
# Original instruction: jal print_i
jal print_i
# BACK FROM FUNCTION
# Return statement start
# Original instruction: addi v723,$zero,0
addi $t0,$zero,0
# Original instruction: addiu v724,$fp,0
addiu $t2,$fp,0
# Loading from v723 from reg into v724
# Original instruction: sw v723,0(v724)
sw $t0,0($t2)
# Original instruction: jal mainEND
jal mainEND
# Return statement end
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v473,0
addi $sp,$t1,0
# Original instruction: popRegisters
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
# Labels:
# Original instruction: addiu $sp,$fp,0
addiu $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# END EPILOGUE
# Original instruction: jr $ra
jr $ra

