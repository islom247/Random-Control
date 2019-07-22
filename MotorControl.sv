module MotorControl(input logic clk, start, input logic [3:0] rand_num, output logic [3:0] phases);
        logic [1:0] direction;
	logic [1:0] rotation_duration;
	
	always_comb begin
	   case(rand_num)
            4'b0000: begin
                direction <= 2'b01;
                rotation_duration <= 2'b01; end
            4'b0001: begin
                direction <= 2'b01; 
                rotation_duration <= 2'b10; end
            4'b0010: begin
                direction <= 2'b01;
                rotation_duration <= 2'b00; end
            4'b0011: begin
                direction <= 2'b10;
                rotation_duration <= 2'b10; end        
            4'b0100: begin
                direction <= 2'b11;
                rotation_duration <= 2'b11; end
            4'b0101: begin
                direction <= 2'b00;
                rotation_duration <= 2'b00; end          
            4'b0110: begin
                direction <= 2'b10;
                rotation_duration <= 2'b00; end     
            4'b0111: begin
                direction <= 2'b01;
                rotation_duration <= 2'b11; end            
            4'b1000: begin
                direction <= 2'b10;
                rotation_duration <= 2'b01; end
            4'b1001: begin
                direction <= 2'b11;
                rotation_duration <= 2'b10; end
            4'b1010: begin
                direction <= 2'b00;
                rotation_duration <= 2'b01; end
            4'b1011: begin
                direction <= 2'b11;
                rotation_duration <= 2'b00; end   
            4'b1100: begin
                direction <= 2'b00;
                rotation_duration <= 2'b11; end
            4'b1101: begin
                direction <= 2'b00;
                rotation_duration <= 2'b10; end
            4'b1110: begin
                direction <= 2'b10;
                rotation_duration <= 2'b11; end
            4'b1111: begin
                direction <= 2'b11;
                rotation_duration <= 2'b11; end        
            endcase   
	end
	
	steppermotor_wrapper st(clk, direction, rotation_duration, phases, start);
endmodule
