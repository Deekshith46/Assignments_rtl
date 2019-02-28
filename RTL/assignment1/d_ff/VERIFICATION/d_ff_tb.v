
module d_ff_tb;

reg clk;
reg rst;
reg d;
wire q;
wire qb;

dff dut1(.clk(clk),
         .rst(rst),
         .d(d),
         .q(q),
         .qb(qb));

     initial begin
         $shm_open("wave.shm");
         $shm_probe("ACTMF");
     end
always begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
rst = 1'b1;
d = 1;
#10

rst = 1'b0;
d = 1;
#10
d =0;
#50;
$finish();

end
endmodule
