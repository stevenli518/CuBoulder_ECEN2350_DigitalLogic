module Unit1b_Seg(
    input [3:0] birth,
    output reg [7:0] HEX
);
always @(birth)
begin
    case(birth)
        4'b0000: HEX = 8'b1100_0000;    //0
        4'b0001: HEX = 8'b1111_1001;    //1
        4'b0010: HEX = 8'b1010_0100;    //2
        4'b0011: HEX = 8'b1011_0000;    //3
        4'b0100: HEX = 8'b1001_1001;    //4
        4'b0101: HEX = 8'b1001_0010;    //5 
        4'b0110: HEX = 8'b1000_0010;    //6
        4'b0111: HEX = 8'b1111_1000;    //7
        4'b1000: HEX = 8'b1000_0000;    //8
        4'b1001: HEX = 8'b1001_1000;    //9
        4'b1010: HEX = 8'b1000_1000;    //A
        4'b1011: HEX = 8'b1000_0011;    //b
        4'b1100: HEX = 8'b1100_0110;    //C
        4'b1101: HEX = 8'b1010_0001;    //d
        4'b1110: HEX = 8'b1000_0110;    //E
        4'b1111: HEX = 8'b1000_1110;    //F
        default HEX= 8'b1111_1111;
    endcase
end
endmodule