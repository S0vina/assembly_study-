.data
    A_VALUE: .word 7
    VEZES: .word 3
    CONT: .word 0
    RESULT: .word 0
    AUX: .word 0

    ONE: .word 1
    ZERO: .word 0

    SPACE: .ascii " "
    NEWLINE: .ascii "\n"

.text
    # VERIFICAÇÃO DOS VALORES
    # Se A_VALUE for zero, pula pra END
    LODD A_VALUE
    JZER END

    # Se TIMES for zero, pula pra END
    LODD VEZES
    JZER END

    # Verificação de qual é maior
    LODD VEZES
    SUBD A_VALUE
    JPOS SWITCH

    LODD A_VALUE
    STOD RESULT

    LODD CONT
    ADDD ONE 
    STOD CONT

    LODD RESULT
    PRINTAC 

    LODD NEWLINE
    PRINTACCHAR

LOOP:
    # Soma sucessiva
    LODD RESULT
    ADDD A_VALUE
    STOD RESULT

    LODD CONT
    ADDD ONE
    STOD CONT

    LODD VEZES
    SUBD CONT
    JZER END

    LODD RESULT

    PRINTAC

    LODD NEWLINE
    PRINTACCHAR
    JUMP LOOP


END:
    LODD RESULT 
    PRINTAC 
    HALT

SWITCH:
    LODD A_VALUE
    STOD AUX

    LODD VEZES
    STOD A_VALUE

    LODD AUX
    STOD VEZES

    LODD A_VALUE
    PRINTAC
    RETN