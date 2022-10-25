; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos


;;carrega RAM[1] e RAM[0] além de uma adicional RAM[2] para auxiliar no cálculo
leaw $0, %A
movw $0, (%A)

leaw $1, %A
movw (%A), %D
    
leaw $2, %A
movw %D, (%A)

loop:

  leaw $1, %A
  movw (%A), %D

  ;;verifica se RAM[1] é válido
  leaw $end, %A 
  jle
  nop

  ;;RAM[2] é utilizada como auxiliar para a soma de RAM[0]
  leaw $2, %A
  movw (%A), %D
  leaw $0, %A
  addw (%A), %D, %D
  movw %D, (%A)

  ;;subtrai um de RAM[1], que está fazendo papel de contador
  leaw $1, %A
  movw (%A), %D
  decw %D
  movw %D, (%A)

  ;;volta o loop
  leaw $loop, %A
  jmp
  nop

end: