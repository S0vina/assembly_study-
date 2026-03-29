.data 
    VECTOR: .word 2, 3, 5, 7, 11
    VECTOR_SIZE: .word 5
    A_VALUE: .word 0
    AUX: .space 2
    ONE: .word 1

    CONT: .word 0

.text
    LOCO VECTOR # ac = vector as a pointer 
    STOD AUX # aux = ac(vector) as a pointer, for example: 101

LOOP:
    LODD AUX # ac = aux(vector) as a pointer
    SWAP # makes the SP register point to the init of the vector
    LODL CONT # ac = m[sp + cont] (first value of the vector and etc) 
    ADDD A_VALUE # AC = AC + A_VALUE
    STOD A_VALUE # A_VALUE = AC

    PRINTAC # PRINT THE AC VALUE 

    LODD AUX # AC = AUX (the sp pointer)
    SUBD ONE # AC = AC - 1 (sp pointer -1, wich iterate for the next value)
    STOD AUX # AUX = AC (reset the aux for SP register)

    LODD CONT # AC = CONT (as value)
    ADDD ONE # AC = AC(cont) + 1
    STOD CONT # CONT = AC

    LODD VECTOR_SIZE # AC = VECTOR_SIZE (as value)
    SUBD CONT # AC = AC(vector_size) - cont

    JZER END # if AC == 0, then jump to END

    JUMP LOOP # force jump to END

END:
    HALT
