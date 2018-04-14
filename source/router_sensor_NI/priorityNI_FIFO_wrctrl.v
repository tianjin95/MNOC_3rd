
module priorityNI_FIFO_wrctrl(
	 clk,
	 core_address,
	 interrupt,
	 feedback_rst,
	 priorityFIFO_data,
	 priorityNI_FIFO_full,
	 priorityNI_FIFO_wr);
	 
input clk;	 
input [3:0] core_address;
input priorityNI_FIFO_full;
input [15:0] interrupt;
output [15:0] priorityFIFO_data;
reg [15:0] priorityFIFO_data;
output priorityNI_FIFO_wr;
reg priorityNI_FIFO_wr;
output [15:0] feedback_rst;
reg [15:0] feedback_rst;

parameter idle = 2'b00;
parameter act_address = 2'b01;
parameter act_data = 2'b10;
parameter rst = 2'b11;

reg [1:0] state_n;
reg [1:0] state_c;

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
		if(interrupt!=0&&(~priorityNI_FIFO_full)) state_n=act_address;
		else state_n=state_c;
		end
	act_address:begin state_n=act_data;end
	act_data:begin state_n=rst;end
	rst:begin state_n=idle;end
endcase
end

always@(*)
begin
case(state_c)
	idle:
		begin
		feedback_rst=0;
		priorityNI_FIFO_wr=0;
		priorityFIFO_data=0;
		end
	act_address:
		begin
		feedback_rst=0;
		priorityNI_FIFO_wr=~priorityNI_FIFO_full;
		if(interrupt[15]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd15};
		else if(interrupt[14]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd14};		
		else if(interrupt[13]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd13};	
		else if(interrupt[12]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd12};	
		else if(interrupt[11]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd11};	
		else if(interrupt[10]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd10};	
		else if(interrupt[9]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd9};	
		else if(interrupt[8]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd8};	
		else if(interrupt[7]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd7};	
		else if(interrupt[6]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd6};	
		else if(interrupt[5]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd5};	
		else if(interrupt[4]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd4};	
		else if(interrupt[3]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd3};	
		else if(interrupt[2]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd2};	
		else if(interrupt[1]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd1};
		else if(interrupt[0]) priorityFIFO_data={3'b001,5'b00000,core_address,4'd0};
		else priorityFIFO_data=0;
		end
	act_data:
		begin
		feedback_rst=0;
		priorityNI_FIFO_wr=~priorityNI_FIFO_full;
		priorityFIFO_data={3'b110,13'd0};
		end
	rst:
		begin
		priorityFIFO_data=0;
		priorityNI_FIFO_wr=0;
		if(interrupt[15]) feedback_rst[15]=1;
		else if(interrupt[14]) feedback_rst[14]=1;		
		else if(interrupt[13]) feedback_rst[13]=1;	
		else if(interrupt[12]) feedback_rst[12]=1;	
		else if(interrupt[11]) feedback_rst[11]=1;	
		else if(interrupt[10]) feedback_rst[10]=1;	
		else if(interrupt[9]) feedback_rst[9]=1;	
		else if(interrupt[8]) feedback_rst[8]=1;	
		else if(interrupt[7]) feedback_rst[7]=1;	
		else if(interrupt[6]) feedback_rst[6]=1;	
		else if(interrupt[5]) feedback_rst[5]=1;	
		else if(interrupt[4]) feedback_rst[4]=1;	
		else if(interrupt[3]) feedback_rst[3]=1;	
		else if(interrupt[2]) feedback_rst[2]=1;	
		else if(interrupt[1]) feedback_rst[1]=1;
		else if(interrupt[0]) feedback_rst[0]=1;
		else feedback_rst=0;
		end
endcase
end


endmodule		

		