
# .data é o espaço para definição das variáveis
.data 
    VECTOR: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    VECTOR_SIZE: .word 10
    SUM: .word 0
    AUX: .space 2

    ONE: .word 1
    SPACE: .ascii " "
    NEWLINE: .ascii "\n"

.text
    LOCO VECTOR # ac = VECTOR como um ponteiro
    STOD AUX # *AUX = VECTOR

LOOP: 
    LODD AUX # ac = m[aux] como ponteiro
    SWAP
    LODL 0
    PRINTAC 
    ADDD SUM 
    STOD SUM 

    LODD SPACE 
    PRINTACCHAR

    LODD AUX
    SUBD ONE 
    STOD AUX

    LODD VECTOR_SIZE
    SUBD ONE 
    STOD VECTOR_SIZE
    JZER END

    JUMP LOOP

END:
    LODD NEWLINE
    PRINTACCHAR
    LODD SUM
    PRINTLNAC
    HALT