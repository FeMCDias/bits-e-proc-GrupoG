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

  leaw $end, %A 
  jle
  nop

  ; Soma RAM[3] = RAM[3] + RAM[1]
  leaw $1, %A     ;;;;;;; ou 1
  movw (%A), %D
  leaw $0, %A      ;;;;; ou 0
  subw (%A), %D, %D
  movw %D, (%A) 

  ; subtrai RAM[0] = RAM[0] - 1
  leaw $2, %A
  movw (%A), %D
  incw %D, (%A)

  ; loop
  leaw $loop, %A
  jmp
  nop

end: