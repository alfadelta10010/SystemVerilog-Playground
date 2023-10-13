module sipo_shift_register_tb;
  reg clk;
  reg clear;
  reg si;
  wire [7:0] po;

  // Instantiate the SIPO shift register module
  sipo_shift_register uut (
    .clk(clk),
    .clear(clear),
    .si(si),
    .po(po)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Test stimulus
  initial begin
    clk = 0;
    clear = 0;
    si = 0;

    // Apply clear and initial data
    #5 clear = 1'b1;
    #5 clear = 1'b0;

    // Apply test data
    #10 si = 1'b1;
    #10 si = 1'b0;
    #10 si = 1'b0;
    #10 si = 1'b1;
    #10 si = 1'b0;
    #10 si = 1'bx;

    // Finish the simulation
    #10 $finish;
  end

endmodule