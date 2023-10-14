module Nsubtractor (
    input [N-1:0] a,
    input [N-1:0] b,
    output reg [N-1:0] difference
);
    always_comb begin
        difference = a - b;
    end
endmodule
