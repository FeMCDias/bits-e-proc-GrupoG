; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos


leaw $0, %A
movw $0, (%A)

leaw $1, %A
movw (%A), %D
    
leaw $2, %A
movw %D, (%A)

loop:

  leaw $1, %A
  movw (%A), %D

  leaw $end, %A 
  jle
  nop

  leaw $2, %A
  movw (%A), %D
  leaw $0, %A
  addw (%A), %D, %D
  movw %D, (%A)

  leaw $1, %A
  movw (%A), %D
  decw %D
  movw %D, (%A)

  leaw $loop, %A
  jmp
  nop

end: