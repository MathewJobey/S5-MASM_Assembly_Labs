![image](https://github.com/user-attachments/assets/20ec9718-f8ec-4115-b933-ce1a94955ad2)

# Search16 - Assembly Program Documentation

## Overview
This assembly program searches for a specific 16-bit key value in an array stored in memory. If the key is found, it prints **"KEY FOUND!"**; otherwise, it prints **"KEY NOT FOUND!"**.
---

## How It Works
1. **Initialize Data Segment**: Load the data segment into the `DS` register.
2. **Set Up Registers**:
   - Load the **array's starting address** into `SI`.
   - Load the **length of the array** into `CX`.
   - Load the **search key** into `BX`.
3. **Loop Through the Array**:
   - Compare each value with the key.
   - If a match is found, print **"KEY FOUND!"**.
   - If no match is found, print **"KEY NOT FOUND!"**.
4. **Exit the Program**.

---

## Code Breakdown

### **1. Directives and Macro**
```assembly
ASSUME CS:CODE, DS:DATA
```
- Tells the assembler that `CS` (Code Segment) contains the `CODE` segment and `DS` (Data Segment) contains the `DATA` segment.

#### **Printing Macro**
```assembly
PRINT MACRO MSG
    LEA DX,MSG
    MOV AH,09H
    INT 21H
ENDM
```
- A macro to print a string to the console using **DOS interrupt 21H (function 09H)**.

---

### **2. Data Segment**
```assembly
DATA SEGMENT
array DW 1000H,1010H,2000H,2020H,5000H  ; Array of 16-bit numbers
len EQU ($-array)  ; Calculate array length in bytes
key DW 5000H  ; The value to search for
str1 DB "KEY FOUND!$"  ; Success message
str2 DB "KEY NOT FOUND!$"  ; Failure message
DATA ENDS
```

---

### **3. Code Segment**
```assembly
CODE SEGMENT
START:
    MOV AX,DATA
    MOV DS,AX  ; Set data segment
```
- Load the **data segment address** into `AX`, then move it into `DS`.

#### **Register Initialization**
```assembly
    LEA SI,array  ; Load array address
    MOV CX,len  ; Load array length
    MOV BX,key  ; Load search key
```
- `SI` points to the **start of the array**.
- `CX` stores the **number of bytes in the array** (loop counter).
- `BX` holds the **search key**.

#### **Loop for Searching**
```assembly
NEXT:
    MOV AX,[SI]  ; Load current element into AX
    CMP AX,BX  ; Compare AX with key
    JE FOUND  ; If match, jump to FOUND

    INC SI  ; Move to next word
    INC SI  
    DEC CX  ; Decrease loop counter
    JNZ NEXT  ; If CX > 0, continue loop
```
- Loads each **16-bit element** and compares it with `BX`.
- If found, jumps to `FOUND`. Otherwise, increments `SI` (since words are 2 bytes).
- If no match is found and `CX` reaches `0`, jumps to print **"KEY NOT FOUND!"**.

#### **Key Not Found Case**
```assembly
    PRINT str2  ; Print "KEY NOT FOUND!"
    JMP EXIT  ; Jump to program termination
```
- Uses the `PRINT` macro to display **"KEY NOT FOUND!"**.

#### **Key Found Case**
```assembly
FOUND:
    PRINT str1  ; Print "KEY FOUND!"
```
- If a match is found, prints **"KEY FOUND!"**.

#### **Exit the Program**
```assembly
EXIT:
    MOV AH,04CH
    INT 21H  ; Terminate program
```
- Uses **DOS interrupt (INT 21H, function 4CH)** to terminate execution.

---

## Expected Output

### **Case 1: Key is Found (`5000H` in Array)**
**Execution Steps:**
1. Compare each value: `1000H, 1010H, 2000H, 2020H, 5000H`
2. `5000H` matches → Jump to `FOUND`
3. **Output:**
```
KEY FOUND!
```

### **Case 2: Key Not Found (e.g., Searching for `3000H`)**
**Execution Steps:**
1. Compare each value: `1000H, 1010H, 2000H, 2020H, 5000H`
2. No match found → Loop ends
3. **Output:**
```
KEY NOT FOUND!
```

---
