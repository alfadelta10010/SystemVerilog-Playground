module ALU_Testbench;

reg [7:0] A;
reg [7:0] B;
reg [1:0] opcode;
wire [7:0] result;

// Instantiate the ALU
ALU myALU (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result)
);

// Initialize test inputs
initial begin
    $dumpfile("ALU_Testbench.vcd");
    $dumpvars(0, ALU_Testbench);

    // Test case 1: A & B
    A = 8'b11011010;
    B = 8'b10101010;
    opcode = 2'b00;
    #10;
    
    // Test case 2: A ^ B
    A = 8'b11011010;
    B = 8'b10101010;
    opcode = 2'b01;
    #10;
    
    // Test case 3: A + B
    A = 8'b11011010;
    B = 8'b10101010;
    opcode = 2'b10;
    #10;
    
    // Test case 4: A - B
    A = 8'b11011010;
    B = 8'b10101010;
    opcode = 2'b11;
    #10;
    
    $finish;
end

// Monitor the results
always @(result) begin
    $display("A: %h, B: %h, Opcode: %b, Result: %h", A, B, opcode, result);
end

endmodule
