module testbench_piso_shift_register;

reg clk;           
reg rst;           
reg parallel_in;   
wire serial_out;   

piso_shift_register dut (
  .clk(clk),
  .rst(rst),
  .parallel_in(parallel_in),
  .serial_out(serial_out)
);


always begin
  #5 clk = ~clk;
end


initial begin
  clk = 0;
  rst = 1;
  parallel_in = 8'b11011010; 

  #10 rst = 0; 


  $display("Time  Parallel-In  Serial-Out");
  $monitor("%d       %b           %b", $time, parallel_in, serial_out);

  
  repeat (8) begin
    #10 parallel_in = parallel_in >> 1;
  end

  $finish; 
end

endmodule
