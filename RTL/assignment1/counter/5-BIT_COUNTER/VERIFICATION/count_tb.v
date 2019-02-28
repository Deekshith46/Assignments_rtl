
module count_tb;
reg clk;
reg rst;
reg mod;
wire [4:0] count;

counter dut1(.clk(clk),
             .rst(rst),
             .mod(mod),
             .count(count));

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
             mod = 1'b1;
             #5
             mod = 1'b0;
             #15
             rst = 1'b0;
             mod = 1'b0;
             #30
             mod = 1'b1;
             #200
            $finish();
         end
         endmodule



