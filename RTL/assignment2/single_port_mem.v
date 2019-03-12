module mem#( parameter address_length = 32,parameter data_width = 32)(clk,rst,we,din,address,readout);
input clk, rst,we;
input [data_width -1 :0 ] din;
input [address_length - 1 : 0] address; 
output reg [data_width -1 : 0] readout;


reg[data_width-1 :  0] mem[address_length-1 :0];

always@(posedge clk) begin
    if(rst)begin
      mem[address] <= {data_width{1'b0}}; 
    end
    else begin
        if(we)begin
            mem[address] <= din;
        end
        else begin
            readout <= mem[address];
        end
    end
end
endmodule
