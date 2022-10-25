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

  ;;valida entrada no loop
  leaw $valida_loop, %A 
  jle
  nop

  ;;faz a operação RAM[0] = RAM[0] - RAM[1]
  leaw $1, %A     
  movw (%A), %D
  leaw $0, %A     
  subw (%A), %D, %D
  movw %D, (%A) 

  ;;adiciona um à RAM[2]
  leaw $2, %A
  movw (%A), %D
  incw %D, (%A)

  ;;volta loop
  leaw $loop, %A
  jmp
  nop

valida_loop:

  ;;valida loop verificando se R[0] é diferente de zero e atualizando R[2] com o resultado
  leaw $0, %A
  movw (%A), %D
  leaw $end, %A
  je
  nop

  leaw $2, %A
  movw (%A), %D
  decw %D, (%A)

end: