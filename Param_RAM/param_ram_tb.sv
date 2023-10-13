`timescale 1ns/1ns

module Testbench;

  reg clk;
  reg rst;
  reg [9:0] write_addr;
  reg [9:0] read_addr;
  reg write_enable;
  reg read_enable;
  reg [7:0] data_in;
  wire [7:0] data_out;

  // Instantiate the ParameterizedRAM module with the desired parameters
  ParameterizedRAM #(8, 10, 1024) ram (
    .write_addr(write_addr),
    .read_addr(read_addr),
    .write_enable(write_enable),
    .read_enable(read_enable),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Testbench behavior
  initial begin
    clk = 0;
    rst = 1;
    write_addr = 0;
    read_addr = 0;
    write_enable = 0;
    read_enable = 0;
    data_in = 0;

    // Release reset after some time
    #10 rst = 0;

    // Perform read and write operations
    // Write 0xAA to address 10
    #10 write_addr = 10;
    write_enable = 1;
    data_in = 8'hAA;

    // Read from address 10
    #10 read_addr = 10;
    read_enable = 1;

    // Add more test cases as needed

    // Finish the simulation after some time
    #100 $finish;
  end

  // Display results
  initial begin
    $display("Time = %0t: write_data = %h, read_data = %h", $time, data_in, data_out);
  end

endmodule

module top;
  // Instantiate the testbench
  Testbench testbench();
  
  // Provide a clock signal to the testbench
  always begin
    #5 testbench.clk = ~testbench.clk;
  end
endmodule
