.data 
    vec: .word 9, 5, 10, 20, 4, 2, 11,  7, 13, 4, 6, -1, -5
    n: .word 13
    savesp: .word 0
    cont: .word 0
    tmp: .word 0
    tam: .word 0
    um: .word 1

.text
    LODD n
    STOD tam
LOOP1:
    LOCO vec
    SWAP
    LODD n
    SUBD um    
    JZER EXIBE
    STOD n
    LOCO 0
    STOD cont
LOOP2: 
    LODL 0
    SUBL -1
    JNEG CHECK
    LODL 0
    STOD tmp
    LODL -1
    STOL 0
    LODD tmp
    STOL -1
CHECK:
    LODD cont
    ADDD um
    STOD cont
    SUBD n
    JZER LOOP1
    LOCO 0
    SWAP
    SUBD um
    SWAP
    JUMP LOOP2
EXIBE:
    LOCO 0
    STOD cont
    LOCO vec
    SWAP
LOOP3:
    LODL 0
    PRINTLNAC
    LODD cont
    ADDD um
    STOD cont
    SUBD tam
    JZER FIM
    LOCO 0
    SWAP
    SUBD um
    SWAP
    JUMP LOOP3
FIM:
    HALT