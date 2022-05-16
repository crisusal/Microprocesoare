.data 
suma_div:.asciiz "suma divizorilor este"
numar_perfect: .asciiz "\nEste numar perfect"
numar_imperfect: .asciiz "\nNu este numar perfect"
.text
.globl main

	geti $t0
	move $t8,$t0
	li $t9,2
	div $t0,$t9
	mflo $t1	
	li $t2,1
	li $t3,1
divizori :
	bgt $t3,$t1,final
	addi $t3,$t3,1
	div $t0,$t3
	mfhi $t5
	bnez $t5, divizori	
	addu $t2,$t2,$t3
	beqz $t5,divizori
final:
	puts suma_div
	puti $t2
	
bne $t8,$t2,afisare_imperfect

afisare_numar_perfect: 
	puts numar_perfect
	j fin

afisare_imperfect :
	puts numar_imperfect

fin: done


	
	




