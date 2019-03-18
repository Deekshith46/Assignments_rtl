//Design :- Dual port RAM
module dual_mem(clk,data1,data2,wr_addr1,wr_addr2,re_addr1,re_addr2,read_out1,read_out2,we_1,we_2,re_1,re_2); //module declaration

parameter address_width = 5; // assigning 5 to the address
parameter data_length = 32;  // assigning 32 to the data length

input clk,we_1,we_2,re_1,re_2; // defining clk,write_enable port 1 and port 2 , read_enable port 1 and port 2
input [address_width-1 : 0] wr_addr1,wr_addr2,re_addr1,re_addr2; // defining write address for port 1 and port 2 and read address for port 1 and port 2
input [data_length -1 :0 ] data1,data2;  // data write for port 1 and port 2 for data 1 and data 2
output [data_length-1 :0 ] read_out1,read_out2; // output port for read the data port 1 and port 2 

reg[data_length -1 :0] dual_mem[(1<<address_width)-1:0];  // assigning 2D memory to store data width is 32 and depth is 32

always@(posedge clk) begin
    if(we_1)begin
        dual_mem[wr_addr1] <= data1; // at positive edge of clock if write enable_1 is 1 then data1 is write to the given address
    end
end

always@(posedge clk) begin
    if(we_2)begin
        dual_mem[wr_addr2] <= data2; // at positive edge of clock if write enable_2 is 1 then data2 is write to the given address

    end
end

assign read_out1 = (re_1) ? dual_mem[re_addr1] : {data_length{1'b0}}; // output port1 is read_out to read the port1 data if read_en1 is 1 
assign read_out2 = (re_2) ? dual_mem[re_addr2] : {data_length{1'b0}}; // output port2 is read_out to read the port2 data if read_en2 is 1

endmodule
