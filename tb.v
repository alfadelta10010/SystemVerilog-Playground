module test_bench;
  reg [3:0] A, B;
  wire [3:0] Y;
  four_bit_adder u1 (.A(A), .B(B), .Y(Y));

  initial begin
    $display("Testing 4-bit Adder");
    A = 4'b0101;
    B = 4'b1001;
    #10;
    $display("Input: A = %b  B = %b", A, B);
    $display("Output: Y = %b", Y);
    $finish;
  end
endmodule
