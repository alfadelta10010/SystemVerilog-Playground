`timescale 1ns/1ns

module siso_shift_register_tb;

  reg clk;        
  reg rst;        
  reg serial_in; 
  wire serial_out; 

  siso_shift_register siso_inst (
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .serial_out(serial_out)
  );

  initial begin
    clk = 0;
    rst = 0;
    serial_in = 0;

    rst = 1;
    #10 rst = 0;
   
    serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;	
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;

    $finish;
  end

  always begin
    #5 clk = ~clk;
  end

endmodule