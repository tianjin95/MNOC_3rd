module router_sensor_NI(
	clk,
	enable,
	core_address,
	priority_sensor,
	regular_sensor0,
	regular_sensor1,
	regular_sensor2,
	regular_sensor3,
	regular_sensor4,
	regular_sensor5,
	regular_sensor6,
	regular_sensor7,
	regular_sensor8,
	regular_sensor9,
	regular_sensor10,
	regular_sensor11,
	regular_sensor12,
	regular_sensor13,
	regular_sensor14,
	regular_sensor15,
	output_req,
	output_data,
	output_bussy);
	
input clk;
input enable;
input [3:0] core_address;
wire clk_division;
input output_bussy;
input [15:0] priority_sensor;
input [7:0] regular_sensor0;
input [7:0] regular_sensor1;
input [7:0] regular_sensor2;
input [7:0] regular_sensor3;
input [7:0] regular_sensor4;
input [7:0] regular_sensor5;
input [7:0] regular_sensor6;
input [7:0] regular_sensor7;
input [7:0] regular_sensor8;
input [7:0] regular_sensor9;
input [7:0] regular_sensor10;
input [7:0] regular_sensor11;
input [7:0] regular_sensor12;
input [7:0] regular_sensor13;
input [7:0] regular_sensor14;
input [7:0] regular_sensor15;
output output_req;
wire output_req;
output [15:0] output_data;
wire [15:0] output_data;

wire priorityNI_FIFO_full;
wire	priorityNI_FIFO_empty;
wire	regularNI_FIFO_empty;
wire	regularNI_FIFO_full;
wire [15:0] priorityNI_FIFO_data;
wire [15:0] regularNI_FIFO_data;
wire priorityNI_FIFO_wr;
wire regularNI_FIFO_wr;
wire [15:0] priorityNI_FIFO_dataout;
wire [15:0] regularNI_FIFO_dataout;
wire outputsel;
wire priorityNI_FIFO_read;
wire regularNI_FIFO_read;

wire [15:0] feedback_rst;
wire [15:0] interrupt;

genvar i;

generate 
for(i=0;i<16;i=i+1)
begin:priority_sensor_interface
priority_sensor_interface priority_sensor_interface(
	.sensor(priority_sensor[i]),
	.clk(clk),
	.interrupt(interrupt[i]),
	.rst(feedback_rst[i]));
end
endgenerate

priorityNI_FIFO_wrctrl priorityNI_FIFO_wrctrl(
	 .clk(clk),
	 .core_address(core_address),
	 .interrupt(interrupt),
	 .feedback_rst(feedback_rst),
	 .priorityFIFO_data(priorityNI_FIFO_data),
	 .priorityNI_FIFO_full(priorityNI_FIFO_full),
	 .priorityNI_FIFO_wr(priorityNI_FIFO_wr));
	 
wire [15:0] slot;
wire sample_en;

regular_sensor_interface regular_sensor_interface0(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor0),
	.sensor_address(4'd0),
	.slot(slot[0]));

regular_sensor_interface regular_sensor_interface1(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor1),
	.sensor_address(4'd1),
	.slot(slot[1]));


regular_sensor_interface regular_sensor_interface2(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor2),
	.sensor_address(4'd2),
	.slot(slot[2]));


regular_sensor_interface regular_sensor_interface3(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor3),
	.sensor_address(4'd3),
	.slot(slot[3]));


regular_sensor_interface regular_sensor_interface4(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor4),
	.sensor_address(4'd4),
	.slot(slot[4]));


regular_sensor_interface regular_sensor_interface5(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor5),
	.sensor_address(4'd5),
	.slot(slot[5]));


regular_sensor_interface regular_sensor_interface6(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor6),
	.sensor_address(4'd6),
	.slot(slot[6]));


regular_sensor_interface regular_sensor_interface7(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor7),
	.sensor_address(4'd7),
	.slot(slot[7]));

regular_sensor_interface regular_sensor_interface8(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor8),
	.sensor_address(4'd8),
	.slot(slot[8]));


regular_sensor_interface regular_sensor_interface9(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor9),
	.sensor_address(4'd9),
	.slot(slot[9]));


regular_sensor_interface regular_sensor_interface10(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor10),
	.sensor_address(4'd10),
	.slot(slot[10]));


regular_sensor_interface regular_sensor_interface11(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor11),
	.sensor_address(4'd11),
	.slot(slot[11]));


regular_sensor_interface regular_sensor_interface12(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor12),
	.sensor_address(4'd12),
	.slot(slot[12]));


regular_sensor_interface regular_sensor_interface13(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor13),
	.sensor_address(4'd13),
	.slot(slot[13]));


regular_sensor_interface regular_sensor_interface14(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor14),
	.sensor_address(4'd14),
	.slot(slot[14]));


regular_sensor_interface regular_sensor_interface15(
	.clk_division(clk_division),
	.sample_en(sample_en),
	.sensor(regular_sensor15),
	.sensor_address(4'd15),
	.slot(slot[15]));


	
regularNI_FIFO_wrctrl regularNI_FIFO_wrctrl(
	.enable(enable),
	.clk_division(clk_division),
	.core_address(core_address),
	.regularFIFO_data(regularNI_FIFO_data),
	.slot(slot),
	.sample_en(sample_en),
	.regularNI_FIFO_empty(regularNI_FIFO_empty),
	.regularNI_FIFO_wr(regularNI_FIFO_wr));

clock_division clock_division(
	.clk(clk),
	.clk_division(clk_division));
	

FIFO_32depth priorityfifo(
	.clk(clk),
	.reset(1'b0),
	.data_in(priorityNI_FIFO_data),
	.read(priorityNI_FIFO_read),
	.write(priorityNI_FIFO_wr),
	.empty(priorityNI_FIFO_empty),
	.full(priorityNI_FIFO_full),
	.data_out(priorityNI_FIFO_dataout));

FIFO_32depth  regularfifo(
	.clk(clk),
	.reset(1'b0),
	.data_in(regularNI_FIFO_data),
	.read(regularNI_FIFO_read),
	.write(regularNI_FIFO_wr),
	.empty(regularNI_FIFO_empty),
	.full(regularNI_FIFO_full),
	.data_out(regularNI_FIFO_dataout));
	

two_1_mux outputmux(
	.data1(priorityNI_FIFO_dataout),
	.data0(regularNI_FIFO_dataout),
	.sel(outputsel),
	.outputdata(output_data));
	
	
FIFO_readctrl FIFO_readctrl(
	.clk(clk),
	.head(regularNI_FIFO_dataout[15:13]),
	.regularFIFO_empty(regularNI_FIFO_empty),
	.priorityFIFO_empty(priorityNI_FIFO_empty),
	.bussy(output_bussy),
	.req(output_req),
	.regularFIFO_read(regularNI_FIFO_read),
	.priorityFIFO_read(priorityNI_FIFO_read),
	.FIFOsel(outputsel));	
	
endmodule
