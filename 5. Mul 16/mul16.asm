ASSUME CS:CODE,DS:DATA

DATA SEGMENT
N1 DW 2222H
N2 DW 4444H
N3 DW 2 dup(0)
DATA ENDS

CODE SEGMENT
START:
    MOV AX,DATA
    MOV DS,AX

    MOV AX,N1
    MOV BX,N2
    MUL BX
    MOV N3[0],AX
    MOV N3[2],DX

    MOV AH,04CH
    INT 21H
    
CODE ENDS
END START