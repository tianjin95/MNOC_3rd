module regular_sensor_counter(
	clk,
	enable,
	regular_sensor);
	
input clk;
output [7:0] regular_sensor;	
wire [7:0] regular_sensor;	
reg [12:0] counter;
input enable;
wire [7:0] random;

random_8bit random_8bit(
	.clk(clk),
	.rand_num(random));


initial
begin
counter=0;
end

always@(posedge clk)
begin
if(enable) counter<=counter+1'b1;
else counter<=0;
end

assign regular_sensor=random;

endmodule
