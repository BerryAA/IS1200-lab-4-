.text
	addi $a0, $0, 1								# input
	addi $v0, $a0, 0							# res set to input
	addi $a0, $a0, -1							# decrease input by 1
	addi $a3, $0, 1								# hold number 1
	
loop:	
	beq $a0, $0, done							# catch $a0 = 0
	beq $a0, $a3, done							# catch $a0 = 1
	
	addi $a1, $v0, 0							# hold current value in $a1

	addi $a2, $a0, -1							# inner loop iterations
	multplication:
		add $v0, $v0, $a1						# add curent value
		addi $a2, $a2, -1						# decrease iteration number $a2
		beq $a2, $0, breakLoop					# break loop if $a2 = 0
		beq $0, $0, multplication				# restart loop
		add $0,$0,$0							# nope

	breakLoop:
		addi $a0, $a0, -1						# decrease $a0
		beq  $0, $0, loop						# restart loop
        	
done:
	add $0,$0,$0								# nop
	
