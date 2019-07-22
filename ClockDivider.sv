module ClockDivider(
input clk_in,
output clk_out
);

logic [26:0] count = {27{1'b0}};
logic clk_NoBuf;
always@ (posedge clk_in) begin
count <= count + 1;
end//always
assign clk_NoBuf = count[26];
BUFG BUFG_inst (
.I(clk_NoBuf), // 1-bit input: Clock input
.O(clk_out) // 1-bit output: Clock output

);
endmodule
