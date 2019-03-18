module dual_port_tb;
reg clk,read_en,write_en;

reg [31 :0] read_addr , write_addr;

reg[31 :0 ] write_data;
wire[31:0] read_out;


initial begin
    $shm_open("wave1.shm");
    $shm_probe("ACTMF");
end

dual_mem dut(.clk(clk),
             .read_en(read_en),
             .write_en(write_en),
             .read_addr(read_addr),
             .write_addr(write_addr),
             .write_data(write_data),
             .read_out(read_out));

always begin
    clk =0;
    forever #5 clk = ~clk;
end

initial begin
write_en = 1 ; write_addr = 32'd12 ; write_data = 32'd244;
#10
write_en = 0; read_en =1; read_addr = 32'd12;
#250;
$finish();
end
endmodule
