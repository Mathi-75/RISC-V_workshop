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