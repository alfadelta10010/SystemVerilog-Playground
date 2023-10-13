module tb_down_counter;

reg clk;
reg reset;
wire [3:0] count; // Adjust the width based on the counter width

// Instantiate the Down Counter
down_counter #(4) uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

// Clock Generation
always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
end

// Initialize signals
initial begin
    clk = 0;
    reset = 0;
    $dumpfile("counter_waveform.vcd");
    $dumpvars;
    
    // Reset the counter
    reset = 1;
    #10 reset = 0;
end

// Test sequence
initial begin
    $display("Time\tCount");
    $monitor("%d\t%b", $time, count);
    
    // Run the test for a certain number of clock cycles
    #30 reset = 1;
    #10 reset = 0;
    #30 reset = 1;
    #10 reset = 0;
    // Add more test cases as needed
    
    $finish;
end

endmodule
