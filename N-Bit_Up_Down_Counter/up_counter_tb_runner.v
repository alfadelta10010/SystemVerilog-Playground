module up_counter_tb_runner;
  reg tb_clk;

  // Instantiate the testbench
  up_counter_tb up_counter_tb_inst;

  // Clock generation for the testbench
  always begin
    #5 tb_clk = ~tb_clk;
  end

  initial begin
    tb_clk = 0;
    up_counter_tb_inst.clk = tb_clk;
    // Simulate for a while
    #100;
    $finish;
  end
endmodule
