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

___

### RV_D2SK1_L2_Memory Allocation for Double Words

- Two different ways to load data from Memory to Registers:
  1. Little-endian Memory Addressing System: The LSB(byte) is stored in the Top byte of the Memory Stack.
  2. Big-endian Memory Addressing System: Thr MSB(byte) is stored in the Top byte of the Memory Stack.  
- RISC V uses Little-endian System
![Little_endian_system](images/Screenshot%202025-05-05%20174732.png)  
- **Double-word** : Twice the size of a word
  1. For RV32 - Word size = 16
  2. For RV64 - Word size = 32

___

### RV_D2SK1_L3_Load, Add And Store Instructions With Example
`Scenario 1`
- Consider a scenario where a double word stored in the 16th byte of a memory needs to be loaded to a register(x8). The base address of the doubleword is stored in the register(x23).
- The instruction for this scenario is 
```assembly
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
```assembly
add x8, x24,x8
```
  1. Here add is the instruction
  2. The first x8 is the desitination register 'rd'
  3. x24 is a source register 'rs1'
  4. x8  is the second sourse register 'rs2'

![image](images/Screenshot%202025-05-05%20185226.png)

___

### RV_D2SK1_L4_Concluding 32-registers And Their Respective ABI Names

- ``RV64I`` &rarr; RISC-V 64 bit Processor that performs only base integer instructions.  
- Types of instruction in RV64I:
  1. I-type : Has both immediate values and registers in the instructions.
  2. R-type : Has only registers in the instructions.
  3. S-type : Instructions that involves storing.

- Each register in RV64I has a ABI name for the user to access easily  

![image](images/Screenshot%202025-05-05%20190641.png) 

___


## RV-D2SK2 - Lab work using ABI function calls
  
### RV_D2SK2_L1_Study New Algorithm For Sum 1 to N Using ASM

- The Algorithm of [`Sum1ton.c`](Day1.md#rv_d1sk2_l1_c-program-to-compute-sum-from-1-to-n) in Assembly Language

![image](images/Screenshot%202025-05-05%20192316.png)

___

### RV_D2SK2_L2_Review ASM Function Call

- Create a `.C` file  
```c
#include <stdio.h>

extern int load(int x,int y);

int main(){
    int result = 0;
    int count = 9;
    result = load(0x0, count+1);
    printf("Sum of number from 1 to %d is %d\n",count,result);
    return 0;
}
```
![image](images/Screenshot%202025-05-05%20193826.png)

- Create a `.S` in the same location.
```S
.section .text
.global load
.type load, @function

load:
        add     a4, a0, zero
        add     a2, a0, a1
        add     a3, a0, zero
loop:   add     a4, a3, a4
        addi    a3, a3, 1
        blt     a3, a2, loop
        add     a0, a4, zero
        ret
```
![image](images/Screenshot%202025-05-05%20193856.png)

___

### RV_D2SK2_L3_Simulate New C Program With Function Call

- Compile the files using RISC V compiler
```bash
riscv64-unknown-elf-gcc -ofast -mabi=rv64i -o 1to9_custom.o 1to9_custom.c load.S
```  
```bash
spike pk 1to9_custom.o
```
![image](images/Screenshot%202025-05-05%20200214.png)

- To view the Disassembly of the Code:
```bash
riscv64-unknown-elf-objdump -d 1to9_custom.o | less
```
![image](images/Screenshot%202025-05-05%20200322.png)  

___

## RV-D2SK3 - Basic verification flow using iverilog
### RV_D2SK3_L1_Lab To Run C-Program On RISC-V CPU

- The above programs and methods are simulations.
- In this module, we see how to actually implement a C program into RISC V processor(picorv32)
- To clone the PICORV32 Processor

```bash  
   git clone https://github.com/kunalg123/riscv_workshop_collaterals.git
```
- To view the program of PICORV32
```bash
   cd riscv_workshop_collaterals/labs
```
```bash
   vim picorv32.v
```
press esc and type q to quit

![image](images/Screenshot%202025-05-05%20225428.png)

(OR)

```bash
   less picorv32.v
```
press q to quit

- All code required to convert the C program to hex file is scripted to a single file `rv32im.sh` 
- To view the script file
```bash
   vim rv32im.sh
```
![image](images/Screenshot%202025-05-05%20230112.png)
- To run the script:
```bash
   chmod 777 rv32im.sh
   ./rv32im.sh
```
![image](images/Screenshot%202025-05-05%20230253.png)
- A `hex file` named firmware.hex is created which needs to be load to the testbench through 
```v
readmemh("firmware.hex",memory);
```


With this Day 2 ends.
___
