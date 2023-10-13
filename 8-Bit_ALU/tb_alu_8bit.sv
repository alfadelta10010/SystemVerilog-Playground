module tb_alu_8bit;

  parameter SIM_TIME = 100;
  reg [7:0] a, b;
  reg [1:0] operation;
  wire [7:0] result;
  
  alu_8_bit dut (a, b, operation, result);

  initial begin
    
    a = 8'b11001100;
    b = 8'b10101010;
    operation = 2'b00;
    #SIM_TIME;
    
    a = 8'b11001100;
    b = 8'b10101010;
    operation = 2'b01;
    #SIM_TIME;

    a = 8'b01010101;
    b = 8'b00110011;
    operation = 2'b10;
    #SIM_TIME;

    a = 8'b11110000;
    b = 8'b11001100;
    operation = 2'b11;
    #SIM_TIME;

    $stop;
  end

 
endmodule
