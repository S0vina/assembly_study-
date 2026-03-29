.data
    A_VALUE: .word 6
    B_VALUE: .word 1

.text
    LODD A_VALUE
 
LOOP: 
    ADDD B_VALUE # AC = AC(A) + B 
    PRINTAC

