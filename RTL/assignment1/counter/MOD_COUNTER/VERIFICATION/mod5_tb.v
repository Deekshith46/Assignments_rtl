module mod5_tb;
reg clk;
reg rst;
reg [2:0] mod;
reg updown;
wire [2:0] count;

mod5 dut1(clk,mod,rst,updown,count);

initial begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end

always begin
    clk =0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    updown = 1;
    updown =0;
    mod =0;
#10
rst =0;
mod =3'b101;
updown = 1;
#100
updown = 0;
#100;
$finish();
end
endmodule
