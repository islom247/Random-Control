module RandomGenerator(input logic clk, rand_enable, res, output logic [3:0] rand_num);
    logic lfsr;
    logic [15:0] out = 16'b0000_0100_0000_0100;

    assign lfsr = out[15] ^ out[14] ^ out[12] ^ out[3];

    always @(posedge clk) begin
        if(res)
            out <= 16'b0000_0100_0000_0011;
        else
            if(rand_enable) begin
		out <= out << 1;
		out[0] <= lfsr;
                /*out <= {out[14], out[13], out[12], out[11], out[10],
                    out[9], out[8], out[7], out[6],
                    out[5], out[4], out[3], out[2],
                    out[1], out[0], lfsr};*/
        end 
        
    assign rand_num = {out[3], out[2], out[1], out[0]};
    
 endmodule 

