module sipo_tb;
reg clk,rst,d;
wire q1,q2,q3,q4;

sipo dut(.clk(clk),.rst(rst),.d(d),.q1(q1),.q2(q2),.q3(q3),.q4(q4));

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
    d = 0;
#10
rst = 1'b0;
d =1;
#100;
$finish();
end
endmodule

