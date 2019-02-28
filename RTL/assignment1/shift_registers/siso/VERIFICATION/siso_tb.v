
module siso_tb;
reg clk,rst,d;
wire q;

siso dut(.clk(clk),.rst(rst),.d(d),.q(q));

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

