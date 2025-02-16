# Assembly Code Breakdown for 16-bit Subtraction

This document explains a MASM assembly code example that subtracts two 16-bit numbers and handles a borrow using the carry flag. It also details how the resulting bytes are represented in memory.

---

## Assembly Code Breakdown

### Assumptions
```assembly
ASSUME CS:CODE, DS:DATA
```
- `ASSUME`: Tells the assembler which segments to associate with `CS` (Code Segment) and `DS` (Data Segment).
- `CS:CODE`: Associates the `CODE` segment with the `CS` register.
- `DS:DATA`: Associates the `DATA` segment with the `DS` register.

### Data Segment
```assembly
DATA SEGMENT
    N1 DW 9A3FH
    N2 DW 4F28H
    N3 DW 2 DUP(0)
DATA ENDS
```
- `DATA SEGMENT`: Marks the beginning of the data segment.
- `N1 DW 9A3FH`: Declares `N1` as a 16-bit word with a hexadecimal value of `9A3FH`.
- `N2 DW 4F28H`: Declares `N2` as a 16-bit word with a hexadecimal value of `4F28H`.
- `N3 DW 2 DUP(0)`: Allocates two consecutive 16-bit words (initialized to 0) to store the result, including any borrow indication.
- `DATA ENDS`: Marks the end of the data segment.

### Code Segment
```assembly
CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX
```
- `CODE SEGMENT`: Marks the beginning of the code segment.
- `START`: Label indicating the starting point of the program.
- `MOV AX, DATA`: Loads the starting address of the data segment into the `AX` register.
- `MOV DS, AX`: Transfers the address from `AX` to `DS`, setting up the data segment.

```assembly
    MOV AX, N1
    SUB AX, N2
    MOV N3, AX
```
- `MOV AX, N1`: Loads the 16-bit value from `N1` into the `AX` register.
- `SUB AX, N2`: Subtracts the 16-bit value from `N2` from `AX`. If there is a borrow (negative result in unsigned arithmetic), the carry flag is set.
- `MOV N3, AX`: Stores the result of the subtraction from `AX` into `N3`.

```assembly
    JNC STOP
    MOV N3[2], 01H
```
- `JNC STOP`: Jumps to the `STOP` label if there is no borrow (i.e., the carry flag is clear).
- `MOV N3[2], 01H`: If the carry flag is set (indicating a borrow), stores `01H` in the next 16-bit word following `N3` to indicate the borrow.

```assembly
STOP:
    MOV AH, 04CH
    INT 21H
```
- `MOV AH, 04CH`: Loads the exit function code (`04CH`) for DOS interrupt `21H`.
- `INT 21H`: Executes DOS interrupt `21H` to terminate the program.

```assembly
CODE ENDS
END START
```
- `CODE ENDS`: Marks the end of the code segment.
- `END START`: Specifies the program entry point at the `START` label.

---

## Memory Representation
The memory dump shows how values are stored in little-endian format.

### Little-Endian Format
The least significant byte is stored first. For example, if `N3` stores `4F17H`, it is stored in memory as:
```
17 4F
```

### Handling Borrow
If a borrow occurs, the memory representation for `N3` includes an additional word `0001H` stored after the result to indicate it.

---

## Summary
This assembly program:
1. Subtracts two 16-bit numbers.
2. Stores the result in `N3`.
3. Checks for a borrow using the carry flag.
4. If a borrow occurs, marks it in an additional memory location.
5. Terminates execution gracefully.

This approach ensures correct handling of unsigned subtraction in assembly.

