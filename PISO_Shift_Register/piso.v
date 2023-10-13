module piso_shift_register (
  input wire clk,       
  input wire rst,       
  input wire parallel_in, 
  output wire serial_out 
);

reg [7:0] shift_reg;  

always @(posedge clk or posedge rst) begin
  if (rst) begin
    shift_reg <= 8'b0; 
  end else begin
    shift_reg <= {shift_reg[6:0], parallel_in}; 
  end
end

assign serial_out = shift_reg[7]; 

endmodule
