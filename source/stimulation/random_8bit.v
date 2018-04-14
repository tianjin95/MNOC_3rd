module random_8bit(
    input               clk,      /*clock signal*/
    output reg [7:0]    rand_num  /*random number output*/
);

initial
begin
rand_num=8'b11111111;
end

always@(posedge clk)
begin
				rand_num[0] <= rand_num[7];
            rand_num[1] <= rand_num[0];
            rand_num[2] <= rand_num[1];
            rand_num[3] <= rand_num[2];
            rand_num[4] <= rand_num[3]^rand_num[7];
            rand_num[5] <= rand_num[4]^rand_num[7];
            rand_num[6] <= rand_num[5]^rand_num[7];
            rand_num[7] <= rand_num[6];

            
end
endmodule