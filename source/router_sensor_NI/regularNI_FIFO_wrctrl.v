//the clock shoud be the Two frequency division clock .


module regularNI_FIFO_wrctrl(
	rst,
	core_address,
	clk_division,
	regularFIFO_data,
	slot,
	sample_en,
	regularNI_FIFO_empty,
	regularNI_FIFO_wr);

input rst;
input [3:0] core_address;
input clk_division;
input [15:0] slot;
input 	regularNI_FIFO_empty;
output [15:0] regularFIFO_data;
reg [15:0] regularFIFO_data;
output sample_en;
reg sample_en;
output regularNI_FIFO_wr;
reg regularNI_FIFO_wr;

parameter idle = 2'b00;
parameter inject_counte = 2'b01;
parameter waite = 2'b10;
parameter sample = 2'b11;
parameter injection_rate = 5;

reg [1:0] state_n;
reg [1:0] state_c;

reg sample_counter_en;
reg inject_counter_en;
reg [13:0] inject_counter;
reg [7:0] data_counter;
reg [3:0] slot_counter;
reg [4:0] cnt;

initial
begin
state_c=idle;
inject_counter=0;
data_counter=0;
slot_counter=0;
cnt=0;
end

always@(posedge clk_division)
begin
if(!rst) state_c<=state_n;
else state_c=idle;
end

always@(*)
begin
case(state_c)
	idle:
		begin
		if(regularNI_FIFO_empty) state_n=inject_counte;
		else state_n=state_c;
		end
	inject_counte:
		begin
		if(inject_counter==injection_rate) state_n=waite;
		else state_n=state_c;
		end
	waite:begin state_n=sample;end
	sample:
		begin
		if(((data_counter==255)&&(slot_counter==15))) state_n=idle;
		else state_n=state_c;
		end
endcase
end

always@(*)
begin
if(rst)
	begin
	regularNI_FIFO_wr=0;
	sample_counter_en=0;
	inject_counter_en=0;
	regularFIFO_data=0;
	sample_en=0;
	end
else
	begin
	case(state_c)
	idle:
		begin
		regularNI_FIFO_wr=0;
		sample_counter_en=0;
		inject_counter_en=0;
		regularFIFO_data=0;
		sample_en=0;
		end
	inject_counte:
		begin
		regularNI_FIFO_wr=0;
		sample_counter_en=0;
		inject_counter_en=1;
		regularFIFO_data=0;
		sample_en=0;
		end
	waite:
		begin
		regularNI_FIFO_wr=0;
		sample_counter_en=0;
		inject_counter_en=0;
		regularFIFO_data=0;
		sample_en=1;
		end
	sample:
		begin
		sample_counter_en=1;
		inject_counter_en=0;
		sample_en=0;
		if(slot!=0)
			begin
			if(clk_division) regularFIFO_data={3'd0,5'd0,core_address,slot_counter};
			else regularFIFO_data={3'b110,5'd0,data_counter};
			regularNI_FIFO_wr=1;
			end
		else
			begin
			regularFIFO_data=0;
			regularNI_FIFO_wr=0;
			end
		end
	endcase
	end
end

always@(posedge clk_division)
begin
if(rst) inject_counter<=0;
else
	begin
	if(inject_counter_en) inject_counter<=inject_counter+1'b1;
	else inject_counter<=0;
	end
end

always@(posedge clk_division)		
begin
if(sample_counter_en&&(!rst))
	begin
	slot_counter<=slot_counter+1'b1;
	if(slot_counter==15) data_counter<=data_counter+1'b1;
	if(slot!=0) cnt<=cnt+1;
	end
else 
	begin
	slot_counter<=0;
	data_counter<=0;
	cnt<=0;
	end
end


endmodule
		


