module prefix_adder_8bit (
    input [7:0] a,
    input [7:0] b,
    output [7:0] sum
);

    wire [7:0] p[3:0];
    wire [7:0] g[3:0];

    assign p[0] = a;
    assign g[0] = b;

    assign p[1] = p[0] + g[0];
    assign g[1] = a & g[0];

    assign p[2] = p[1] + g[1];
    assign g[2] = p[0] & g[1];

    assign p[3] = p[2] + g[2];
    assign g[3] = p[1] & g[2];

    assign sum = p[3] + g[3];

endmodule
