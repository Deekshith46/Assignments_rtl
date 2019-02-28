module gates(a1,a2,a3,a4,out);
input a1,a2,a3,a4;
output out;

wire w1,w2;

and g1(w1,a1,a2);
and g2(w2,a3,a4);
or g3(out,w1,w2);

endmodule
