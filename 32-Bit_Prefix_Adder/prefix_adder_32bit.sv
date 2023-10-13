module prefix_adder_32bit (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [7:0] a_bits[3:0];
    wire [7:0] b_bits[3:0];
    wire [7:0] sum_bits[3:0];
    wire carry[3:0];

    // Split a and b into 8-bit chunks
    generate
        genvar i;
        for (i = 0; i < 4; i = i + 1) begin : gen_8bit_adder
            prefix_adder_8bit adder_instance (
                a[8*i +: 8],
                b[8*i +: 8],
                sum_bits[i]);
        end
    endgenerate

    // Generate carry chain for the 8-bit prefix adders
    assign carry[0] = 1'b0;
    assign carry[1] = carry[0] | (sum_bits[0][7] & a_bits[0][7] & b_bits[0][7]);
    assign carry[2] = carry[1] | (sum_bits[1][7] & a_bits[1][7] & b_bits[1][7]);
    assign carry[3] = carry[2] | (sum_bits[2][7] & a_bits[2][7] & b_bits[2][7]);

    // Generate the final 32-bit sum
    assign sum = {carry[3], sum_bits[3], sum_bits[2], sum_bits[1], sum_bits[0]};

endmodule
