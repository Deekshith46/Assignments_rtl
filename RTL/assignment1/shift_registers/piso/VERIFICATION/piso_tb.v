module piso_tb;
reg clk,rst,d1,d2,d3,d4,s;
wire q;

piso dut(.clk(clk),.rst(rst),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.q(q),.s(s));

initial begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end

always begin
    clk =0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1'b1;
    d1 = 0;
    d2 =0;
    d3 =0;
    d4 =0;
    s=0;

#10
rst = 1'b0;
s =0;
d1=1;
#10
d2=0;
#10;
d3 =1;
#10;
d4 =1;
#500;
$finish();
end
endmodule

