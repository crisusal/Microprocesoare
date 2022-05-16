.data
 n: .word 4
 numere : .word 1 2 3 4
 mesaj_suma: .asciiz "\nSuma este:"

 mesaj_cat: .asciiz "\nCatul este:"
 mesaj_rest: .asciiz "\nRestul este"
 adres_s: .word 0x10010000
 media: .word

 .text
 .globl main

 li $t0,0
 lw $t1,n
 lw $t7,n
 la $t2,numere
 
 suma: 
	lw $t3,($t2)
	add $t0,$t0,$t3
	addi $t2,$t2,4
	addi $t1,$t1,-1
	bgtz $t1,suma
	
lw $t4,adres_s
sw $t0,($t4)

li $v0,4
la $a0,mesaj_suma
syscall
li $v0,1
addi $a0,$t0,0
syscall

li $v0,4
la $a0,mesaj_cat
syscall
div $t0,$t7
mflo $t6
li $v0,1
addi $a0,$t6,0
syscall

li $v0,4
la $a0,mesaj_rest
syscall
div $t0,$t7
mfhi $t6
li $v0,1
addi $a0,$t6,0
syscall





done


	

 