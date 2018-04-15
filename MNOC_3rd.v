

module MNOC_3rd(
	clk_50MHz,
	rst,
	RXD);
	
input clk_50MHz;
output RXD;
wire clk;
input rst;

assign led=RXD;

//output port
wire output_bussy;
wire output_req;
wire [15:0] output_data;	
	

//level2 router declarition	
wire level2_router1_output_bussy;
wire [15:0] level2_router1_output_data;	
wire level2_router1_output_req;
wire level2_router2_output_bussy;
wire [15:0] level2_router2_output_data;	
wire level2_router2_output_req;
	
//level3 router declarition	
wire level3_router1_output_bussy;
wire [15:0] level3_router1_output_data;	
wire level3_router1_output_req;
wire level3_router2_output_bussy;
wire [15:0] level3_router2_output_data;	
wire level3_router2_output_req;
wire level3_router3_output_bussy;
wire [15:0] level3_router3_output_data;	
wire level3_router3_output_req;
wire level3_router4_output_bussy;
wire [15:0] level3_router4_output_data;	
wire level3_router4_output_req;

//level4 router declarition	
wire level4_router1_output_bussy;
wire [15:0] level4_router1_output_data;	
wire level4_router1_output_req;
wire level4_router2_output_bussy;
wire [15:0] level4_router2_output_data;	
wire level4_router2_output_req;
wire level4_router3_output_bussy;
wire [15:0] level4_router3_output_data;	
wire level4_router3_output_req;
wire level4_router4_output_bussy;
wire [15:0] level4_router4_output_data;	
wire level4_router4_output_req;
wire level4_router5_output_bussy;
wire [15:0] level4_router5_output_data;	
wire level4_router5_output_req;
wire level4_router6_output_bussy;
wire [15:0] level4_router6_output_data;	
wire level4_router6_output_req;
wire level4_router7_output_bussy;
wire [15:0] level4_router7_output_data;	
wire level4_router7_output_req;
wire level4_router8_output_bussy;
wire [15:0] level4_router8_output_data;	
wire level4_router8_output_req;
wire level4_router9_output_bussy;
wire [15:0] level4_router9_output_data;	
wire level4_router9_output_req;
wire level4_router10_output_bussy;
wire [15:0] level4_router10_output_data;	
wire level4_router10_output_req;
wire level4_router11_output_bussy;
wire [15:0] level4_router11_output_data;	
wire level4_router11_output_req;
wire level4_router12_output_bussy;
wire [15:0] level4_router12_output_data;	
wire level4_router12_output_req;

//level5 router declarition	
wire level5_router1_output_bussy;
wire [15:0] level5_router1_output_data;	
wire level5_router1_output_req;
wire level5_router2_output_bussy;
wire [15:0] level5_router2_output_data;	
wire level5_router2_output_req;
wire level5_router3_output_bussy;
wire [15:0] level5_router3_output_data;	
wire level5_router3_output_req;
wire level5_router4_output_bussy;
wire [15:0] level5_router4_output_data;	
wire level5_router4_output_req;
wire level5_router5_output_bussy;
wire [15:0] level5_router5_output_data;	
wire level5_router5_output_req;
wire level5_router6_output_bussy;
wire [15:0] level5_router6_output_data;	
wire level5_router6_output_req;
wire level5_router7_output_bussy;
wire [15:0] level5_router7_output_data;	
wire level5_router7_output_req;
wire level5_router8_output_bussy;
wire [15:0] level5_router8_output_data;	
wire level5_router8_output_req;

//NI
wire NI0_output_req;
wire NI0_output_bussy;
wire [15:0] NI0_output_data;

wire NI1_output_req;
wire NI1_output_bussy;
wire [15:0] NI1_output_data;

wire NI2_output_req;
wire NI2_output_bussy;
wire [15:0] NI2_output_data;

wire NI3_output_req;
wire NI3_output_bussy;
wire [15:0] NI3_output_data;

wire NI4_output_req;
wire NI4_output_bussy;
wire [15:0] NI4_output_data;

wire NI5_output_req;
wire NI5_output_bussy;
wire [15:0] NI5_output_data;

