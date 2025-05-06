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

- (**A.Inverter**)[codes/inverter.v] 
