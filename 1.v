module binary_to_decimal(input [3:0] binary, output reg [3:0] decimal);
  always @(binary) // Sensitivity list includes only 'binary'
  begin
    case (binary)
      4'b0000: decimal = 4'b0000;
      4'b0001: decimal = 4'b0001;
      4'b0010: decimal = 4'b0010;
      4'b0011: decimal = 4'b0011;
      // Add cases for all possible 4-bit binary to decimal conversions
      // ...
      default: decimal = 4'b0000; // Default to 0 for unhandled cases
    endcase
  end
endmodule

module decimal_to_binary(input [3:0] decimal, output [3:0] binary);
  always @(decimal) // Sensitivity list includes only 'decimal'
  begin
    // Decimal to binary conversion logic here
    // You need to implement this part
  end
endmodule

module four_bit_adder(input [3:0] A, B, output reg [3:0] Y);
  wire [3:0] A_decimal, B_decimal;
  binary_to_decimal u1 (.binary(A), .decimal(A_decimal));
  binary_to_decimal u2 (.binary(B), .decimal(B_decimal));
  
  always @(A, B) // Sensitivity list includes both 'A' and 'B'
  begin
    Y = A_decimal + B_decimal;
  end
endmodule
