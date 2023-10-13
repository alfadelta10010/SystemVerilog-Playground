module down_counter #(
    parameter N = 4 // Number of bits in the counter
)(
    input wire clk, // Clock input
    input wire reset, // Reset input
    output wire[N-1:0] count // N-bit counter output
);

reg [N-1:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        counter <= 0;
    end else begin
        if (counter == 0) begin
            counter <= (N'd0 - 1);
        end else begin
            counter <= counter - 1;
        end
    end
end

assign count = counter;

endmodule
