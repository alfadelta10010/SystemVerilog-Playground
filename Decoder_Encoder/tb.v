module decoder_5to32_tb;

reg [4:0] input_data;
wire [31:0] output_data;

decoder_5to32 decoder(
    .input_data(input_data),
    .output_data(output_data)
);

initial begin

    input_data = 0;
    

    repeat (32) begin

        #10;

        if (output_data !== (1 << input_data))
            $display("Test Failed for input_data = %d", input_data);
       
        input_data = input_data + 1;
    end

    $finish;
end

endmodule
