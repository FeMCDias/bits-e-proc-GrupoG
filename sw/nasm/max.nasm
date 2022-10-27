; Arquivo: Max.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares 
; Data: 27/03/2017
; Log :
;     - Rafael Corsi portado para Z01

; Calcula R2 = max(R0, R1)  (R0,R1,R2 se referem a  RAM[0],RAM[1],RAM[2])
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2
; Estamos considerando número inteiros

leaw $0, %A 
movw (%A), %D 
leaw $1, %A

;ram[0] - ram[1] salvo em D
subw (%A), %D, %D

leaw $IF, %A
;verifica se %D é menor ou igual a 0 
jle %D
nop

leaw $1, %A 
movw (%A), %D 
leaw $FIM, %A 
jmp
nop

IF:
leaw $0, %A 
movw (%A), %D 

FIM:
leaw $2, %A 
movw %D, (%A)
