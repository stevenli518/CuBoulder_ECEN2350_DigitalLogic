module decoder(
    input [3:0] MSB,birth,
    output reg [7:0] HEX
);

always @(birth)
begin
    case(birth)
        4'b0000: HEX = (MSB == 4'b0000)? 8'b1111_1111:8'b1100_0000;
        4'b0001: HEX = 8'b1111_1001;    //1
        4'b0010: HEX = 8'b1010_0100;    //2
        4'b0011: HEX = 8'b1011_0000;    //3
        4'b0100: HEX = 8'b1001_1001;    //4
        4'b0101: HEX = 8'b1001_0010;    //5 
        4'b0110: HEX = 8'b1000_0010;    //6
        4'b0111: HEX = 8'b1111_1000;    //7
        4'b1000: HEX = 8'b1000_0000;    //8
        4'b1001: HEX = 8'b1001_1000;    //9
       
        default HEX= 8'b1111_1111;
    endcase
    
end


endmodule