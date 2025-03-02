.data
label_0_size:
.word 0
label_1_c:
.word 0
label_2_i:
.word 0
label_3_s:
.word 0
# Allocated labels for virtual registers
# Allocated labels for virtual registers
# Allocated labels for virtual registers
# Allocated labels for virtual registers
# Allocated labels for virtual registers
# Allocated labels for virtual registers
# Allocated labels for virtual registers
# Allocated labels for virtual registers
label_22_v2:
.space 4
label_20_v1:
.space 4
label_19_v0:
.space 4

.text
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: jal main
jal main
# Original instruction: li $v0,10
li $v0,10
# Original instruction: syscall
syscall

.text
mcmalloc:
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addi $fp,$sp,4
addi $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addi $sp,$fp,-8
addi $sp,$fp,-8
mcmallocEND:
# Original instruction: addi $sp,$fp,0
addi $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

.text
read_i:
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addi $fp,$sp,4
addi $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addi $sp,$fp,-8
addi $sp,$fp,-8
read_iEND:
# Original instruction: addi $sp,$fp,0
addi $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

.text
read_c:
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addi $fp,$sp,4
addi $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addi $sp,$fp,-8
addi $sp,$fp,-8
read_cEND:
# Original instruction: addi $sp,$fp,0
addi $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

.text
print_c:
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addi $fp,$sp,4
addi $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addi $sp,$fp,-8
addi $sp,$fp,-8
print_cEND:
# Original instruction: addi $sp,$fp,0
addi $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

.text
print_i:
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addi $fp,$sp,4
addi $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addi $sp,$fp,-8
addi $sp,$fp,-8
# Original instruction: lw $a0,4($fp)
lw $a0,4($fp)
# Original instruction: addi $v0,$zero,1
addi $v0,$zero,1
# Original instruction: syscall
syscall
print_iEND:
# Original instruction: addi $sp,$fp,0
addi $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

.text
print_s:
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addi $fp,$sp,4
addi $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addi $sp,$fp,-8
addi $sp,$fp,-8
print_sEND:
# Original instruction: addi $sp,$fp,0
addi $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

.text
main:
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: sw $fp,0($sp)
sw $fp,0($sp)
# Original instruction: addi $fp,$sp,4
addi $fp,$sp,4
# Original instruction: sw $ra,-8($fp)
sw $ra,-8($fp)
# Original instruction: addi $sp,$fp,-8
addi $sp,$fp,-8
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: addi v0,$zero,100
addi $t5,$zero,100
la $t0,label_19_v0
sw $t5,0($t0)
# Original instruction: sw v0,0($sp)
la $t5,label_19_v0
lw $t5,0($t5)
sw $t5,0($sp)
# Original instruction: addi $sp,$sp,-4
addi $sp,$sp,-4
# Original instruction: jal print_i
jal print_i
# Original instruction: lw v1,0($sp)
lw $t5,0($sp)
la $t0,label_20_v1
sw $t5,0($t0)
# Original instruction: addi $sp,$sp,8
addi $sp,$sp,8
# Return statement start
# Original instruction: addi v2,$zero,100
addi $t5,$zero,100
la $t0,label_22_v2
sw $t5,0($t0)
# Original instruction: sw v2,0($fp)
la $t5,label_22_v2
lw $t5,0($t5)
sw $t5,0($fp)
# Original instruction: jal mainEND
jal mainEND
# Return statement end
mainEND:
# Original instruction: addi $sp,$fp,0
addi $sp,$fp,0
# Original instruction: lw $ra,-8($fp)
lw $ra,-8($fp)
# Original instruction: lw $fp,-4($fp)
lw $fp,-4($fp)
# Original instruction: jr $ra
jr $ra

