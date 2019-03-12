module single_port_tb;
reg clk, rst,we;
reg [31 :0 ] din;
reg [31 : 0] address; 
wire [31 : 0] readout;

initial begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
single_port_mem dut(.clk(clk),
                .rst(rst),
                .we(we),
                .din(din),
                .address(address),
                .readout(readout));

            always begin
                clk = 0;
                forever #5 clk = ~clk;
            end

initial begin
rst = 1'b1;
we = 1'b0;
din = 32'd0;
#20
rst = 1'b0;
we = 1'b0;
#10
we = 1'b1; address=32'd0; din = 32'd30;
#5
we = 1'b1; address=32'd1; din = 32'd31;
#40;
we = 1'b0;
$finish();
#100;
end

            
endmodule

