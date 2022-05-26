.data
nr_prim: .asciiz " este prim"
nr_neprim: .asciiz " nu este prim"
.text
	.globl main
	geti $t1		#t1<-n
	li $t0,1		#t0<-divizorii
	li $t9,32

contor: 
	addi $t0,$t0,1
	ble $t1,$t0, fin
	
for: 
	div $t1,$t0
	mfhi $t3
	mflo $t4
	beqz $t3, impartim
	bnez $t3, contor
	ble $t1,$t0, fin
	
impartim : 
	move $t1,$t4
	puti $t0
	putc $t9
	ble $t0,$t1, for
	
	
fin:
	li $t5,1
	puti $t5
	done 
	
	
	


	

			
	