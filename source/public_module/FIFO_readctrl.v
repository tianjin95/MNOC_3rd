

module FIFO_readctrl(
	clk,
	head,
	regularFIFO_empty,
	priorityFIFO_empty,
	bussy,
	req,
	regularFIFO_read,
	priorityFIFO_read,
	FIFOsel);
	
input clk;
input regularFIFO_empty;
input priorityFIFO_empty;
input bussy;
input [2:0] head;
output reg regularFIFO_read;
output wire priorityFIFO_read;
output wire req;
output wire FIFOsel;

assign FIFOsel=(!priorityFIFO_empty)?1:0;
assign req=(!priorityFIFO_empty)|(!regularFIFO_empty);
assign priorityFIFO_read=(!bussy&req)?(!priorityFIFO_empty):0;

always@(*)
begin
	if((!bussy)&&req) 
	begin
		if(!priorityFIFO_empty) regularFIFO_read<=(head==3'b110)?1:0;
		else regularFIFO_read<=regularFIFO_empty?0:1;
	end
	else regularFIFO_read<=0;
end

endmodule
