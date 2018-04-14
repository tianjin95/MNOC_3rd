module two_1_mux(
	data1,
	data0,
	sel,
	outputdata);
	
input [15:0] data0;
input [15:0] data1;
input sel;
output [15:0] outputdata;
reg [15:0] outputdata;

always@(sel or data1 or data0)
begin
case(sel)
	1'b0:	begin
			outputdata<=data0;
			end
	1'b1:begin
			outputdata<=data1;
			end
endcase
end

endmodule
