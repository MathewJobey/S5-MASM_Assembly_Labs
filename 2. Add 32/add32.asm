ASSUME CS:CODE,DS:DATA

DATA SEGMENT
N1 DD 8000FFFFH
N2 DD 80000001H
N3 DW 3 dup(0)
DATA ENDS

CODE SEGMENT
START:
    MOV AX,DATA
    MOV DS,AX

    MOV AX,WORD PTR N1[0]
    ADD AX,WORD PTR N2[0]
    MOV N3[0],AX
    MOV AX,WORD PTR N1[2]
    ADC AX,WORD PTR N2[2]
    MOV N3[2],AX
    
    JNC STOP                                                          
    MOV N3[4],01H
STOP: 
    MOV AH,04CH
    INT 21H
CODE ENDS
END START
