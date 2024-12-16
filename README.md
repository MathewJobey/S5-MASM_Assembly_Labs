# S5-MASM_Assembly_Labs

This repository contains MASM Assembly Language programs from my 5th semester lab work. These programs are aimed to help beginners learn and understand basic assembly programming concepts.

---

## 🚀 How to Use

1. **Set up MASM and DOSBox**:  
   Follow this video tutorial to download and set up MASM in DOSBox:  
   👉 [How to Download MASM and Mount it in DOSBox](https://youtu.be/12BUeTAQcKg?si=rfeCpwApQj7sKqKb)

2. **Place `.asm` Files**: 
   - 🔴 **Ensure all `.asm` files are placed in the same folder** where you mounted MASM in DOSBox (e.g., `C:\Dbox`).  
   - This step is necessary for MASM and DOSBox to locate and assemble your files without errors.

3. **Common MASM Commands**:  
   Use the following commands to assemble, link, and execute your programs in MASM:

   ```bash
   mount c c:\<FolderPath>  # Mount the folder with MASM and .asm files
   c:                       # Switch to the mounted directory
   masm filename.asm        # Assemble the .asm file
   link filename.obj        # Link the object file
   debug filename.exe       # Debug the executable
   ```

   **Inside the debugger:**

   - `u` : View code  
   - `g` : Execute the program  
   - `d 076A:0` : Inspect memory (example)  
   - `q` : Quit the debugger
     
---

## 📂 Contents

1. `Addition of two 16-bit numbers`
2. `Addition of two 32-bit numbers`
3. `Subtraction of two 16-bit numbers`
4. `Subtraction of two 32-bit numbers`
5. `Multiplication of two 16-bit numbers`
6. `Division of two 16-bit numbers`
7. `Sorting an array of 16-bit numbers`
8. `Searching for a 16-bit number in an array`

---

## 🔧 Tools Used

- **MASM** - Microsoft Macro Assembler
- **DOSBox Emulator** - For running MASM in modern systems

---

## 📜 License

This project is licensed under the MIT License. Feel free to use the code with proper attribution.

---

## 👤 Author

**Mathew Jobey**  
[GitHub Profile](https://github.com/MathewJobey)

---

## 🌟 Contributions

If you find this helpful or want to suggest improvements, feel free to open an issue or contribute! 🙂
