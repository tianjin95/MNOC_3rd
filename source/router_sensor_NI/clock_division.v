module clock_division(
	clk,
	clk_division);
	
input clk;
output clk_division;
reg clk_division;

initial
begin
clk_division=1;
end

always@(posedge clk)
begin
clk_division<=~clk_division;
end

endmodule	