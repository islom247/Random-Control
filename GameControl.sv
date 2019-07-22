module GameControl(input logic clk, res, start, rand_enable,
    //variables for 7-segment
    output logic a, b, c, d, e, f, g, dp, 
    output logic [3:0] an,
    //variables for step-motor
    output logic [3:0] phases
    //variables for keypad
    output logic [3:0] keyb_row,
    input logic  [3:0] keyb_col);
    
    logic [3:0] key_code, rand_num;
    logic check, key_valid;
    
    RandomGenerator rg(clk, rand_enable, res, rand_num);
    MotorControl mc(clk, start, rand_num, phases);
    KeypadControl kc(clk, keyb_row, keyb_col, key_code, key_valid);

    always@ (posedge clk) begin
        if(key_code == rand_num)
            check = 1;
        else check = 0;
    end
         
    SegmentDisplay s(key_valid, check, clk, res, a, b, c, d, e, f, g, dp, an);
endmodule

