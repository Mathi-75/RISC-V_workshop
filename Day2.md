# Day 2: Introduction to ABI and basic verification flow

## RV-D2SK1-Application Binary Interface(ABI)

### RV_D2SK1_L1_Introduction to Application Binary Interface

- Interface &rarr; Appearance of a Function that a user access
![ABI_in_computers](images/Screenshot%202025-05-05%20170808.png)

- ABI also known as System Call Interface connects Sytem call and ISA using Registers.  
- Two types of ISA(Instruction Set Architecture):  
  1.User ISA - controlled by User  
  2.User and System ISA - controlled by both System and User

  
- RISC V has 32 registers
![RISC-V_regisers](images/Screenshot%202025-05-05%20170922.png) 

- XLEN is the number of **bits** in each register 

### RV_D2SK1_L2_Memory Allocation for Double Words

- Two different ways to load data from Memory to Registers:
  1. Little-endian Memory Addressing System: The LSB(byte) is stored in the Top byte of the Memory Stack.
  2. Big-endian Memory Addressing System: Thr MSB(byte) is stored in the Top byte of the Memory Stack.  
- RISC V uses Little-endian System
![Little_endian_system](images/Screenshot%202025-05-05%20174732.png)  
- **Double-word** : Twice the size of a word
  1. For RV32 - Word size = 16
  2. For RV64 - Word size = 32

### RV_D2SK1_L3_Load, Add And Store Instructions With Example
`Scenario 1`
- Consider a scenario where a double word stored in the 16th byte of a memory needs to be loaded to a register(x8). The base address of the doubleword is stored in the register(x23).
- The instruction for this scenario is 
```bash
ld x8, 16(x23)
```
   1. Here ld means load doubleword
   2. x8 is the destination register 'rd'
   3. 16 is the immediate offset 'imm'
   4. x23 is the register which stores the base address of the memory stack

- The Instruction size of RISC V is 32 bits
![Instruction](images/Screenshot%202025-05-05%20183111.png)  

  `opcode (7 bits)` – Decides the instructions like `ld`  
  `funct3 (3 bits)` – Extension of opcode if needed  
  `rs1 (5 bits)` – Address of the source register  
  `rd (5 bits)` – Address of the destination register  
  `immediate (12 bits)` – Value of the offset  

`Scenario 2`
- Consider a scenario where the data loaded to register(x8) is added with the data in register(x24) and stored in register(x8).
- The instruction for this case is
```bash
add x8, x24,x8
```
  1. Here add is the instruction
  2. The first x8 is the desitination register 'rd'
  3. x24 is a source register 'rs1'
  4. x8  is the second sourse register 'rs2'

![image](images/Screenshot%202025-05-05%20185226.png)