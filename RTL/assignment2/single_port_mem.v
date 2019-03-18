module mem#( parameter memory_depth = 32,parameter data_width = 32)(clk,rst,we,din,address,readout);
input clk, rst,we;
input [data_width -1 :0 ] din;
input [memory_depth - 1 : 0] address; 
output reg [data_width -1 : 0] readout;


reg[data_width-1 : 0] mem[memory_depth -1 : 0];

reg[memory_depth-1:0] reset_count;
reg reset_done;

always@(posedge clk) begin
    if(rst)begin
    mem[address] <=0;
        /*reset_count <=0;
        reset_done <=0; 
        end
        else if(!reset_count)begin
            mem[reset_count ] <= 0;
            reset_count <= reset_count +1;
        end

         else if(reset_count == memory_depth-1)begin
            reset_done =1;*/
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
