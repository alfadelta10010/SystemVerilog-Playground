
module adder (
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] sum
);
    always_comb begin
        sum = a + b;
    end
endmodule
