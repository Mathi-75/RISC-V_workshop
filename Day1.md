# Day 1: Introduction to RISC-V ISA and GNU compiler toolchain  

## RV-D1SK1 - Introduction to RISC-V basic keywords  

### RV_D1SK1_L1_Introduction
- Intro to RISC V ISA
- High level language(Java,C,Python) &rarr; Assembly Language(RISC V, x86, Arm) &rarr; Machine Language (0 and 1)
- The Assembly language is implemented by a pre-made Architecture which is created using RTL.

___

### RV_D1SK1_L2_From Apps To Hardware
- Apps &rarr; System Software &rarr; OS(windows, linux, macos) &rarr; Compiler &rarr; Assembler &rarr; Harware
- OS:  
  1. Handle IO operations
  2. Allocate memory
  3. Low Level System Functions

___

### RV_D1SK1_L3_Detailed Description of Course Content
- C program
- Types of Instructions:
  1. Pseudo Instructions(instrcutions that doesnt invlove handling data)
  2. Base Integer Instructions(RV64I)
  3. Multiply extension(RV64M) (uses multiplication)
  4. Floating point Instructions (RV64F & RV64D)
- Application Binary Interface (Registers)
- Memory allocation and Stack Pointer

___

## RV_D1SK2- Labwork for RISC-V software toolchain

### RV_D1SK2_L1_C Program to Compute Sum from 1 to N
![images/Screenshot 2025-05-03 004608.png](images/Screenshot%202025-05-03%20004608.png)
Code:
```c
#include<stdio.h>
int main(){
  int i,sum=0,n-5;
  for(int i=1;i<=n;i++){
    sum +=i;
  }
  printf("Sum of first %d natural numbers is %d",n,sum);
}
```
![images/Screenshot 2025-05-03 004812.png](images/Screenshot%202025-05-03%20004812.png)

Compilation:
```bash
cd <Location of the C file>
gcc sum1ton.c
./
./a.out
```
___