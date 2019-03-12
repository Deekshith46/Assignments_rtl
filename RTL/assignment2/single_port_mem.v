module mem#( parameter memory_depth = 32,parameter data_width = 32)(clk,rst,we,din,address,readout);
input clk, rst,we;
input [data_width -1 :0 ] din;
input [memory_depth - 1 : 0] address; 
output reg [data_width -1 : 0] readout;

integer i;

reg[data_width-1 : 0] mem[memory_depth -1 : 0];


always@(posedge clk) begin
    if(rst)begin
        for( i = 0 ; i < (memory_depth-1) ; i=i+1) begin
            mem[i] = {data_width{1'b0}};
        end
       // mem[address] <= 0;
    end
    else begin
        if(we)begin
            mem[address] <= din;
        end
        else 
        begin
            readout <= mem[address];
        end
    end
end
endmodule
