module dual_mem_tb;

reg clk,we_1,we_2,re_1,re_2;
reg [4 : 0] wr_addr1,wr_addr2,re_addr1,re_addr2;
reg [31 :0 ] data1,data2;
wire [31 :0 ] read_out1,read_out2;

dual_mem dut2(.clk(clk),
              .data1(data1),
              .data2(data2),
              .wr_addr1(wr_addr1),
              .wr_addr2(wr_addr2),
              .re_addr1(re_addr1),
              .re_addr2(re_addr2),
              .read_out1(read_out1),
              .read_out2(read_out2),
              .we_1(we_1),
              .we_2(we_2),
              .re_1(re_1),
              .re_2(re_2));


initial begin
    $shm_open("wave1.shm");
    $shm_probe("ACTMF");
end
always begin
    clk =0;
    forever #5 clk = ~clk;
end

initial begin
    we_1 =0;
    we_2 =0;
    re_1 = 0;
    re_2 =0;
#10;
we_1 = 1 ; wr_addr1 = 5'b01011 ; data1 = 32'd10;
#10;
we_2 = 1 ; wr_addr2 = 5'b00001 ; data2 = 32'd12;
#10;
re_1 =1; re_addr1= 5'b01011;
#10;
re_2 = 1 ; re_addr2 = 5'b00001;
#200;
$finish();
end
endmodule
