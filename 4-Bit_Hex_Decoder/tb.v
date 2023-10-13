`timescale 1ns / 1ps
module testbench();
  reg [3:0] bin;
  wire [6:0] seg;

  seven_segment_decoder uut (
    .bin(bin), 
    .seg(seg)
  );

  initial begin
    bin = 4'b0000; #10;
    bin = 4'b0001; #10;
    bin = 4'b0010; #10;
    bin = 4'b0011; #10;
    bin = 4'b0100; #10;
    bin = 4'b0101; #10;
    bin = 4'b0110; #10;
    bin = 4'b0111; #```
