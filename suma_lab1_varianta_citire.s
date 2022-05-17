.data
	
	sum: .word
	mesaj_suma: .asciiz "suma e "
	mesaj_cat: .asciiz "\nCatul e "
	mesaj_rest: .asciiz "\nRestul e"
	

.text

.globl main

	main:
	geti $t0
	move $t7,$t0
	li $t1, 0 
	for:geti $t2
		add $t1, $t1, $t2
		addi $t0, $t0, -1
		bgtz $t0, for 
	
	move $t0,$t7

	puts mesaj_suma	
	puti $t1
	div $t1, $t0	
	mflo $t3 #cat
	mfhi $t4 #rest
	puts mesaj_cat
	puti $t3
	puts mesaj_rest
	puti $t4
	
	#la $t2, sum	
	#sw $t0, ($t2) #scriem suma
	#sw $t1, 4 ($t2) #scriem cat
done
	