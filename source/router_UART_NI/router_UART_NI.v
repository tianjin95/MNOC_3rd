

module router_UART_NI(
	clk,
	rst,
	clk_uart,
	data,
	RXD,
	bussy,
	req);
	
input clk;
input rst;
input clk_uart;
input [15:0] data;
input req;
output reg RXD;
output wire bussy;

reg [31:0] intdata;

parameter idle = 2'b00;
parameter recive = 2'b01;
parameter cent = 2'b10;
reg [7:0] regular_address;
reg [7:0] priority_address;

reg [1:0] state_c;
reg [1:0] state_n;
reg [9:0] counter;
reg counter_en;

reg head_sample;
reg tail_sample;

assign bussy=0;

initial
begin
RXD=1;
state_c=idle;
intdata=0;
regular_address=0;
priority_address=0;
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
		if((counter==0)&&req&&(((data[15:13]==3'b001)&&(data[7:0]==priority_address))||((data[15:13]==3'b000)&&(data[7:0]==regular_address)))) state_n=recive;
		else state_n=state_c;
		end
	recive:
		begin
		if(data[15:13]==3'b110) state_n=cent;
		else state_n=idle;
		end
	cent:
		begin
		if(counter>=10'd640) state_n=idle;
		else state_n=state_c;
		end
endcase
end

always@(*)
begin
if(rst)
	begin
	head_sample=0;
	tail_sample=0;
	counter_en=0;
	end
else
	begin
	case(state_c)
	idle:
		begin
		if((counter==0)&&req&&(((data[15:13]==3'b001)&&(data[7:0]==priority_address))||((data[15:13]==3'b000)&&(data[7:0]==regular_address)))) head_sample=1;
		else head_sample=0;
		tail_sample=0;
		counter_en=0;
		end
	recive:
		begin
		head_sample=0;
		if(data[15:13]==3'b110) tail_sample=1;
		else tail_sample=0;
		counter_en=0;
		end
	cent:
		begin
		counter_en=1;
		head_sample=0;
		tail_sample=0;
		end
	endcase
end
end

always@(posedge clk_uart)
begin
if(counter_en&&(!rst)) counter<=counter+1'b1;
else counter<=0;
end

always@(posedge clk)
begin
if(rst) intdata=0;
else
	begin
	if(head_sample) intdata[31:16]<=data;
	else if(tail_sample) intdata[15:0]<=data;
	end
end

always@(posedge clk_uart)
begin
if(rst) RXD<=1;
else
	begin
	if(counter_en)
	begin
	case(counter)
			10'd0:begin RXD<=0;end
			10'd16:begin RXD<=intdata[24];end
			10'd32:begin RXD<=intdata[25];end
			10'd48:begin RXD<=intdata[26];end
			10'd64:begin RXD<=intdata[27];end
			10'd80:begin RXD<=intdata[28];end
			10'd96:begin RXD<=intdata[29];end
			10'd112:begin RXD<=intdata[30];end
			10'd128:begin RXD<=intdata[31];end
			10'd144:begin RXD<=1;end
			10'd160:begin RXD<=0;end
			10'd176:begin RXD<=intdata[16];end
			10'd192:begin RXD<=intdata[17];end
			10'd208:begin RXD<=intdata[18];end
			10'd224:begin RXD<=intdata[19];end
			10'd240:begin RXD<=intdata[20];end
			10'd256:begin RXD<=intdata[21];end
			10'd272:begin RXD<=intdata[22];end
			10'd288:begin RXD<=intdata[23];end
			10'd304:begin RXD<=1;end
			10'd320:begin RXD<=0;end
			10'd336:begin RXD<=intdata[8];end
			10'd352:begin RXD<=intdata[9];end
			10'd368:begin RXD<=intdata[10];end
			10'd384:begin RXD<=intdata[11];end
			10'd400:begin RXD<=intdata[12];end
			10'd416:begin RXD<=intdata[13];end
			10'd432:begin RXD<=intdata[14];end
			10'd448:begin RXD<=intdata[15];end
			10'd464:begin RXD<=1;end
			10'd480:begin RXD<=0;end
			10'd496:begin RXD<=intdata[0];end
			10'd512:begin RXD<=intdata[1];end
			10'd528:begin RXD<=intdata[2];end
			10'd544:begin RXD<=intdata[3];end
			10'd560:begin RXD<=intdata[4];end
			10'd576:begin RXD<=intdata[5];end
			10'd592:begin RXD<=intdata[6];end
			10'd608:begin RXD<=intdata[7];end
			10'd624:begin RXD<=1;end
		endcase
		end
	else RXD<=1;
	end
end

always@(posedge clk)
begin
if(rst) 
	begin
	regular_address<=0;
	priority_address<=0;
	end
else
	begin
	if((counter==0)&&head_sample&&(data[15:13]==3'b000)&&(data[7:0]==regular_address)) regular_address<=regular_address+1;
	else if((counter==0)&&head_sample&&(data[15:13]==3'b001)&&(data[7:0]==priority_address)) priority_address<=priority_address+1;
	end
end
		
endmodule


	