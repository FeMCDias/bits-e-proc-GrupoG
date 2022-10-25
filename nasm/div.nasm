; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos


leaw $2, %A
movw $0, (%A)

loop:

  leaw $0, %A   
  movw (%A), %D

  leaw $valida_loop, %A 
  jle
  nop

  leaw $1, %A     
  movw (%A), %D
  leaw $0, %A     
  subw (%A), %D, %D
  movw %D, (%A) 

  leaw $2, %A
  movw (%A), %D
  incw %D, (%A)

  leaw $loop, %A
  jmp
  nop

valida_loop:

  leaw $0, %A
  movw (%A), %D
  leaw $end, %A
  je
  nop


  leaw $2, %A
  movw (%A), %D
  decw %D, (%A)

end: