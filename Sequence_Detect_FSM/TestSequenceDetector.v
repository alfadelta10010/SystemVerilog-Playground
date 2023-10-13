module TestSequenceDetector;
    reg clk;
    reg reset;
    reg in;
    wire out;
    
    
    SequenceDetector seq_detector (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );
    
    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        reset = 1;
        in = 0;
        
        
        reset = 0;
        #10 reset = 1;
        
        
        in = 1; #10 in = 0; 
        in = 1; #10 in = 0; 
        in = 1; #10 in = 0; 
        in = 0; #10 in = 1; 
        in = 1; #10 in = 0; 
        in = 0; #10 in = 1; 
        
        
        $finish;
    end
endmodule