wire NI6_output_req;
wire NI6_output_bussy;
wire [15:0] NI6_output_data;

wire NI7_output_req;
wire NI7_output_bussy;
wire [15:0] NI7_output_data;

wire NI8_output_req;
wire NI8_output_bussy;
wire [15:0] NI8_output_data;

wire NI9_output_req;
wire NI9_output_bussy;
wire [15:0] NI9_output_data;

wire NI10_output_req;
wire NI10_output_bussy;
wire [15:0] NI10_output_data;

wire NI11_output_req;
wire NI11_output_bussy;
wire [15:0] NI11_output_data;

wire NI12_output_req;
wire NI12_output_bussy;
wire [15:0] NI12_output_data;

wire NI13_output_req;
wire NI13_output_bussy;
wire [15:0] NI13_output_data;

wire NI14_output_req;
wire NI14_output_bussy;
wire [15:0] NI14_output_data;

wire NI15_output_req;
wire NI15_output_bussy;
wire [15:0] NI15_output_data;


//stimulation module declarition
wire [15:0] priority_sensor;
wire [7:0] regular_sensor;
wire clock_division;
wire clk_uart;
	
super_pll super_pll(
	.refclk(clk_50MHz),
	.rst(rst),
	.outclk_0(clk),
	.outclk_1(clk_uart));
	
clock_division clock_division1(
	.clk(clk),
	.clk_division(clk_division));
	
regular_sensor_counter regular_stimulation(
	.clk(clk_division),
	.regular_sensor(regular_sensor));
	
priority_sensor_counter priority_stimulation(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor));

i2_router root_router(
	.clk(clk),
	.rst(rst),
	.output_req(output_req),
	.output_data(output_data),
	.output_bussy(output_bussy),
	.input_data1(level2_router1_output_data),
	.input_req1(level2_router1_output_req),
	.input_bussy1(level2_router1_output_bussy),
	.input_data2(level2_router2_output_data),
	.input_req2(level2_router2_output_req),
	.input_bussy2(level2_router2_output_bussy));
	
i2_router level2_router1(
	.clk(clk),
	.rst(rst),
	.output_req(level2_router1_output_req),
	.output_data(level2_router1_output_data),
	.output_bussy(level2_router1_output_bussy),
	.input_data1(level3_router1_output_data),
	.input_req1(level3_router1_output_req),
	.input_bussy1(level3_router1_output_bussy),
	.input_data2(level3_router2_output_data),
	.input_req2(level3_router2_output_req),
	.input_bussy2(level3_router2_output_bussy));

i2_router level2_router2(
	.clk(clk),
	.rst(rst),
	.output_req(level2_router2_output_req),
	.output_data(level2_router2_output_data),
	.output_bussy(level2_router2_output_bussy),
	.input_data1(level3_router3_output_data),
	.input_req1(level3_router3_output_req),
	.input_bussy1(level3_router3_output_bussy),
	.input_data2(level3_router4_output_data),
	.input_req2(level3_router4_output_req),
	.input_bussy2(level3_router4_output_bussy));

i3_router level3_router1(
	.clk(clk),
	.rst(rst),
	.output_req(level3_router1_output_req),
	.output_data(level3_router1_output_data),
	.output_bussy(level3_router1_output_bussy),
	.input_data1(level4_router1_output_data),
	.input_req1(level4_router1_output_req),
	.input_bussy1(level4_router1_output_bussy),
	.input_data2(level4_router2_output_data),
	.input_req2(level4_router2_output_req),
	.input_bussy2(level4_router2_output_bussy),
	.input_data3(level4_router3_output_data),
	.input_req3(level4_router3_output_req),
	.input_bussy3(level4_router3_output_bussy));

i3_router level3_router2(
	.clk(clk),
	.rst(rst),
	.output_req(level3_router2_output_req),
	.output_data(level3_router2_output_data),
	.output_bussy(level3_router2_output_bussy),
	.input_data1(level4_router4_output_data),
	.input_req1(level4_router4_output_req),
	.input_bussy1(level4_router4_output_bussy),
	.input_data2(level4_router5_output_data),
	.input_req2(level4_router5_output_req),
	.input_bussy2(level4_router5_output_bussy),
	.input_data3(level4_router6_output_data),
	.input_req3(level4_router6_output_req),
	.input_bussy3(level4_router6_output_bussy));

