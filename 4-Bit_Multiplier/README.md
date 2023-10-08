# 4-bit Binary Multiplier
1. Design a 4-bit binary multiplier, using structural style.
2. Write a self checking test bench for the design.
3. Upload the code to this folder.

#### Binary Multiplier
![Multiplier](Logic.png)
:warning: Only the diagram is scary, start converting and it's actually easy xD
- `A0, A1, A2, A3` are the 4 bits of A
- `B0, B1, B2, B3` are the 4 bits of B
- `P0-P7` are the product of `A[3:0] * B[3:0]`
- The MUX-like symbols are 1-bit Full Adders
- The logic gate is an AND gate
