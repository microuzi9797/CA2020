.global fibonacci
.type fibonacci, %function

.align 2
# unsigned long long int fibonacci(int n);
fibonacci:

	# insert code here
	# Green card here: https://www.cl.cam.ac.uk/teaching/1617/ECAD+Arch/files/docs/RISCVGreenCardv8-20151013.pdf
	addi t3, a0, 0; # t3 = n
	addi t0, zero, 0; # f[0] = 0
	addi t1, zero, 1; # f[1] = 1

	addi t4, zero, 2; # t4 = 2
	blt t3, t4, exit1; # if n < 2 then exit1
loop:
	add t2, t0, t1; # f[i] = f[i - 2] + f[i - 1]
	addi t0, t1, 0; # t0 = t1 = f[i - 1]
	addi t1, t2, 0; # t1 = t2 = f[i]
	addi t3, t3, -1; # n = n - 1

	addi t5, zero, 1; # t5 = 1
	bne t3, t5, loop; # if n != 1 then loop
	beq t3, t5, exit2; # if n == 1 then exit2
exit1:
	ret
exit2:
	addi a0, t2, 0; # return = t2 = f[n]
	ret