i3_router level3_router3(
	.clk(clk),
	.rst(rst),
	.output_req(level3_router3_output_req),
	.output_data(level3_router3_output_data),
	.output_bussy(level3_router3_output_bussy),
	.input_data1(level4_router7_output_data),
	.input_req1(level4_router7_output_req),
	.input_bussy1(level4_router7_output_bussy),
	.input_data2(level4_router8_output_data),
	.input_req2(level4_router8_output_req),
	.input_bussy2(level4_router8_output_bussy),
	.input_data3(level4_router9_output_data),
	.input_req3(level4_router9_output_req),
	.input_bussy3(level4_router9_output_bussy));

i3_router level3_router4(
	.clk(clk),
	.rst(rst),
	.output_req(level3_router4_output_req),
	.output_data(level3_router4_output_data),
	.output_bussy(level3_router4_output_bussy),
	.input_data1(level4_router10_output_data),
	.input_req1(level4_router10_output_req),
	.input_bussy1(level4_router10_output_bussy),
	.input_data2(level4_router11_output_data),
	.input_req2(level4_router11_output_req),
	.input_bussy2(level4_router11_output_bussy),
	.input_data3(level4_router12_output_data),
	.input_req3(level4_router12_output_req),
	.input_bussy3(level4_router12_output_bussy));

i1_router level4_router1(
	.clk(clk),
	.rst(rst),
	.output_req(level4_router1_output_req),
	.output_data(level4_router1_output_data),
	.output_bussy(level4_router1_output_bussy),
	.input_data(NI0_output_data),
	.input_req(NI0_output_req),
	.input_bussy(NI0_output_bussy));

i1_router level4_router3(
	.clk(clk),
	.rst(rst),
	.output_req(level4_router3_output_req),
	.output_data(level4_router3_output_data),
	.output_bussy(level4_router3_output_bussy),
	.input_data(NI1_output_data),
	.input_req(NI1_output_req),
	.input_bussy(NI1_output_bussy));
	
i1_router level4_router4(
	.clk(clk),
	.rst(rst),
	.output_req(level4_router4_output_req),
	.output_data(level4_router4_output_data),
	.output_bussy(level4_router4_output_bussy),
	.input_data(NI2_output_data),
	.input_req(NI2_output_req),
	.input_bussy(NI2_output_bussy));
	
i1_router level4_router6(
	.clk(clk),
	.rst(rst),
	.output_req(level4_router6_output_req),
	.output_data(level4_router6_output_data),
	.output_bussy(level4_router6_output_bussy),
	.input_data(NI3_output_data),
	.input_req(NI3_output_req),
	.input_bussy(NI3_output_bussy));
	
i1_router level4_router7(
	.clk(clk),
	.rst(rst),
	.output_req(level4_router7_output_req),
	.output_data(level4_router7_output_data),
	.output_bussy(level4_router7_output_bussy),
	.input_data(NI4_output_data),
	.input_req(NI4_output_req),
	.input_bussy(NI4_output_bussy));
	
i1_router level4_router9(
	.clk(clk),
	.rst(rst),
	.output_req(level4_router9_output_req),
	.output_data(level4_router9_output_data),
	.output_bussy(level4_router9_output_bussy),
	.input_data(NI5_output_data),
	.input_req(NI5_output_req),
	.input_bussy(NI5_output_bussy));
	
i1_router level4_router10(
	.clk(clk),
	.rst(rst),
	.output_req(level4_router10_output_req),
	.output_data(level4_router10_output_data),
	.output_bussy(level4_router10_output_bussy),
	.input_data(NI6_output_data),
	.input_req(NI6_output_req),
	.input_bussy(NI6_output_bussy));
	
