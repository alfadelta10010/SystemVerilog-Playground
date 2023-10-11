# Serial in, Serial Out Shift Register
- It works as follows:
```
     ┌─────┐    ┌─────┐    ┌─────┐    ┌─────┐     ┌─────┐    ┌─────┐    ┌─────┐    ┌─────┐
SI──►│D   Q├───►│D   Q├───►│D   Q├───►│D   Q│────►│D   Q├───►│D   Q├───►│D   Q├───►│D   Q│──► SO
     │     │    │     │    │     │    │     │     │     │    │     │    │     │    │     │
───┬─►Clk  │ ┌──►Clk  │ ┌──►Clk  │ ┌──►Clk  │  ┌──►Clk  │ ┌──►Clk  │ ┌──►Clk  │ ┌──►Clk  │
   │ └─────┘ │  └─────┘ │  └─────┘ │  └─────┘  │  └─────┘ │  └─────┘ │  └─────┘ │  └─────┘
   │         │          │          │           │          │          │          │
   └─────────┴──────────┴──────────┴───────────┴──────────┴──────────┴──────────┘
```

1. Design a 8-bit SISO Shift register.
2. Write a self-checking testbench.
3. Upload to this folder.
