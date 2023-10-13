module up_counter #(
  parameter N = 4 // Define the number of bits
)(
  input wire clk,  // Clock input
  input wire reset, // Reset input
  output reg [N-1:0] count // N-bit counter output
);

always @(posedge clk or posedge reset) begin
  if (reset)
    count <= 0;
  else
    count <= count + 1;
end

endmodule
