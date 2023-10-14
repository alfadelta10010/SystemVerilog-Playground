module anda(
    input [N-1:0] a,
    input [N-1:0] b,
    output reg [N-1:0] result
);
always_comb begin
        result = a & b;
    end
endmodule
