module mux122 (
    input a,
    input b,
    input c,
    output d
);
    always_comb begin
	 
        if (c == 1'b1) begin
            d = a;
        end
        else begin
            d = b;
        end
    end
endmodule
