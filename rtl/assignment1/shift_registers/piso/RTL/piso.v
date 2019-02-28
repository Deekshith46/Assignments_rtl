module piso(clk,rst,s,d1,d2,d3,d4,q);
input clk,d1,d2,d3,d4,rst,s;
output  q;

wire w1,not_wire,w2,w3,w4,w5,w6;

 dff piso1(.clk(clk),
           .rst(rst),
           .d(d1),
           .q(w1));

 dff piso2(.clk(clk),
           .rst(rst),
           .d(w2),
           .q(w3));

 dff piso3(.clk(clk),
           .rst(rst),
           .d(w4),
           .q(w5));

 dff piso4(.clk(clk),
           .rst(rst),
           .d(w6),
           .q(q));

gates g1(.a1(w1),
         .a2(s),
         .a3(not_wire),
         .a4(d2),
         .out(w2));

gates g2(.a1(w3),
         .a2(s),
         .a3(not_wire),
         .a4(d3),
         .out(w4));

gates g3(.a1(w5),
         .a2(s),
         .a3(not_wire),
         .a4(d4),
         .out(w6));
 
not1 n1(.s(s),
        .y(not_wire));

endmodule
