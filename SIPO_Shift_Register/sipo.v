module sipo_shift_register (
  input wire clk,      // Clock input
  input wire clear,    // Clear input
  input wire si,       // Serial input
  output wire [7:0] po // Parallel output
);

  reg [7:0] tmp; // 8-bit shift register

  always @(posedge clk) begin
    if (clear) begin
      tmp <= 8'b00000000; // Clear the shift register to all zeros
    end else begin
      tmp <= {tmp[6:0], si}; // Shift left and input serial data
    end
  end

  assign po = tmp;

endmodule