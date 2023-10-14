module BarrelShifter #(parameter DATA_WIDTH = 8) (
  input logic [DATA_WIDTH-1:0] data_in,// input wire
  input logic [2:0] shift_amount, // 
  input logic shift_left,
  output logic [DATA_WIDTH-1:0] data_out
);

  always_comb begin
    if (shift_left) begin
      case (shift_amount)
        3'd0: data_out = data_in; // No shift
        3'd1: data_out = {data_in[DATA_WIDTH-2:0], 1'b0}; // 1-bit left shift
        3'd2: data_out = {data_in[DATA_WIDTH-3:0], 2'b00}; // 2-bit left shift
        3'd3: data_out = {data_in[DATA_WIDTH-4:0], 3'b000}; // 3-bit left shift
        // Continue for all possible shift amounts
        default: data_out = 0; // Unsupported shift amount
      endcase
    end else begin
      case (shift_amount)
        3'd0: data_out = data_in; // No shift
        3'd1: data_out = {1'b0, data_in[DATA_WIDTH-1:1]}; // 1-bit right shift
        3'd2: data_out = {2'b00, data_in[DATA_WIDTH-1:2]}; // 2-bit right shift
        3'd3: data_out = {3'b000, data_in[DATA_WIDTH-1:3]}; // 3-bit right shift
        // Continue for all possible shift amounts
        default: data_out = 0; // Unsupported shift amount
      endcase
    end
  end

endmodule
