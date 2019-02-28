module dff(clk,rst,d,q,qb);
input clk;
input rst;
input d;
output reg q=0;
output qb;

always@(posedge clk)
 begin
     if(!rst) begin
         q = d;
     end
     else begin
         q = 1'b0;
     end
 end
 assign qb = ~q;
 endmodule
