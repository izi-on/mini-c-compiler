.data
label_889_x:
.word 0
label_890_y:
.word 0
# Allocated labels for virtual registers
# Allocated labels for virtual registers
label_910_v607:
.space 4
# Allocated labels for virtual registers
label_912_v608:
.space 4
# Allocated labels for virtual registers
label_914_v609:
.space 4
# Allocated labels for virtual registers
label_916_v610:
.space 4
# Allocated labels for virtual registers
label_918_v611:
.space 4
# Allocated labels for virtual registers
label_920_v612:
.space 4
# Allocated labels for virtual registers
label_922_v613:
.space 4
# Allocated labels for virtual registers
label_924_v635:
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
label_891_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_891_clean_loop
bne $t2,$zero,label_891_clean_loop
label_892_clean_loop_end:
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
la $t0,label_910_v607
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v607,$sp,0
addi $t5,$sp,0
la $t0,label_910_v607
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
# Original instruction: addi $sp,v607,0
la $t5,label_910_v607
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_910_v607
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
label_893_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_893_clean_loop
bne $t2,$zero,label_893_clean_loop
label_894_clean_loop_end:
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
la $t0,label_912_v608
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v608,$sp,0
addi $t5,$sp,0
la $t0,label_912_v608
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
# Original instruction: addi $sp,v608,0
la $t5,label_912_v608
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_912_v608
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
label_895_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_895_clean_loop
bne $t2,$zero,label_895_clean_loop
label_896_clean_loop_end:
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
la $t0,label_914_v609
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v609,$sp,0
addi $t5,$sp,0
la $t0,label_914_v609
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
# Original instruction: addi $sp,v609,0
la $t5,label_914_v609
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_914_v609
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
label_897_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_897_clean_loop
bne $t2,$zero,label_897_clean_loop
label_898_clean_loop_end:
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
la $t0,label_916_v610
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v610,$sp,0
addi $t5,$sp,0
la $t0,label_916_v610
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
# Original instruction: addi $sp,v610,0
la $t5,label_916_v610
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_916_v610
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
label_899_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_899_clean_loop
bne $t2,$zero,label_899_clean_loop
label_900_clean_loop_end:
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
la $t0,label_918_v611
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v611,$sp,0
addi $t5,$sp,0
la $t0,label_918_v611
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
# Original instruction: addi $sp,v611,0
la $t5,label_918_v611
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_918_v611
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
label_901_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,9
slti $t2,$t0,9
# Original instruction: bne $t2,$zero,label_901_clean_loop
bne $t2,$zero,label_901_clean_loop
label_902_clean_loop_end:
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
la $t0,label_920_v612
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v612,$sp,0
addi $t5,$sp,0
la $t0,label_920_v612
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
# Original instruction: addi $sp,v612,0
la $t5,label_920_v612
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_920_v612
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
f:
# Clearing entire allocated stack frame of size 12
# Original instruction: li $t0,1
li $t0,1
label_904_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,13
slti $t2,$t0,13
# Original instruction: bne $t2,$zero,label_904_clean_loop
bne $t2,$zero,label_904_clean_loop
label_905_clean_loop_end:
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
la $t0,label_922_v613
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v613,$sp,0
addi $t5,$sp,0
la $t0,label_922_v613
sw $t5,0($t0)
# END PROLOGUE
# BEGIN EPILOGUE
fEND:
# Original instruction: addi $sp,v613,0
la $t5,label_922_v613
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_922_v613
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
# Original instruction: li $t0,1
li $t0,1
label_907_clean_loop:
# Original instruction: sub $t1,$sp,$t0
sub $t1,$sp,$t0
# Original instruction: sb $zero,0($t1)
sb $zero,0($t1)
# Original instruction: addi $t0,$t0,1
addi $t0,$t0,1
# Original instruction: slti $t2,$t0,21
slti $t2,$t0,21
# Original instruction: bne $t2,$zero,label_907_clean_loop
bne $t2,$zero,label_907_clean_loop
label_908_clean_loop_end:
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
la $t0,label_924_v635
lw $t0,0($t0)
addi $sp,$sp,-4
sw $t0,0($sp)
# Original instruction: addi v635,$sp,0
addi $t5,$sp,0
la $t0,label_924_v635
sw $t5,0($t0)
# END PROLOGUE
# BEGIN EPILOGUE
mainEND:
# Original instruction: addi $sp,v635,0
la $t5,label_924_v635
lw $t5,0($t5)
addi $sp,$t5,0
# Original instruction: popRegisters
lw $t0,0($sp)
addi $sp,$sp,4
la $t1,label_924_v635
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

