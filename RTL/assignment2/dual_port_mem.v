module dual_mem(clk,read_en,write_en,read_addr,write_addr,write_data,read_out);

parameter address_width = 5;
parameter data_width = 32;

input                           clk,read_en,write_en;
input      [address_width-1 :0] read_addr , write_addr;
input      [data_width-1    :0] write_data;
output reg [data_width-1    :0] read_out;

reg[data_width-1 : 0 ] mem[(1<<address_width)-1:0] ;

always@(posedge clk) begin
    if(write_en) begin
        mem[write_addr] <= write_data;
    end
end
    always@(posedge clk) begin
    if(read_en)begin
        read_out <= mem[read_addr];
    end
    end
//assign read_out = (read_en)?mem[read_addr] : {data_width{1'b0}};

endmodule
