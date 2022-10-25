; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

leaw $0, %A
movw $0, (%A)

loop:

  leaw $5, %A   
  movw (%A), %D
  
  ;;valida entrada no loop
  leaw $valida_loop, %A 
  jle %A
  nop

  ;;divisão por 2
  leaw $5, %A     
  movw (%A), %D
  leaw $2, %A     
  subw %D, %A, %D
  movw %D, %A 

  ;;volta loop
  leaw $loop, %A
  jmp
  nop

valida_loop:

  ;;verifica se RAM[5] é diferente de 0, caso seja, armazena 1 em R[0], do contrário armazena 0.
  leaw $5, %A
  movw (%A), %D
  leaw $0, %A
  movw $0, (%A)     
  leaw $end, %A
  jl %A
  nop

  leaw $0, %A
  movw $1, (%A)     

end:   