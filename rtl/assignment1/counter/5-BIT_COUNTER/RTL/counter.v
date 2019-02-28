module counter(clk,rst,mod,count);
input clk;
input rst;
input mod;
output [4:0] count;

reg[4:0] temp =0;

always@(posedge clk) begin
    if(rst) begin
        temp = 0;
    end
    else begin
        if(mod) begin
            temp = temp + 1;
        end
        else begin
            temp = temp - 1;
        end
    end
end

assign count = temp;

endmodule
