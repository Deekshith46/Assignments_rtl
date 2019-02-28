module sipo(clk,rst,d,q1,q2,q3,q4);
input clk,d,rst;
output  q1,q2,q3,q4;

//wire w1, w2,w3;

 dff sipo1(.clk(clk),
           .rst(rst),
           .d(d),
           .q(q1));

 dff sipo2(.clk(clk),
           .rst(rst),
           .d(q1),
           .q(q2));

 dff sipo3(.clk(clk),
           .rst(rst),
           .d(q2),
           .q(q3));

 dff sipo4(.clk(clk),
           .rst(rst),
           .d(q3),
           .q(q4));

endmodule
