module priority_sensor_interface(
	sensor,
	clk,
	interrupt,
	rst);
	
input sensor;
input clk;
input rst;
output interrupt;
reg interrupt;

parameter idle=1'b0;
parameter act=1'b1;

reg state_c;
reg state_n;

initial
begin
state_c=idle;
end

always@(posedge clk)
begin
state_c<=state_n;
end

always@(*)
begin
case(state_c)
	idle:
		begin 
		if(sensor) state_n=act;
		else state_n=state_c;
		end
	act:
		begin 
		if(rst) state_n=idle;
		else state_n=state_c;
		end
endcase
end

always@(state_c)
begin
case(state_c)
	idle:begin interrupt=0;end
	act:begin interrupt=1;end
endcase
end

endmodule	

	
		