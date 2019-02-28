
module alu(a,b,opcode,v,y);
input[3:0] a;
input[3:0] b;
input[3:0] opcode;
output reg[3:0] y;
output reg v;
always@* begin
    case(opcode)
        4'b0000 : y = a & b;
        4'b0001 : y = a | b;
        4'b0010 : y = ~a;
        4'b0011 : y = ~(a&b);
        4'b0100 : y = ~(a|b);
        4'b0101 : y = a ^ b ;
        4'b0110 : y = ~(a^b);
        4'b1000 :{v,y} = a + b;
        4'b1001 :{v,y} = a - b;
        4'b1010 : y = a % b;
        4'b1011 :{v,y} = a<<1;
        4'b1100 :{v,y} = b>>1;
        4'b1101 : y = a&&b;
        4'b1110 : y = a||b;
        4'b1111 : y = &a;
        default : y = 4'b0000;
    endcase
end
endmodule
