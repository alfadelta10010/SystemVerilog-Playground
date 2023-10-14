module alu_tb;
    reg[31:0] a;
    reg [31:0] b;
    reg[2:0] f;
    wire [31:0] out;
    wire zero;
    alu DUT (a,b,f,out,zero);
    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, DUT);
        $monitor("A = 0x%x, B = 0x%x, f=0b%b\n\tOut = 0x%x, z = %b", a, b,f, out, zero);

        f = 3'b010; // 0 + 0
        a = 32'h0000_0000;
        b = 32'h0000_0000;
        #10
        if ( out !== 32'h0 | zero !== 1'b1)
             $display("\t%s0 + 0 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h0, 1'b1, "\033[0m");

        f = 3'b010; // 0 + (-1)
        a = 32'h0000_0000;
        b = 32'hFFFF_FFFF;
        #10
        if ( out !== 32'hFFFF_FFFF | zero !== 1'b0)
             $display("\t%s0 + (-1) failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'hFFFF_FFFF, 1'b0, "\033[0m");

        f = 3'b010; // 1 + (-1)
        a = 32'h0000_0001;
        b = 32'hFFFF_FFFF;
        #10
        if ( out !== 32'h0 | zero !== 1'b1)
             $display("\t%s1 + (-1) failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h0, 1'b1, "\033[0m");

        f = 3'b010; // FF + 1
        a = 32'h0000_00FF;
        b = 32'h0000_0001;
        #10;
        if ( out !== 32'h100 | zero !== 1'b0)
             $display("\t%s0xFF + 1 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h100, 1'b0, "\033[0m");

        f = 3'b110; // 0 - 0
        a = 32'h0000_0000;
        b = 32'h0000_0000;
        #10;
        if ( out !== 32'h0 | zero !== 1'b1)
             $display("\t%s0 - 0 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h0, 1'b1, "\033[0m");

        f = 3'b110; // 0 - (-1)
        a = 32'h0000_0000;
        b = 32'hFFFF_FFFF;
        #10;
        if ( out !== 32'h1 | zero !== 1'b0)
             $display("\t%s0 - (-1) failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h1, 1'b0, "\033[0m");

        f = 3'b110; // 1 - 1
        a = 32'h0000_0001;
        b = 32'h0000_0001;
        #10;
        if ( out !== 32'h0 | zero !== 1'b1)
             $display("\t%s1 - 1 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h0, 1'b1, "\033[0m");

        f = 3'b110; // 100 - 1
        a = 32'h0000_0100;
        b = 32'h0000_0001;
        #10;
        if ( out !== 32'hFF | zero !== 1'b0)
             $display("\t%s100 - 1 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'hFF, 1'b0, "\033[0m");

        f = 3'b111; // SLT 0, 0
        a = 32'h0000_0000;
        b = 32'h0000_0000;
        #10;
        if ( out !== 32'h0 | zero !== 1'b1)
             $display("\t%sSLT 0, 0 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h0, 1'b1, "\033[0m");

        f = 3'b111; // SLT 0, 1
        a = 32'h0000_0000;
        b = 32'h0000_0001;
        #10;
        if ( out !== 32'h1 | zero !== 1'b0)
             $display("\t%sSLT 0, 1 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h1, 1'b0, "\033[0m");

        f = 3'b111; // SLT 0, -1
        a = 32'h0000_0000;
        b = 32'hFFFF_FFFF;
        #10;
        if ( out !== 32'h0 | zero !== 1'b1)
             $display("\t%sSLT 0, -1 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h0, 1'b1, "\033[0m");

        f = 3'b111; // SLT 1, 0
        a = 32'h0000_0001;
        b = 32'h0000_0000;
        #10;
        if ( out !== 32'h0 | zero !== 1'b1)
             $display("\t%sSLT 1, 0 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h0, 1'b1, "\033[0m");

        f = 3'b111; // SLT -1, 0
        a = 32'hFFFF_FFFF;
        b = 32'h0000_0000;
        #10;
        if ( out !== 32'h1 | zero !== 1'b0)
             $display("\t%sSLT -1, 0 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h1, 1'b0, "\033[0m");

        f = 3'b000; // -1 & -1
        a = 32'hFFFF_FFFF;
        b = 32'hFFFF_FFFF;
        #10;
        if ( out !== 32'hFFFF_FFFF | zero !== 1'b0)
             $display("\t%s 0xFFFFFFFF & 0xFFFFFFFF failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'hFFFF_FFFF, 1'b0, "\033[0m");

        f = 3'b000; // -1 & 12345678
        a = 32'hFFFF_FFFF;
        b = 32'h1234_5678;
        #10;
        if ( out !== 32'h1234_5678 | zero !== 1'b0)
             $display("\t%s0xFFFFFFFF & 0x12345678 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h12345678, 1'b0, "\033[0m");

        f = 3'b000; // 12345678 & 87654321
        a = 32'h1234_5678;
        b = 32'h8765_4321;
        #10;
        if ( out !== 32'h02244220 | zero !== 1'b0)
             $display("\t%s0x12345678 & 0x87654321 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h02244220, 1'b0, "\033[0m");

        f = 3'b000; // -1 & 0
        a = 32'hFFFF_FFFF;
        b = 32'h0000_0000;
        #10;
        if ( out !== 32'h0 | zero !== 1'b1)
             $display("\t%s0xFFFFFFFF & 0x0 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h0, 1'b1, "\033[0m");

        f = 3'b001; // -1 | -1
        a = 32'hFFFF_FFFF;
        b = 32'hFFFF_FFFF;
        #10;
        if ( out !== 32'hFFFF_FFFF | zero !== 1'b0)
             $display("\t%s0xFFFFFFFF | 0xFFFFFFFF failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'hFFFFFFFF, 1'b0, "\033[0m");

        f = 3'b001; // 12345678 | 87654321
        a = 32'h1234_5678;
        b = 32'h8765_4321;
        #10;
        if ( out !== 32'h9775_5779 | zero !== 1'b0)
             $display("\t%s0x12345678 | 0x87654321 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h97755779, 1'b0, "\033[0m");

        f = 3'b001; // 0 | -1
        a = 32'h0000_0000;
        b = 32'hFFFF_FFFF;
        #10;
        if ( out !== 32'hFFFF_FFFF | zero !== 1'b0)
             $display("\t%s0x0 | 0xFFFFFFFF failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'hFFFFFFFF, 1'b0, "\033[0m");

        f = 3'b001; // 0 | 0
        a = 32'h0000_0000;
        b = 32'h0000_0000;
        #10;
        if ( out !== 32'h0 | zero !== 1'b1)
             $display("\t%s0 | 0 failed.\tExpected out = 0x%0x, z = %b%s","\033[0;31m", 32'h0, 1'b1, "\033[0m");

        $finish;
    end
endmodule

