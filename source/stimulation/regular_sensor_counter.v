module regular_sensor_counter(
	clk,
	regular_sensor);
	
input clk;
output [7:0] regular_sensor;	
wire [7:0] regular_sensor;	
wire [7:0] random;

random_8bit random_8bit(
	.clk(clk),
	.rand_num(random));

assign regular_sensor=random;

endmodule
