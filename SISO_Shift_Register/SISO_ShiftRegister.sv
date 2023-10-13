module SISO_ShiftRegister (
    input wire clk,     // Clock input
    input wire reset,   // Reset input
    input wire si,      // Serial input
    output wire so      // Serial output
);

reg [7:0] register;   // 8-bit shift register

always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset the register to all zeros
        register <= 8'b0;
    end else begin
        // Shift the data in from si and shift the data out to so
        register <= {register[6:0], si};
    end
end

assign so = register[7]; // The serial output is the most significant bit of the register

endmodule
