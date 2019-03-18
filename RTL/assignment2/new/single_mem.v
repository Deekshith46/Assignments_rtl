//Design :- Single Port RAM
module single_memo(clk,wr_enable,read_addr,write_addr,write_data,read_out);// module declaration 

parameter address_width = 5; //assigning 5 to the address 
parameter data_width = 32;  //assigning 32 to data width

input clk,wr_enable;       // defining clock , write enable
input[address_width -1 :0] write_addr,read_addr; // defining write address and read address
input[data_width-1 :0] write_data; // input port is to write the data
output[data_width-1 :0] read_out; // output port is to read the data

reg[data_width -1 :0] single_mem[(1<<address_width)-1 :0]; // assigning memory for data length is 32 and depth is 32

always@(posedge clk)
     begin
         if(wr_enable)begin 
         single_mem[write_addr] <= write_data; // at positive edge clock if the write enable is 1 the data in write in the memory of given address
     end
 end

 assign read_out = single_mem[read_addr]; // output port is read port it will read new data
 endmodule
