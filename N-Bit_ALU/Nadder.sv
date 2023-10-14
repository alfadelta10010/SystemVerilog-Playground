module Nadder (
    input [N-1:0] a,
    input [N-1:0] b,
    output reg [N-1:0] sum
);
    always_comb begin
        sum = a + b;
    end
endmodule
