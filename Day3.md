# RV Day 3 - Digital Logic with TL-Verilog and Makerchip
## RV-D3SK1 - Combinational logic in TL-Verilog using Makerchip
### RV_D3SK1_L0_Welcome  

- Github repo for reference:
```bash
https://github.com/stevehoover/RISC-V_MYTH_Workshop
```

### RV_D3SK1_L1_Introduction To Logic Gates

- The Basic Logic Gates:
![image](images/Screenshot%202025-05-06%20145636.png)  

- These logic gates can be connected together to form a combinational circuit:
![image](images/Screenshot%202025-05-06%20151822.png)

- These Combinational circuits can be connected together to form more complex circuits
![image](images/Screenshot%202025-05-06%20152112.png)

- Boolean Operators:
![image](images/Screenshot%202025-05-06%20152230.png)

### RV_D3SK1_L2_Basic Mux Implementation And Introduction To Makerchip

- **2:1 MUX** implementation using Ternery operator:
![image](images/Screenshot%202025-05-06%20153103.png)
  1. f = x1 if s=1
  2. f = x2 if s=0

- A mux of higher order can be implemented by chaining Ternary Operator  
![image](images/Screenshot%202025-05-06%20155543.png)

### RV_D3SK1_L3_Labs For Combinational Logic

#### [`A. 🔗INVERTER`](codes/inverter.tlv)  

![inverter](images/Screenshot%202025-05-06%20161311.png)

#### [`B. 🔗VECTORS`](codes/vectors.tlv)

![vectors](images/Screenshot%202025-05-06%20163226.png)


## RV-D3SK2 - Sequential logic
### RV_D3SK2_L1_Introduction To Sequential Logic And Counter Lab

- Sequential logic is sequenced by a clock signal
#### [🔗A. Fibonacci Series](codes/fibonacci.tlv)
![image](images/Screenshot%202025-05-08%20140104.png)  

#### [🔗B. Counter](codes/counter.tlv)
![image](images/Screenshot%202025-05-08%20141240.png)

### RV_D3SK2_L2_Sequential Calculator Lab
- Values in Verilog
![image](images/Screenshot%202025-05-08%20141935.png)

#### [🔗A. Sequential Calculator](codes/seq_calc.tlv)
![image](images/Screenshot%202025-05-08%20150502.png)

## RV-D3SK3 - Pipelined logic
### RV_D3SK3_L1_Pipelined Logic And Re-Timing

- Pythagoras theorem is a little complex to complete in one cycle, so it is spilt into three cycles.
![image](images/Screenshot%202025-05-09%20114722.png)
  1. The values of square is calculated in the first cycle.
  2. The sum of the squares in next cycle.
  3. And the square root in next cycle(Practically sqrt takes more than one cycle).

- Timing abstract:
![image](images/Screenshot%202025-05-09%20121648.png)

- To pass the values from one cycle to another cycle a D - Flip Flop is used.

- TL - Verilog syntax:
![image](images/Screenshot%202025-05-09%20121819.png)

### RV_D3SK3_L2_Pipeline Logic Advantages And Demo In Platform

#### [`🔗Pythagoras Theorem`](codes/pythagotas_theorem.tlv)
![image](images/Screenshot%202025-05-09%20123550.png)

### RV_D3SK3_L3_Lab On Error Conditions Within Computation Pipeline

- Identifiers and Types:
  1. Symbol prefix - $ 
  2. First token should have two alpha characters.  

### RV_D3SK3_L4_Lab On 2-Cycle Calculator
#### [`🔗Pipelined Calculator`](codes/Pipelined_calculator.tlv)
![image](images/Screenshot%202025-05-09%20131833.png)