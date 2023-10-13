module PriorityEncoder16 (
  input [15:0] in,    // 16-bit input
  output reg [3:0] out // 4-bit output representing the priority-encoding
);

always_comb begin
    out = 4'b1111; // Initialize the output to all ones (no active inputs)

    // Priority encoding logic
    for (int i = 15; i >= 0; i = i - 1) begin
        if (in[i] == 1'b1) begin
            out = i[3:0]; // Set the output to the highest priority active input
            break;        // Break the loop once an active input is found
        end
    end
end

endmodule
