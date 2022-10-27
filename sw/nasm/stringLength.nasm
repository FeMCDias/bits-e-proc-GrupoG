; Arquivo: stringLength.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi 
; Data: 28/03/2018
;
; Assuma que uma string é um conjunto de caracteres terminado
; em NULL (0).
; 
; Supondo que temos uma string que começa no endereço 8 da RAM.
; Calcule o seu tamanho e salve o resultado na RAM[0].
;
; Os caracteres estão formatados em ASCII
; http://sticksandstones.kstrom.com/appen.html
; 
; Exemplo:
;
;   Convertido para ASCII
;             |
;             v
;  RAM[8]  = `o`
;  RAM[9]  = `i`
;  RAM[10] = ` `
;  RAM[11] = `b`
;  RAM[12] =  l`
;  RAM[13] = `z`
;  RAM[14] = `?`
;  RAM[15] = NULL = 0x0000


leaw $0, %A
movw $0, (%A) ; inicializa contador de caracteres no ram[0]
leaw $8, %A
movw %A, %D
leaw $2, %A
movw %D, (%A) ; salva o endereco inicial da string na ram[2]

LOOP:
leaw $2, %A
movw (%A), %D
movw %D, %A
movw (%A), %D ; colocando o valor da string na variavel D para comparacao
leaw $ENDLOOP, %A
je ; verfica se o RAM aponta pra 0, se sim manda pro ENDLOOP

;Agora vamos para a incrementacao dos contadores

leaw $2, %A
movw (%A), %D
incw %D ; incrementa o contador da RAM
leaw $2, %A
movw %D, (%A)

leaw $0, %A
movw (%A), %D
incw %D ; incrementa o contador de caracteres
leaw $0, %A
movw %D, (%A)

leaw $LOOP, %A 
jmp ; volta para o comeco do loop

ENDLOOP:
nop ; finaliza ENDLOOP - estético