module ALU (
    input [7:0] A,  // 8-bit input A
    input [7:0] B,  // 8-bit input B
    input [1:0] opcode,  // 2-bit opcode
    output reg [7:0] result  // 8-bit output result
);

always @(*)
begin
    case(opcode)
        2'b00: result = A & B;  // Bitwise AND
        2'b01: result = A ^ B;  // Bitwise XOR
        2'b10: result = A + B;  // Addition
        2'b11: result = A - B;  // Subtraction
        default: result = 8'b00000000;  // Default output
    endcase
end

endmodule
