.data

Prompt1:
.asciiz "Introduceti elementul = "
PrintfFormat1:
.asciiz "Maximul este %d :\n"
PrintfFormat2:
.asciiz "Minimul este %d :\n"
PrintfFormat3:
.asciiz "Suma este %d :\n"
PrintfMesaj_err:
.asciiz "\nNumar negativ! Reluati!\n"
.align 2
PrintfPar1:
.word PrintfFormat1 

PrintfValue1:
.space 4 
PrintfPar2:
.word PrintfFormat2 
 
PrintfValue2:
.space 4 
PrintfPar3:

.word PrintfFormat3 
 
PrintfValue3:
.space 4 
PrintfErr1:
.word PrintfMesaj_err
 
.text
.global main
main:
addi r1,r0,Prompt1
jal InputUnsigned 
sle r15,r1,r0
bnez r15, mesaj_err
 

addi r2,r1,0 
addi r3,r0,-32000 
addi r4,r0,32000 
addi r6,r0,0 

addi r10,r0,10

loop:
	add r7,r2,r0
	div r2,r2,r10
	multu r9,r2,r10
	sub r9,r7,r9
	add r1,r9,r0
	
	

slt r5,r1,r4 

beqz r5,maxim
addi r4,r1,0 
maxim:
sgt r5,r1,r3 
beqz r5,suma 
addi r3,r1,0

suma:
add r6,r6,r1
 

bnez r2,loop 
sw PrintfValue1,r3 
addi r14,r0,PrintfPar1
trap 5 
sw PrintfValue2,r4 
addi r14,r0,PrintfPar2
trap 5 
sw PrintfValue3,r6 
addi r14,r0,PrintfPar3
trap 5
j gata
mesaj_err:
sw PrintfValue3,r6 

addi r14,r0,PrintfErr1
trap 5
j main 
mesaj_err_el:
sw PrintfValue3,r6 
 
addi r14,r0,PrintfErr1
trap 5 
j loop 
gata:
trap 0