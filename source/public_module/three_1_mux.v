module three_1_mux(
	data1,
	data2,
	data3,
	sel,
	outputdata);
	
input [15:0] data1;
input [15:0] data2;
input [15:0] data3;
input [1:0] sel;
output [15:0] outputdata;
reg [15:0] outputdata;

parameter first = 2'b00;
parameter second = 2'b01;
parameter third = 2'b10;

always@(sel or data1 or data2 or data3)
begin
case(sel)
	first:	
		begin
		outputdata=data1;
		end
	second:
		begin
		outputdata=data2;
		end
	third:
		begin
		outputdata=data3;
		end
	default:
		begin
		outputdata=16'd0;
		end
endcase
end

endmodule