i1_router level4_router12(
	.clk(clk),
	.rst(rst),
	.output_req(level4_router12_output_req),
	.output_data(level4_router12_output_data),
	.output_bussy(level4_router12_output_bussy),
	.input_data(NI7_output_data),
	.input_req(NI7_output_req),
	.input_bussy(NI7_output_bussy));
	
i2_router level4_router2(
	.clk(clk),
	.rst(rst),
	.output_req(level4_router2_output_req),
	.output_data(level4_router2_output_data),
	.output_bussy(level4_router2_output_bussy),
	.input_data1(level5_router1_output_data),
	.input_req1(level5_router1_output_req),
	.input_bussy1(level5_router1_output_bussy),
	.input_data2(level5_router2_output_data),
	.input_req2(level5_router2_output_req),
	.input_bussy2(level5_router2_output_bussy));

i2_router level4_router5(
	.clk(clk),
	.rst(rst),
	.output_req(level4_router5_output_req),
	.output_data(level4_router5_output_data),
	.output_bussy(level4_router5_output_bussy),
	.input_data1(level5_router3_output_data),
	.input_req1(level5_router3_output_req),
	.input_bussy1(level5_router3_output_bussy),
	.input_data2(level5_router4_output_data),
	.input_req2(level5_router4_output_req),
	.input_bussy2(level5_router4_output_bussy));
	
i2_router level4_router8(
	.clk(clk),
	.rst(rst),
	.output_req(level4_router8_output_req),
	.output_data(level4_router8_output_data),
	.output_bussy(level4_router8_output_bussy),
	.input_data1(level5_router5_output_data),
	.input_req1(level5_router5_output_req),
	.input_bussy1(level5_router5_output_bussy),
	.input_data2(level5_router6_output_data),
	.input_req2(level5_router6_output_req),
	.input_bussy2(level5_router6_output_bussy));
	
i2_router level4_router11(
	.clk(clk),
	.rst(rst),
	.output_req(level4_router11_output_req),
	.output_data(level4_router11_output_data),
	.output_bussy(level4_router11_output_bussy),
	.input_data1(level5_router7_output_data),
	.input_req1(level5_router7_output_req),
	.input_bussy1(level5_router7_output_bussy),
	.input_data2(level5_router8_output_data),
	.input_req2(level5_router8_output_req),
	.input_bussy2(level5_router8_output_bussy));
	
i1_router level5_router1(
	.clk(clk),
	.rst(rst),
	.output_req(level5_router1_output_req),
	.output_data(level5_router1_output_data),
	.output_bussy(level5_router1_output_bussy),
	.input_data(NI8_output_data),
	.input_req(NI8_output_req),
	.input_bussy(NI8_output_bussy));	
	
i1_router level5_router2(
	.clk(clk),
	.rst(rst),
	.output_req(level5_router2_output_req),
	.output_data(level5_router2_output_data),
	.output_bussy(level5_router2_output_bussy),
	.input_data(NI9_output_data),
	.input_req(NI9_output_req),
	.input_bussy(NI9_output_bussy));

i1_router level5_router3(
	.clk(clk),
	.rst(rst),
	.output_req(level5_router3_output_req),
	.output_data(level5_router3_output_data),
	.output_bussy(level5_router3_output_bussy),
	.input_data(NI10_output_data),
	.input_req(NI10_output_req),
	.input_bussy(NI10_output_bussy));	

i1_router level5_router4(
	.clk(clk),
	.rst(rst),
	.output_req(level5_router4_output_req),
	.output_data(level5_router4_output_data),
	.output_bussy(level5_router4_output_bussy),
	.input_data(NI11_output_data),
	.input_req(NI11_output_req),
	.input_bussy(NI11_output_bussy));	

i1_router level5_router5(
	.clk(clk),
	.rst(rst),
	.output_req(level5_router5_output_req),
	.output_data(level5_router5_output_data),
	.output_bussy(level5_router5_output_bussy),
	.input_data(NI12_output_data),
	.input_req(NI12_output_req),
	.input_bussy(NI12_output_bussy));

