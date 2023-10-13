module ParameterizedRAM #(parameter DATA_WIDTH = 8, parameter ADDR_WIDTH = 10, parameter DEPTH = 1024)
  (input logic [ADDR_WIDTH-1:0] write_addr,
   input logic [ADDR_WIDTH-1:0] read_addr,
   input logic write_enable,
   input logic read_enable,
   input logic [DATA_WIDTH-1:0] data_in,
   output logic [DATA_WIDTH-1:0] data_out);

  logic [DATA_WIDTH-1:0] memory [DEPTH-1:0];

  always_ff @(posedge clk or posedge rst)
  begin
    if (rst)
      memory <= '0;
    else if (write_enable)
      memory[write_addr] <= data_in;
  end

  assign data_out = (read_enable) ? memory[read_addr] : '0;

endmodule
