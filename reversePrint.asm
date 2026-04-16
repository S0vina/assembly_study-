.data 
    STRING:  .asciiz "Glider caught the breeze. Feels like flying"
    AUX:    .word 0
    CONT:   .word 0
    ZERO:   .word 0
    ONE:    .word 1
    VERIFICATION:   .ascii "a"
.text
    LOCO STRING
    STOD AUX

LOOP:
    LODD AUX
    SWAP
    LODL 0
    JZER REVERSE
    LODD AUX
    SUBD ONE
    STOD AUX   
    JUMP LOOP

REVERSE:
    LODD AUX
    ADDD ONE
    SWAP
    LODL 0
    PRINTACCHAR
    LODD AUX
    ADDD ONE
    STOD AUX
    LOCO STRING
    SUBD AUX
    JZER FIM
    JUMP REVERSE

FIM: 
    HALT