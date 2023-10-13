
module subtractor (
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] difference
);
    always_comb begin
        difference = a - b;
    end
endmodule
