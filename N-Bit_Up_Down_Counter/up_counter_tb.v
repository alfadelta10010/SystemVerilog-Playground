module up_counter_tb;

  reg clk;       // Clock signal
  reg reset;     // Reset signal
  wire [3:0] count; // Counter output
  integer i;

  // Instantiate the up counter
  up_counter #(4) up_counter_inst (
    .clk(clk),
    .reset(reset),
    .count(count)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Testbench behavior
  initial begin
    clk = 0;
    reset = 0;
    #10 reset = 1; // Reset the counter
    #10 reset = 0; // Release reset

    // Test the counter
    for (i = 0; i < 16; i = i + 1) begin
      #5;
      if (count !== i) begin
        $display("Error: Expected %d, Got %d", i, count);
      end
    end

    $display("Testbench finished");
    $finish;
  end

endmodule
