.data
    V: .byte 9, 3, 10, 17, 12, 11, 51, 24, 34, 21, 6 # 11 Values 
    N: .byte 11 # number of values in the vector
    PRINT_N_ORIGINAL: .byte 11 # number of values in the vector for control of the first print
    PRINT_N: .byte 11 # number of values in the vector for the second print
    CONT: .byte 0 # value for control of the end the script
    PRINT_CONT: .byte 0 # value for control of the end of the second print
    PRINT_CONT_ORIGIN: .byte 0 # value for control of the end of the first print
    ITER: .byte 0 # value that control the number of iterates in each search of the bubble
    TEMP: .byte 0 # variable for swap of the values
    AUX: .byte 0 # variable for stock the vector pointer
    PRINT_AUX: .byte 0 # variable for stock the vector for printing
    PRINT_AUX_ORIGINAL: .byte 0 # variable for stock the vector for printing 
    A: .byte 0 # Aux register for change numbers
    ONE: .byte 1 # stock the value 1
    ZERO: .byte 0 # stack the value 0
    SAVE_SP: .byte 0 # save the original context of sp
    SPACE: .ascii " " # for load an espace 
    NEWLINE: .ascii "\n" # for load a breakline
    COMMA: .ascii "," # for load a comma
.text
    LOCO V # AC = VECTOR AS A POINTER
    STOD SAVE_SP # SAVE_SP = *V
    STOD AUX
    STOD PRINT_AUX
    STOD PRINT_AUX_ORIGINAL
    JUMP PRINT_ORIGINAL_VECTOR # jump for the first print of the vector (non ordenate)
LOOP: 
    LODD AUX # AC = m[AUX] adress of the vector
    SWAP # change context of sp with ac register
    LODD ITER # AC = m[iter]
    ADDD ONE # add one in ITER for control
    STOD ITER # m[iter] = AC
    SUBD N # AC = AC - N (J - 11) # AC = AC(iter) - N(11)
    JZER RESTART # IF ac = 0, jump for restart variables step
    LODL 0 # AC = m[sp + x(0)]
    STOD A # M[A] = AC
    LODL -1 # AC = M[SP + (-1)]
    SUBD A # AC = AC - M[A] (IF > 0; OK. IF < 0; CHANGE)
    JNEG CHANGE # IF AC = 0, jump for change step
    LODD AUX # AC = *AUX(Adress of the vector)
    SUBD ONE # AC = AC - 1 (For translocation in the vector)
    STOD AUX # Write in AUX register 
    JUMP LOOP # Jump back for the init of the LOOP
CHANGE:
    LODD AUX # Same translocation of the vector, but needed in case of change to
    SUBD ONE 
    STOD AUX
    LODD A # AC = m[j]
    STOD TEMP # write A value in temp
    LODL -1 # AC = m[j + 1]
    STOL 0 # m[j] = m[j + 1]
    LODD TEMP # AC = TEMP
    STOL -1 # m[j+1] = TEMP
    JUMP LOOP # Jump back for the loop
RESTART:
    LODD CONT # Increase cont for control
    ADDD ONE
    STOD CONT 
    LODD ZERO # Reset ITER variable for next translation in the vector
    STOD ITER
    LODD CONT # Loads Cont for check with N value
    SUBD N
    JZER PRINT_VECTOR # IF Cont - N = 0, goto the end of the script
    LOCO V # Reset aux with the init of the vector again
    STOD AUX
    JUMP LOOP # if Cont - N != 0, goto loop again
PRINT_ORIGINAL_VECTOR: # Function that print the original vector (before ordenate)
    LODD PRINT_AUX_ORIGINAL
    SWAP
    LODL 0 
    PRINTAC
    LODD COMMA
    PRINTACCHAR
    LODD SPACE
    PRINTACCHAR
    LODD PRINT_CONT_ORIGIN
    ADDD ONE
    STOD PRINT_CONT_ORIGIN
    SUBD PRINT_N_ORIGINAL
    JZER NEWLINE_JUMP_LOOP
    LODD PRINT_AUX_ORIGINAL
    SUBD ONE
    STOD PRINT_AUX_ORIGINAL
    JUMP PRINT_ORIGINAL_VECTOR
PRINT_VECTOR: # Function that prints the ordenate vector
    LODD PRINT_AUX
    SWAP
    LODL 0 
    PRINTAC
    LODD COMMA
    PRINTACCHAR
    LODD SPACE
    PRINTACCHAR
    LODD PRINT_CONT
    ADDD ONE
    STOD PRINT_CONT
    SUBD PRINT_N
    JZER END
    LODD PRINT_AUX
    SUBD ONE
    STOD PRINT_AUX
    JUMP PRINT_VECTOR
NEWLINE_JUMP_LOOP: # function just for print a newline
    LODD NEWLINE
    PRINTACCHAR
    JUMP LOOP
END: # function that ends the script
    HALT