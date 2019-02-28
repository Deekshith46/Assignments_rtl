
module siso(clk,rst,d,q);
input clk,d,rst;
output  q;

wire w1, w2,w3;

 dff siso1(.clk(clk),
           .rst(rst),
           .d(d),
           .q(w1));

 dff siso2(.clk(clk),
           .rst(rst),
           .d(w1),
           .q(w2));

 dff siso3(.clk(clk),
           .rst(rst),
           .d(w2),
           .q(w3));

 dff siso4(.clk(clk),
           .rst(rst),
           .d(w3),
           .q(q));

endmodule
