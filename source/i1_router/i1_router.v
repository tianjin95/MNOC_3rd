
module i1_router(
	clk,
	rst,
	output_req,
	output_data,
	output_bussy,
	input_data,
	input_req,
	input_bussy);
	
input clk;	
input rst;
//output port
output wire[15:0] output_data;	
output wire output_req;
input output_bussy;

//input port 
input [15:0] input_data;
input input_req;
output wire input_bussy;

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
wire priority_bussy;
wire regular_bussy;

FIFO priorityfifo(
	.clk(clk),
	.reset(rst),
	.data_in(input_data),
	.read(priorityFIFO_read),
	.write(priorityFIFO_wr),
	.empty(priorityFIFO_empty),
	.full(priorityFIFO_full),
	.data_out(priorityFIFO_dataout));

FIFO regularfifo(
	.clk(clk),
	.reset(rst),
	.data_in(input_data),
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
	
		
FIFO_readctrl i1_router_FIFO_readctrl(
	.head(regularFIFO_dataout[15:13]),
	.regularFIFO_empty(regularFIFO_empty),
	.priorityFIFO_empty(priorityFIFO_empty),
	.bussy(output_bussy),
	.req(output_req),
	.regularFIFO_read(regularFIFO_read),
	.priorityFIFO_read(priorityFIFO_read),
	.FIFOsel(outputsel));
	
i1_router_FIFO_wrctrl
	#(.head_flit(3'b001))
	i1_router_priorityFIFO_wrctrl(
	.clk(clk),
	.rst(rst),
	.input_req(input_req),
	.head(input_data[15:13]),
	.input_bussy(priority_bussy),
	.FIFO_full(priorityFIFO_full),
	.FIFO_wr(priorityFIFO_wr));
	
i1_router_FIFO_wrctrl
	#(.head_flit(3'b000))
	i1_router_regularFIFO_wrctrl(
	.clk(clk),
	.rst(rst),
	.input_req(input_req),
	.head(input_data[15:13]),
	.input_bussy(regular_bussy),
	.FIFO_full(regularFIFO_full),
	.FIFO_wr(regularFIFO_wr));
	
assign input_bussy=priority_bussy&regular_bussy;
	
endmodule

	