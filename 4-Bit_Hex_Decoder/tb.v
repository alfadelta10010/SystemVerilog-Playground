module SevenSegmentDecoder;

  // Inputs
  reg [3:0] binary_input;
  
  // Outputs
  wire [6:0] segment_output;
  
  // Instantiate the SevenSegmentDecoder module
  SevenSegmentDecoder decoder(
    .binary_input(binary_input),
    .segment_output(segment_output)
  );

  initial begin
    // Test all possible 4-bit binary values (0 to 9) as input
    for (binary_input = 0; binary_input <= 9; binary_input = binary_input + 1) begin
      $display("Binary Input: %b, 7-Segment Output: %b", binary_input, segment_output);
    end

    // You can add more test cases if needed

    // Finish the simulation
    $finish;
  end

endmodule