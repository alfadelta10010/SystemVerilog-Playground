module SevenSegmentDecoder(input [3:0] binary_input,output [6:0] segment_output);

// Define the seven-segment display patterns for digits 0 to 9
assign segment_output[0] = (binary_input == 4'b0000) ? 1'b0 : 1'b1; // A
assign segment_output[1] = (binary_input == 4'b0001) ? 1'b0 : 1'b1; // B
assign segment_output[2] = (binary_input == 4'b0010) ? 1'b0 : 1'b1; // C
assign segment_output[3] = (binary_input == 4'b0011) ? 1'b0 : 1'b1; // D
assign segment_output[4] = (binary_input == 4'b0100) ? 1'b0 : 1'b1; // E
assign segment_output[5] = (binary_input == 4'b0101) ? 1'b0 : 1'b1; // F
assign segment_output[6] = (binary_input == 4'b0110) ? 1'b0 : 1'b1; // G

endmodule