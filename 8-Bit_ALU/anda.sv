
module anda(
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] result
);
always_comb begin
        result = a & b;
    end
endmodule
