# S5-MASM_Assembly_Labs

This repository contains MASM Assembly Language programs from my 5th semester lab work. These programs are aimed to help beginners learn and understand basic assembly programming concepts.

---

## 🚀 How to Use
1. **Set up MASM and DOSBox**:  
   Follow this video tutorial to download and set up MASM in DOSBox:  
   👉 [How to Download MASM and Mount it in DOSBox](https://youtu.be/12BUeTAQcKg?si=rfeCpwApQj7sKqKb)  

2. **Place `.asm` Files**:  
   - 🔴 **Ensure all `.asm` files are placed in the same folder** where you mounted MASM in DOSBox (e.g., `C:\MASM`).  
   - This step is necessary for MASM and DOSBox to locate and assemble your files without errors.  

3. **Common MASM Commands**:  
   Use the following commands to assemble, link, and execute your programs in MASM:  
   ```bash
   mount c c:/<folder>      # Mount the folder with MASM and .asm files
   c:                       # Switch to the mounted directory
   masm filename.asm        # Assemble the .asm file
   link filename.obj        # Link the object file
   debug filename.exe       # Debug the executable
