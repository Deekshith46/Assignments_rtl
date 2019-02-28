
module alu_tb;
reg[3:0] a;
reg[3:0] b;
reg[3:0] opcode;
wire[3:0] y;
wire v;

alu dut1(.a(a),
         .b(b),
         .opcode(opcode),
         .v(v),
         .y(y));

initial begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end

initial begin
    opcode = 4'b0000 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b0001 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b0010 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b0011 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b0100 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b0101 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b0110 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b0111 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b1000 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b1001 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b1010 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b1011 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b1100 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b1110 ; a = 4'b0101 ; b = 4'b1010;
#10
    opcode = 4'b1111 ; a = 4'b0101 ; b = 4'b1010;
#100;
$finish();
end
endmodule
