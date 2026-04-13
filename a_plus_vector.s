.data 
    VECTOR: .word 2, 3, 5, 7, 11, 17, 51
    VECTOR_SIZE: .word 7
    A_VALUE: .word 0
    AUX: .space 2
    ONE: .word 1

    SPACE: .ascii " "
    NEWLINE: .ascii "\n"

.text
    LOCO VECTOR # ac = vector as a pointer 
    STOD AUX    # aux = ac(vector) as a pointer, for example: 101

LOOP:
    LODD AUX
    SWAP 

    LODL 0

    ADDD A_VALUE # AC = AC + A_VALUE
    STOD A_VALUE # A_VALUE = AC

    PRINTAC # PRINT THE AC VALUE 

    LODD AUX
    SUBD ONE
    STOD AUX 

    LODD NEWLINE
    PRINTACCHAR
    
    LODD VECTOR_SIZE
    S
    UBD ONE
    STOD VECTOR_SIZE

    LODD VECTOR_SIZE # AC = VECTOR_SIZE (as valuea)

    JZER END # if AC == 0, then jump to END

    JUMP LOOP # force jump to END 

END:
    HALT