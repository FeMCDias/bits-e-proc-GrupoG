; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide o número posicionado na RAM[0] pelo número posicionado no RAM[1] e armazena a sobra na RAM[2].


;;;;;;;while r0 > r1:
;;;;;;;  r0 = r0 - r1
;;;;;;;  retorna o loop 
;;;;;;;r2 = r0


leaw $2, %A
movw $0, (%A)

loop:

  leaw $0, %A
  movw (%A), %D

  ; Verifica se RAM[0] = 0
  leaw $end, %A 
  jle
  nop

  ; Soma RAM[3] = RAM[3] + RAM[1]
  leaw $1, %A
  movw (%A), %D
  leaw $0, %A
  subw (%A), %D, %D
  movw %D, (%A)

  ; loop
  leaw $loop, %A
  jmp
  nop

end: