
module i3_router(
	clk,
	rst,
	output_req,
	output_data,
	output_bussy,
	input_data1,
	input_req1,
	input_bussy1,
	input_data2,
	input_req2,
	input_bussy2,
	input_data3,
	input_req3,
	input_bussy3);
	
input clk;	
input rst;
//output port
output wire[15:0] output_data;	
output wire output_req;
input output_bussy;

//input port 1
input [15:0] input_data1;
input input_req1;
output wire input_bussy1;

//input port 2
input [15:0] input_data2;
input input_req2;
output wire input_bussy2;

//input port 3
input [15:0] input_data3;
input input_req3;
output wire input_bussy3;

wire [15:0] priority_data;
wire [15:0] regular_data;
wire priorityFIFO_read;
wire regularFIFO_read;
wire priorityFIFO_wr;
wire regularFIFO_wr;
wire priorityFIFO_empty;
wire regularFIFO_empty;
wire priorityFIFO_full;
wire regularFIFO_full;
wire [15:0] priorityFIFO_dataout;
wire [15:0] regularFIFO_dataout;
wire outputsel;
wire [1:0] prioritysel;
wire [1:0] regularsel;
wire priority_bussy1;
wire priority_bussy2;
wire priority_bussy3;
wire regular_bussy1;
wire regular_bussy2;
wire regular_bussy3;

FIFO priorityfifo(
	.clk(clk),
	.reset(rst),
	.data_in(priority_data),
	.read(priorityFIFO_read),
	.write(priorityFIFO_wr),
	.empty(priorityFIFO_empty),
	.full(priorityFIFO_full),
	.data_out(priorityFIFO_dataout));

FIFO regularfifo(
	.clk(clk),
	.reset(rst),
	.data_in(regular_data),
	.read(regularFIFO_read),
	.write(regularFIFO_wr),
	.empty(regularFIFO_empty),
	.full(regularFIFO_full),
	.data_out(regularFIFO_dataout));
	
two_1_mux outputmux(
	.data1(priorityFIFO_dataout),
	.data0(regularFIFO_dataout),
	.sel(outputsel),
	.outputdata(output_data));
	
three_1_mux prioritymux(
		.data1(input_data1),
		.data2(input_data2),
		.data3(input_data3),
		.sel(prioritysel),
		.outputdata(priority_data));
		
three_1_mux regularmux(
		.data1(input_data1),
		.data2(input_data2),
		.data3(input_data3),
		.sel(regularsel),
		.outputdata(regular_data));
		
FIFO_readctrl i3_router_FIFO_readctrl(
	.head(regularFIFO_dataout[15:13]),
	.regularFIFO_empty(regularFIFO_empty),
	.priorityFIFO_empty(priorityFIFO_empty),
	.bussy(output_bussy),
	.req(output_req),
	.regularFIFO_read(regularFIFO_read),
	.priorityFIFO_read(priorityFIFO_read),
	.FIFOsel(outputsel));
	
i3_router_FIFO_wrctrl
	#(.head(3'b001))
	i3_router_priorityFIFO_wrctrl(
	.clk(clk),
	.rst(rst),
	.input_req1(input_req1),
	.input_req2(input_req2),
	.input_req3(input_req3),
	.head1(input_data1[15:13]),
	.head2(input_data2[15:13]),
	.head3(input_data3[15:13]),
	.input_bussy1(priority_bussy1),
	.input_bussy2(priority_bussy2),
	.input_bussy3(priority_bussy3),
	.FIFO_full(priorityFIFO_full),
	.FIFO_wr(priorityFIFO_wr),
	.select(prioritysel));
	
i3_router_FIFO_wrctrl
	#(.head(3'b000))
	i3_router_regularFIFO_wrctrl(
	.clk(clk),
	.rst(rst),
	.input_req1(input_req1),
	.input_req2(input_req2),
	.input_req3(input_req3),
	.head1(input_data1[15:13]),
	.head2(input_data2[15:13]),
	.head3(input_data3[15:13]),
	.input_bussy1(regular_bussy1),
	.input_bussy2(regular_bussy2),
	.input_bussy3(regular_bussy3),
	.FIFO_full(regularFIFO_full),
	.FIFO_wr(regularFIFO_wr),
	.select(regularsel));
	
assign input_bussy1=priority_bussy1&regular_bussy1;		
assign input_bussy2=priority_bussy2&regular_bussy2;	
assign input_bussy3=priority_bussy3&regular_bussy3;	

	
endmodule
