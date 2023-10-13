module SequenceDetector (
    input wire clk,
    input wire reset,
    input wire in,
    output wire out
);

typedef enum logic [1:0] {
    s0 = 2'b00,
    s1 = 2'b01,
    s2 = 2'b10,
    s3 = 2'b11
} state_t;

state_t cur_state, next_state;

assign out = (cur_state == s2 || cur_state == s3) ? 1'b1 : 1'b0;

always @(posedge clk or negedge reset) begin
    if (!reset)
        cur_state <= s0;
    else
        cur_state <= next_state;
end

always @(cur_state or in) begin
    case (cur_state)
        s0:
            begin
                if (in)
                    next_state = s2;
                else
                    next_state = s0;
            end
        s1:
            begin
                if (in)
                    next_state = s3;
                else
                    next_state = s1;
            end
        s2:
            begin
                next_state = s0;
            end
        s3:
            begin
                next_state = s1;
            end
    endcase
end

endmodule
