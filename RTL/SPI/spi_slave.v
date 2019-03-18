module spi_slave(clk,sclk,rst_n,miso,mosi,ss_n,clkpolarity,clkphase,received_data,data_to_send);
input clk;    //internal clock
input rst_n;  //active low reset
input sclk;   //clock from the master
input mosi;   // master out slaev in
input ss_n; //chip select
input clkpolarity ; // clock polarity
input clkphase;     // clock phase
input [7:0]data_to_send ;
output reg miso;  //master in slvae out
output reg [7:0] received_data;

//internal regs
reg [7:0] shift_reg;
reg [2:0] bit_count;
reg sclk_prev;

////clock wire to detect rising and falling edge//

wire sclk_rising;
wire sclk_falling;

//detect rising and faling edge 

assign sclk_rising = (sclk_prev == ~clkpolarity) && (sclk == clkpolarity);
assign sclk_falling =(sclk_prev == clkpolarity) && (sclk == ~clkpolarity);

always@(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        shift_reg <= 8'b0;
        bit_count <= 3'b0;
        received_data <= 8'b0;
        miso <= 1'b0;
        sclk_prev <= clkpolarity;
    end
    else
    begin
        sclk_prev <= sclk;
        if(!ss_n)begin
   //data sampling (receive mosi)         
  //if clkphase = 0 capture data on first clock edge
  //if clkphase = 1 capture data on second clock edge
            if((clkphase== 1'b0 && sclk_rising) || (clkphase== 1'b1 && sclk_falling)) begin
                shift_reg <= {shift_reg[6:0] , mosi};
                bit_count <= bit_count +1;
            end
 //data shifting (transmit MISO)           
 //if clkphase = 0 output data on falling edge
 //if clkphase = 1 output data on rising edge
            if((clkphase== 1'b0 && sclk_falling) || (clkphase== 1'b1 && sclk_rising)) begin
                miso <= shift_reg[7];
                shift_reg <= {shift_reg[6:0] ,1'b0};
            end
//if all 8 bit are received , store received byte and load new data            
            if(bit_count == 3'b111)begin
                received_data <= shift_reg;
                shift_reg <= data_to_send;
                bit_count <= 3'b00;
            end
        end
        else begin
            bit_count <= 3'b000;
            miso <= 1'b0;
        end
    end
  end
  endmodule


