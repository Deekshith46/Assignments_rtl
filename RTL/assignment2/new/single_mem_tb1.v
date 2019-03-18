module single_tb;

reg clk,wr_enable;
reg [4 :0] write_addr,read_addr;
reg [31 :0] write_data;
wire [31 :0] read_out;

single_memo dut(.clk(clk),
                .wr_enable(wr_enable),
                .read_addr(read_addr),
                .write_addr(write_addr),
                .write_data(write_data),
                .read_out(read_out));

initial begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end

always begin
    clk =0;
forever #5 clk =~clk;
end

initial begin
    wr_enable = 0; write_addr = 5'b1011 ; write_data = 32'd22;

#10;
wr_enable = 1'b1 ; write_addr = 5'b1010 ; write_data = 32'd20;
#10;
wr_enable = 0;

read_addr = 5'b1010;
#150;
$finish();
end
endmodule
