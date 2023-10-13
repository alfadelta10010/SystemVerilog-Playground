module alu_8_bit (
    input [7:0] a,
    input [7:0] b,
    input [1:0] operation,
    output reg [7:0] result
);

always_comb begin
    case(operation)
        2'b00: result = a & b; 
        2'b01: result = a ^ b;  
        2'b10: result = a + b; 
        2'b11: result = a - b; 
        default: result = 8'hFF; 
    endcase
end

endmodule
