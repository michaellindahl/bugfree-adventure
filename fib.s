.data
		# No memory variables for this program
.text
main:
		# $a0 � input = level
addi	$a0, $0, 10
		# $v0 � output = returnValue
		# $t0 = a, $t1 = b, $t2 = c, $t3 = i
		# a = 1
addi 	$t0, $0, 1
		# b = 0
addi 	$t1, $0, 0
		# setup i
addi 	$t3, $0, 0
		# setup loop
loop:
slt 	$t2, $t3, $a0
		# break loop condition
beq	$t2, $s0, done
		# set returnvalue to a plus b
add	$v0, $t0, $t1
		# set a equal to b
add	$t0, $t1, $0
		# set b equal to returnvalue
add	$t1, $v0, $0
		# increment i
addi 	$t3, $t3, 1
		# return to beginning of loop
j	loop	
		# Target of branch conditional jump
done:
 jr   $ra            	# return to OS