.data
		# No memory variables for this program
.text
main:
		# $a0 = 3
addi 	$a0, $0, 3
		# $a1 = 4
addi 	$a1, $0, 4
		# $a2 = 7
addi 	$a2, $0, 7

		# test add
		# $a3 = 3 + 7
add 	$a3, $a0, $a2

		# test sub
		# $a3 = 3 - 7
sub 	$a3, $a0, $a2

		# test and
		# $a3 = 3 & 7 = 011 (3)
and 	$a3, $a0, $a2

		# test or
		# $a3 = 3 & 7 = 111 (7)
or  	$a3, $a0, $a2

		# test xor
		# $a3 = 3 & 7 = 100 (4)
xor 	$a3, $a0, $a2

		# test nor
		# $a3 = 3 & 7 = 1111 1111 1111 1111 1111 1111 1111 1000 (-8)?
nor 	$a3, $a0, $a2

		# test slt
		# $a3 = (3 < 7) 1 : 0 = 1
slt 	$a3, $a0, $a2

jump:

		# test beq
		# $a3 = $a0 then jump - should not jump
beq 	$a3, $a0, jump

		# test bne
		# $a3 = $a0 then jump - should not jump
bne 	$a3, $a0, skip

j jump

skip:

		# test andi
		# $a3 = 3 & 7 = 011 (3)
andi 	$a3, $a0, 7

		# test ori
		# $a3 = 3 & 7 = 111 (7)
ori  	$a3, $a0, 7 # 34870007


		# test sw
		# $t = MEM[$s + offset];
		# lw $t, offset($s)
		# storing $a3 into 71($2)
sw   $a3, 71($2) # AC470047


		# test j
j testjump

add 	$a3, $a3, $a2
add 	$a3, $a3, $a2
add 	$a3, $a3, $a2
add 	$a3, $a3, $a2
add 	$a3, $a3, $a2

testjump:

		# test lw
		# MEM[$s + offset] = $t;
		# lw $t, offset($s)
		# loading 71($2) into $a3
lw   $a3, 0($0)

 jr   $ra            	# return to OS





























