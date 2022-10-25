; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide o número posicionado na RAM[0] pelo número posicionado no RAM[1] e armazena a sobra na RAM[2].


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

  leaw $loop, %A
  jmp
  nop

valida_loop:

  leaw $0, %A
  movw (%A), %D
  leaw $end, %A
  je
  nop


  leaw $0, %A
  movw (%A), %D
  leaw $1, %A
  addw %D, (%A), %D
  leaw $2, %A
  movw %D, (%A)

end: