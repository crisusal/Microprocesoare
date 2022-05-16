.data
n: .word
numar_n: .asciiz "Factorial n= \n"
numar_k: .asciiz "\nFactorial K= "
diferenta: .asciiz "\nFactorial N-K= "
combinari: .asciiz "\nCombinari=  "

.text


verificare_mare:

verificare :	geti $a0
				bltz $a0, verificare #il citim de mai multe ori pana e mai mare decat 0
				move $t2,$a0
				jal factorial  



				move $t4,$t0 #t4 mi se pune factorialul
				puts numar_n
				puti $t4

verificarek :	geti $a0
				bltz $a0, verificarek
				move $t3,$a0
				jal factorial

				move $t5,$t0
				puts numar_k
				puti $t5
			
			#facem combinarile

				subu $t6, $t2,$t3
				bltz $t6,verificare_mare #daca n-k mai mic decat 0, incepem iar procesul
				move $a0,$t6
				jal factorial
				move $t6,$t0	
				puts diferenta
				puti $t6


				mul $t6,$t6,$t5
				div $t4,$t4,$t6
				puts combinari
				puti $t4

				done


factorial:
		sw $ra, ($sp)
		addi $sp,$sp,-4
		li $t0,1
		multiply :
				beqz $a0, fin
				mul $t0,$t0,$a0
				addi $a0,$a0,-1
				j multiply
		fin: addi $sp,$sp,4
		     lw $ra, ($sp)
		     jr $ra


