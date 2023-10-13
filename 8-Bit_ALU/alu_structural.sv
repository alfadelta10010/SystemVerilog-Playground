module alu_structural (
    input [7:0] a,
    input [7:0] b,
    input [2:0] opcode, 
    output reg [7:0] result
);
    wire [7:0] add_result, sub_result, and_result, xor_result;
    adder add_inst (a, b, add_result);
    anda and_inst (a, b, and_result);
    xorr xor_inst (a, b, xor_result);
    xorr xor_ins (b, 1, f);
	 mux122 sub_inst (a, f, 1, sub_result);

    always_comb begin
        case (opcode)
            3'b000: result = add_result; 
            3'b001: result = sub_result;  
            3'b010: result = and_result; 
            3'b011: result = xor_result;
            default: result = 8'hFF;
        endcase
    end
endmodule





