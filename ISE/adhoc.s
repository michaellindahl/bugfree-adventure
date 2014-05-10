.data
		# No memory variables for this program
.text
main:
		# $a0 = 3
addi 	$a0, $0, 3 # 20040003 (1)
		# $a1 = 4
addi 	$a1, $0, 4 # 20050004 (2)
		# $a2 = 7
addi 	$a2, $0, 7 # 20060007 (3)

		# test add
		# $a3 = 3 + 7
add 	$a3, $a0, $a2 # 00863820 (4)

		# test sub
		# $a3 = 3 - 7
sub 	$a3, $a0, $a2 # 00863822 (5)

		# test and
		# $a3 = 3 & 7 = 011 (3)
and 	$a3, $a0, $a2 # 00863824 (6)

		# test or
		# $a3 = 3 & 7 = 111 (7)
or  	$a3, $a0, $a2 # 00863825 (7)

		# test xor
		# $a3 = 3 & 7 = 100 (4)
xor 	$a3, $a0, $a2 # 00863826 (8)

		# test nor
		# $a3 = 3 & 7 = 1111 1111 1111 1111 1111 1111 1111 1000 (-8)?
nor 	$a3, $a0, $a2 # 00863827 (9)

		# test slt
		# $a3 = (3 < 7) 1 : 0 = 1
slt 	$a3, $a0, $a2 # 0086382a (10)

jump:

		# test beq
		# $a3 = $a0 then jump - should not jump
beq 	$a3, $a0, jump # 10e40000 (11) - maybe an invalid jump location

		# test bne
		# $a3 = $a0 then jump - should not jump
bne 	$a3, $a0, skip # 14e40001 (12) - offset = 1, advance_pc (offset << 2) 

j jump  # 0800000a (13) - this is jumping 10 (forward?)

skip:

		# test andi
		# $a3 = 3 & 7 = 011 (3)
andi 	$a3, $a0, 7 # 30870007 (14)

		# test ori
		# $a3 = 3 & 7 = 111 (7)
ori  	$a3, $a0, 7 # 34870007 (15)


		# test sw
		# $t = MEM[$s + offset];
		# lw $t, offset($s)
		# storing $a3 into 8($0)
		
sw   	$a3, 8($0) # ac070008 (16)


		# test j
j testjump # 08000016 (17) - this is jumping 22 (forward)?

add 	$a3, $a3, $a2 # 00e63820 (18)
add 	$a3, $a3, $a2 # 00e63820 (19)
add 	$a3, $a3, $a2 # 00e63820 (20)
add 	$a3, $a3, $a2 # 00e63820 (21)
add 	$a3, $a3, $a2 # 00e63820 (22)

testjump:

		# test lw
		# MEM[$s + offset] = $t;
		# lw $t, offset($s)
		# loading 8($0) into $a3
lw   	$a3, 8($0) # 8c070008 (23)

 jr   $ra   # 03e00008 (24) - return to OS





























