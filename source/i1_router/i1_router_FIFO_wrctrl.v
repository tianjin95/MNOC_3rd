module i1_router_FIFO_wrctrl(
	clk,
	rst,
	input_req,
	head,
	input_bussy,
	FIFO_full,
	FIFO_wr);
	
input clk;
input rst;
input input_req;
input [2:0] head;
input FIFO_full;
output reg input_bussy;
output reg FIFO_wr;

reg state_c;
reg state_n;

parameter idle = 1'b0;
parameter port_act = 1'b1;

parameter head_flit = 3'b001;

initial
begin
state_c=idle;
end

always@(posedge clk) 
begin
if(rst) state_c<=idle;
else state_c<=state_n;
end

always@(*)
begin
case(state_c)
	idle:
		begin
		if(input_req&&(head==head_flit)&&(~FIFO_full)) state_n=port_act;
		else state_n=state_c;
		end
	port_act:begin state_n=idle;end
endcase
end

always@(*)
begin
if(rst)
	begin
	FIFO_wr=0;
	input_bussy=1;
	end
else
	begin
	case(state_c)
	idle:
		begin
		if(input_req&&(head==head_flit)&&(~FIFO_full))
		begin
			FIFO_wr=1;
			input_bussy=FIFO_full;
		end
		else if(input_req&&(head==3'b110))
		begin
			FIFO_wr=0;
			input_bussy=0;
		end
		else 
		begin
			FIFO_wr=0;
			input_bussy=1;
		end
		end
	port_act:
		begin
		FIFO_wr=(head==3'b110)?(!FIFO_full):0;
		input_bussy=FIFO_full;
		end
	endcase
	end
end

endmodule
