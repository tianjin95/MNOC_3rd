module regular_sensor_interface(
	clk_division,
	rst,
	sample_en,
	sensor,
	slot);
	
input clk_division;
input rst;
input sample_en;
input [7:0] sensor;
output slot;
reg slot;
reg [7:0] data;

reg [7:0] data_counter;
reg [3:0] slot_counter;
reg sample_counter_en;
reg state_c;
reg state_n;

parameter idle = 1'b0;
parameter sample = 1'b1;
parameter sensor_address=4'b0000;

initial
begin
state_c=0;
data_counter=0;
slot_counter=0;
data=0;
end

always@(posedge clk_division)
begin
if(rst) state_c<=idle;
else state_c<=state_n;
end

always@(*)
begin
case(state_c)
	idle:
		begin
		if(sample_en) state_n=sample;
		else state_n=state_c;
		end
	sample:
		begin
		if((slot_counter==15)&&(data_counter==255)) state_n=idle;
		else state_n=state_c;
		end
endcase
end

always@(*)
begin
if(rst)
	begin
	sample_counter_en=0;
	slot=0;
	end
else
	begin
	case(state_c)
	idle:
		begin
		sample_counter_en=0;
		slot=0;
		end
	sample:
		begin
		sample_counter_en=1;
		if((slot_counter==sensor_address)&&(data_counter==data)) slot=1;
		else slot=0;
		end
	endcase
end
end

always@(posedge clk_division)		
begin
if(rst) 
	begin
	slot_counter<=0;
	data_counter<=0;
	end
else
	begin
	if(sample_counter_en)
		begin
		slot_counter<=slot_counter+1'b1;
		if(slot_counter==15) data_counter<=data_counter+1'b1;
		end
	else 
		begin
		slot_counter<=0;
		data_counter<=0;
		end
	end
end

always@(posedge clk_division)		
begin
if(rst) data<=0;
else
	begin
	if(sample_en) data<=sensor;
	end
end

endmodule
