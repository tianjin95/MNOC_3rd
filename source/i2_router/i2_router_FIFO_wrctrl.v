

module i2_router_FIFO_wrctrl(
	clk,
	rst,
	input_req1,
	input_req2,
	head1,
	head2,
	input_bussy1,
	input_bussy2,
	FIFO_full,
	FIFO_wr,
	select);
	
input clk;
input rst;
input input_req1;
input input_req2;
input [2:0] head1;
input [2:0] head2;
input FIFO_full;
output reg input_bussy1;
output reg input_bussy2;
output reg FIFO_wr;
output reg select;

reg [1:0] state_c;
reg [1:0] state_n;

parameter idle = 2'b00;
parameter port1_act = 2'b01;
parameter port2_act = 2'b10;
parameter head = 3'b001;

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
		if(input_req1&&(head1==head)&&(~FIFO_full)) state_n=port1_act;
		else if(input_req2&&(head2==head)&&(~FIFO_full)) state_n=port2_act;
		else state_n=state_c;
		end
	port1_act:begin state_n=idle;end
	port2_act:begin state_n=idle;end
	
endcase
end

always@(*)
begin
if(rst)
	begin
	select=0;
	FIFO_wr=0;
	input_bussy1=1;
	input_bussy2=1;
	end
else
	begin
	case(state_c)
	idle:
		begin
		if(input_req1&&(head1==head)&&(~FIFO_full))
		begin
			select=0;
			FIFO_wr=1;
			input_bussy1=FIFO_full;
			input_bussy2=1;
		end
		else if(input_req1&&(head1==3'b110))
		begin
			select=0;
			FIFO_wr=0;
			input_bussy1=0;
			input_bussy2=1;
		end
		else if(input_req2&&(head2==head)&&(~FIFO_full))
		begin
			select=1;
			FIFO_wr=1;
			input_bussy1=1;
			input_bussy2=FIFO_full;
		end
		else if(input_req2&&(head2==3'b110))
		begin
			select=1;
			FIFO_wr=0;
			input_bussy1=1;
			input_bussy2=0;
		end
		else 
		begin
			select=0;
			FIFO_wr=0;
			input_bussy1=1;
			input_bussy2=1;
		end
		end
	port1_act:
		begin
		FIFO_wr=(head1==3'b110)?(!FIFO_full):0;
		select=0;
		input_bussy2=1;
		input_bussy1=FIFO_full;
		end
	port2_act:
		begin
		FIFO_wr=(head2==3'b110)?(!FIFO_full):0;
		select=1;
		input_bussy2=FIFO_full;
		input_bussy1=1;
		end
	endcase
end
end

endmodule
