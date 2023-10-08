# Serial in, Parallel Out Shift Register
- It works as follows:
```
             P0         P1         P2         P3         P4         P5         P6          P7
     ┌─────┐ │  ┌─────┐ │  ┌─────┐ │  ┌─────┐ │  ┌─────┐ │  ┌─────┐ │  ┌─────┐ │  ┌─────┐  │
SI──►┤D   Q├─┴─►│D   Q├─┴─►│D   Q├─┴─►│D   Q│─┴─►│D   Q├─┴─►│D   Q├─┴─►│D   Q├─┴─►│D   Q│──┘
     │     │    │     │    │     │    │     │    │     │    │     │    │     │    │     │
───┬─►Clk  │ ┌──►Clk  │ ┌──►Clk  │ ┌──►Clk  │ ┌──►Clk  │ ┌──►Clk  │ ┌──►Clk  │ ┌──►Clk  │
   │ └─────┘ │  └─────┘ │  └─────┘ │  └─────┘ │  └─────┘ │  └─────┘ │  └─────┘ │  └─────┘
   │         │          │          │          │          │          │          │
   └─────────┴──────────┴──────────┴──────────┴──────────┴──────────┴──────────┘
```

1. Design a 8-bit SIPO Shift register.
2. Write a self-checking testbench.
3. Upload to this folder.
