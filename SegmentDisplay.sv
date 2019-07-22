module SegmentDisplay(input logic key_valid, check, clk, res,
        //7-segment signals
        output logic a, b, c, d, e, f, g, dp, 
        output logic [3:0] an);

        logic [3:0] in0 = 4'h0; //initial value
        logic [3:0] in1 = 4'h0; //initial value
        logic [3:0] in2 = 4'h0; //initial value
        logic [3:0] in3 = 4'h0; //initial value
   
        // this module shows 4 decimal numbers on 4-digit 7-Segment.  
        // 4 digits are scanned with high speed, then you do not notice that every time 
        // only one of them is ON. dp is always off.
        SevSeg_4digit SevSeg_4digit_inst0(
            .clk(clk),
            .in3(in3), .in2(in2), .in1(in1), .in0(in0), //user inputs for each digit (hexadecimal)
            .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .dp(dp), // just connect them to FPGA pins (individual LEDs).
            .an(an)   // just connect them to FPGA pins (enable vector for 4 digits active low) 
        );
        
       always@ (posedge clk)
            if(res == 1) in0 <= 4'd3;
            else
                if(key_valid) begin
                    if(check)
                        in0 <= in0 + 4'd1;
                    else in0 <= in0 - 4'd1;
                end
    
endmodule
