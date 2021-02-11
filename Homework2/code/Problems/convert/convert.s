.global convert
.type matrix_mul, %function

.align 2
# int convert(char *);
convert:

	# insert your code here
	# Green card here: https://www.cl.cam.ac.uk/teaching/1617/ECAD+Arch/files/docs/RISCVGreenCardv8-20151013.pdf
	addi t0, zero, 43; # t0 = 43 = '+'
	addi t1, zero, 45; # t1 = 45 = '-'
	addi t2, zero, 48; # t2 = 48 = '0'
	addi t3, zero, 58; # t3 = 58 = '9' + 1
	addi t4, zero, 0; # t4 = 0 = '\0'
	addi s2, zero, 0; # s2 = 0
	addi t6, zero, 1; # t6 = 1

	lb t5, 0(a0); # t5 = input[i]
	beq t5, t0, pos; # if input[i] == '+' then pos
	beq t5, t1, neg; # if input[i] == '-' then neg
	beq zero, zero, zeros; # go to zeros
pos:
	addi a0, a0, 1; # i = i + 1
	beq zero, zero, zeros; # go to zeros
neg:
	addi t6, zero, -1; # t6 = -1
	addi a0, a0, 1; # i = i + 1
zeros:
	lb t5, 0(a0); # t5 = input[i]
	bne t5, t2, loop; # if input[i] != '0' then loop
	addi a0, a0, 1; # i = i + 1
	beq t5, t2, zeros; # if input[i] == '0' then zeros
loop:
	lb t5, 0(a0); # t5 = input[i]
	beq t5, t4, exit1; # if input[i] == '\0' then exit1
	blt t5, t2, exit2; # if input[i] < '0' then exit2
	bge t5, t3, exit2; # if input[i] >= '9' + 1 then exit2

	sub s3, t5, t2; # s3 = input[i] - '0'
	addi s4, zero, 10; # s4 = 10
	mul s2, s2, s4; # s2 = s2 * 10
	add s2, s2, s3; # s2 = s2 + s3
	addi a0, a0, 1; # i = i + 1
	beq zero, zero, loop; # go to loop
exit1:
	mul s2, s2, t6; # s2 = s2 * +1/-1
	addi a0, s2, 0; # return = s2
	ret
exit2:
	addi a0, zero, -1; # return = -1
	ret

