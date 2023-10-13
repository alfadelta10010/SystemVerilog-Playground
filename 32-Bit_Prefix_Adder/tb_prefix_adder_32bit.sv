module tb_prefix_adder_32bit();

    parameter N = 32;
    reg [N-1:0] a, b;
    wire [N-1:0] sum;
    prefix_adder_32bit dut (a,b,sum);

    initial begin
        a = 32'h12345678;
        b = 32'h87654321;
        #10;
        $finish;
    end

endmodule
