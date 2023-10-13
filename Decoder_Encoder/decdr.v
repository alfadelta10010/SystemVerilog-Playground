module decoder_5to32 (
    input [4:0] input_data,
    output [31:0] output_data
);

assign output_data = (1 << input_data);

endmodule