i1_router level5_router6(
	.clk(clk),
	.rst(rst),
	.output_req(level5_router6_output_req),
	.output_data(level5_router6_output_data),
	.output_bussy(level5_router6_output_bussy),
	.input_data(NI13_output_data),
	.input_req(NI13_output_req),
	.input_bussy(NI13_output_bussy));		
	
i1_router level5_router7(
	.clk(clk),
	.rst(rst),
	.output_req(level5_router7_output_req),
	.output_data(level5_router7_output_data),
	.output_bussy(level5_router7_output_bussy),
	.input_data(NI14_output_data),
	.input_req(NI14_output_req),
	.input_bussy(NI14_output_bussy));	

i1_router level5_router8(
	.clk(clk),
	.rst(rst),
	.output_req(level5_router8_output_req),
	.output_data(level5_router8_output_data),
	.output_bussy(level5_router8_output_bussy),
	.input_data(NI15_output_data),
	.input_req(NI15_output_req),
	.input_bussy(NI15_output_bussy));

router_sensor_NI
	#(.core_address(4'd0))
	NI0(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI0_output_req),
	.output_data(NI0_output_data),
	.output_bussy(NI0_output_bussy));

router_sensor_NI
	#(.core_address(4'd1))
	NI1(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI1_output_req),
	.output_data(NI1_output_data),
	.output_bussy(NI1_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd2))
	NI2(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI2_output_req),
	.output_data(NI2_output_data),
	.output_bussy(NI2_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd3))
	NI3(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI3_output_req),
	.output_data(NI3_output_data),
	.output_bussy(NI3_output_bussy));
	
router_sensor_NI
#(.core_address(4'd4))
	NI4(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI4_output_req),
	.output_data(NI4_output_data),
	.output_bussy(NI4_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd5))
	NI5(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI5_output_req),
	.output_data(NI5_output_data),
	.output_bussy(NI5_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd6))
	NI6(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI6_output_req),
	.output_data(NI6_output_data),
	.output_bussy(NI6_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd7))
	NI7(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI7_output_req),
	.output_data(NI7_output_data),
	.output_bussy(NI7_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd8))
	NI8(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI8_output_req),
	.output_data(NI8_output_data),
	.output_bussy(NI8_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd9))
	NI9(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI9_output_req),
	.output_data(NI9_output_data),
	.output_bussy(NI9_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd10))
	NI10(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI10_output_req),
	.output_data(NI10_output_data),
	.output_bussy(NI10_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd11))
	NI11(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI11_output_req),
	.output_data(NI11_output_data),
	.output_bussy(NI11_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd12))
	NI12(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI12_output_req),
	.output_data(NI12_output_data),
	.output_bussy(NI12_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd13))
	NI13(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI13_output_req),
	.output_data(NI13_output_data),
	.output_bussy(NI13_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd14))
	NI14(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI14_output_req),
	.output_data(NI14_output_data),
	.output_bussy(NI14_output_bussy));
	
router_sensor_NI
	#(.core_address(4'd15))
	NI15(
	.clk(clk),
	.rst(rst),
	.priority_sensor(priority_sensor),
	.regular_sensor0(regular_sensor),
	.regular_sensor1(regular_sensor),
	.regular_sensor2(regular_sensor),
	.regular_sensor3(regular_sensor),
	.regular_sensor4(regular_sensor),
	.regular_sensor5(regular_sensor),
	.regular_sensor6(regular_sensor),
	.regular_sensor7(regular_sensor),
	.regular_sensor8(regular_sensor),
	.regular_sensor9(regular_sensor),
	.regular_sensor10(regular_sensor),
	.regular_sensor11(regular_sensor),
	.regular_sensor12(regular_sensor),
	.regular_sensor13(regular_sensor),
	.regular_sensor14(regular_sensor),
	.regular_sensor15(regular_sensor),
	.output_req(NI15_output_req),
	.output_data(NI15_output_data),
	.output_bussy(NI15_output_bussy));

router_UART_NI router_UART_NI(
	.clk(clk),
	.clk_uart(clk_uart),
	.data(output_data),
	.RXD(RXD),
	.bussy(output_bussy),
	.req(output_req));

endmodule




	