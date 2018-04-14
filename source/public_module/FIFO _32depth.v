

//it is just a normal FIFO
module FIFO_32depth(
    input clk,
    input reset,

    input read, write,
    output reg full, empty,

    input [15 : 0] data_in,
    output [15 : 0] data_out

);

reg [15 : 0] mem [31 : 0];
reg [4 : 0] wp, rp;
reg w_flag, r_flag;

initial
begin
wp=0;
w_flag=0;
rp=0;
r_flag=0;
end


always @(posedge clk) begin
    if (reset) begin
        wp <= 0;
        w_flag <= 0;
    end else if(!full && write) begin 
        wp<= (wp==32-1) ? 0 : wp+1;
        w_flag <= (wp==32-1) ? ~w_flag : w_flag;
    end
end

always @(posedge clk) begin
    if(write && !full)begin
        mem[wp] <= data_in;
    end
end

always @(posedge clk) begin
    if (reset) begin
        rp<=0;
        r_flag <= 0;
    end else if(!empty && read) begin 
        rp<= (rp==32-1) ? 0 : rp+1;
        r_flag <= (rp==32-1) ? ~r_flag : r_flag;
    end
end

assign data_out = mem[rp];

always @(*) begin
    if(wp==rp)begin
        if(r_flag==w_flag)begin
            full <= 0;
            empty <= 1;
        end else begin
            full <= 1;
            empty <= 0;
        end
    end else begin
        full <= 0;
        empty <= 0;
    end
end



endmodule