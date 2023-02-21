.text
	addi $a0, $0, 8								# input
	beq $a0, $0, done							# catch $a0 = 0
	addi $v0, $a0, 0							# res set to input
	
loop:	
	addi $a0, $a0, -1							# decrease input by 1
	beq $a0, $0, done							# catch $a0 = 0
	add  $0, $0,  $0							# NOP

	mul $v0, $v0, $a0							# multiply

	beq  $0, $0, loop							# restart loop
	add  $0, $0,  $0							# NOP
        	
done:
	beq  $v0, $v0, done							# stop loop
	
