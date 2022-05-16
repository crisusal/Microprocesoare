.data
n: .word
numar_n: .asciiz "Factorial n= "
diferenta: .asciiz "\nFactorial N-K= "
aranjamente: .asciiz "\nAranjamente=  "

.text

verificare_mare:
	
		verificare_n:
			geti $a0
			bltz $a0, verificare_n
			move $t2, $a0 #salvam n ul
			jal factorial
			move $t1, $t0 # punem rezultatul in t1
			puts numar_n
			puti $t1
			
			
		verificare_k:
			geti $a0
			bltz $a0, verificare_k
			move $t3,$a0
			
			
	#facem aranjamentele
		subu $t5,$t2,$t3
		bltz $t5,verificare_mare
		jal factorial
		move $t6, $t0
		puts diferenta
		puti $t6
		
		div $t7, $t1,$t6
		puts aranjamente
		puti $t7			
			
			
		done			
			
						
factorial :

	sw $ra,($sp)
	addi $sp,$sp,-4
	li $t0,1
	multiply: 
			beqz $a0, final
			mul $t0,$t0,$a0
			addi $a0,$a0,-1
			j multiply
	final:
		addi $sp,$sp,4
		lw $ra,($sp)
		jr $ra
			
