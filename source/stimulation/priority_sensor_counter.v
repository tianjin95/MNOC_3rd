module priority_sensor_counter(
	clk,
	rst,
	priority_sensor);
	
input clk;
input rst;
output [15:0] priority_sensor;
reg [15:0] priority_sensor;
reg [16:0] counter;
wire [15:0] random;

reg [15:0] data;

random_16bit random_16bit(
	.clk(clk),
	.rand_num(random));

initial
begin
counter=0;
data=16'd40000;
priority_sensor=0;
end

always@(posedge clk)
begin
if(!rst) counter<=counter+1'b1;
else counter<=0;
end

always@(posedge clk)
begin
if(counter==131070) 
	begin
	priority_sensor<=random;
	data<=random;
	end
//	priority_sensor<=16'd2;
else priority_sensor<=0;
end


endmodule
