module pipo(clk,rst,d1,d2,d3,d4,q1,q2,q3,q4);
input clk,d1,d2,d3,d4,rst;
output  q1,q2,q3,q4;

//wire w1, w2,w3;

 dff pipo1(.clk(clk),
           .rst(rst),
           .d(d1),
           .q(q1));

 dff pipo2(.clk(clk),
           .rst(rst),
           .d(d2),
           .q(q2));

 dff pipo3(.clk(clk),
           .rst(rst),
           .d(d3),
           .q(q3));

 dff pipo4(.clk(clk),
           .rst(rst),
           .d(d4),
           .q(q4));

endmodule
