module BarrelShifter_Testbench;

  reg [7:0] data_in;
  reg [2:0] shift_amount;
  reg shift_left;
  wire [7:0] data_out;

  // Instantiate the BarrelShifter module
  BarrelShifter #(8) shifter (
    .data_in(data_in),
    .shift_amount(shift_amount),
    .shift_left(shift_left),
    .data_out(data_out)
  );

  // Initialize signals
  initial begin
    data_in = 8'b11011011;
    shift_amount = 3'b001; // Shift by 1 position
    shift_left = 1; // Left shift

    // Perform the shift operation
    #10 shift_left = 0; // Right shift

    // Add more test cases as needed

    // Finish simulation
    $finish;
  end

  // Display results
  always @* begin
    $display("Data In: %h, Data Out: %h", data_in, data_out);
  end

endmodule

module Testbench;
  BarrelShifter_Testbench testbench();
endmodule
