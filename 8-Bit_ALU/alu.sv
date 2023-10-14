
module alu(input logic [31:0] a, input logic [31:0] b, input logic [2:0] f, output logic [31:0] out, output logic zero);
    logic [31:0]tmp;
    always @(a, b,f)
        begin
        if (f == 3'b000)    // And
            out = a & b;
        else if( f == 3'b001)   // Or
            out = a | b;
        else if( f == 3'b010)   // Add
            out = a + b;
        else if( f == 3'b100)   // New and
            out = a & ~b;
        else if( f == 3'b101)   // New or
            out = a | ~b;
        else if( f == 3'b110)   // SUB
            out = a - b;
        else if( f == 3'b111)   // SLT
        begin
            tmp = a - b;
            out[31:1] = 31'h0;
            out[0] = (tmp[31] ==  1'b1);
        end
        if (out == 32'h00000000)
            zero = 1;
        else
            zero = 0;
    end
endmodule
