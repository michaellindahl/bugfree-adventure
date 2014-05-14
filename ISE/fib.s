.data
		# No memory variables for this program
.text
main:
lw   	$a0, 0fff($0) # 8C040fff
addi	$v0, $a0, 0
		# $a0 – input = level
addi	$a0, $0, 10 #2004000a
		# $v0 – output = returnValue
		# $t0 = a, $t1 = b, $t2 = c, $t3 = i
		# a = 1
addi 	$t0, $0, 1
		# b = 0
addi 	$t1, $0, 0
		# setup i
addi 	$t3, $0, 1
		# setup loop
loop:
slt 	$t2, $t3, $a0
		# break loop condition
beq		$t2, $0, done
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
 #break fib result into digits (tens place, ones place)
 addi	$t3, $0, 1
 addi 	$v1, $0, 0 #20030000
 addi 	$a0, $0, 10
 slt 	$t2, $v0, $a0 #0044502A
 beq	$t2, $t3, finish

sub $v0, $v0, $a0
addi $v1, $v1, 1


 j done
finish:
 sw   $v0, fffffff0($0) # AC0B0000 io_fib_result
 sw   $v1, 00000f00
 jr   $ra            	# return to OS