//`include "frequency.vh"

module Project2(
    input ADC_CLK_10,
    input[1:0] KEY,
    input[9:0] SW,
    output [7:0] HEX5,HEX4,HEX3,HEX2,HEX1,HEX0,
    output wire[9:0] LEDR
);
wire clock2HZ,clock5HZ,clock;
wire reset_n ;
wire [3:0] MSB,LSB,MM,DD_MSB,DD_LSB,MM_MSB;
wire [4:0] DD;

assign LEDR[0] = KEY[1]? clock2HZ:clock5HZ;
assign clock = KEY[1]? clock2HZ:clock5HZ;
assign reset_n = KEY[0]? KEY[0]:KEY[0];


clock_divider  #(5_000_000) F2hz (.reset_n(reset_n),.clock_in(ADC_CLK_10),.clock_out(clock2HZ));

clock_divider #(2_000_000) F5hz (.reset_n(reset_n),.clock_in(ADC_CLK_10),.clock_out(clock5HZ));

counterBCD C1(.clock(clock),.reset_n(reset_n),.countMSB(MSB),.countLSB(LSB));
DDMM1 D1(.MSB(MSB),.LSB(LSB),.DD(DD),.MM(MM),.SW(SW),.MM_MSB(MM_MSB));

DD_MSB_LSB D2(.DD(DD),.DD_MSB(DD_MSB),.DD_LSB(DD_LSB));

decoder H5(.birth(MSB),.MSB(MSB),.HEX(HEX5));   //HEX5
decoder H4(.birth(LSB),.MSB(MSB),.HEX(HEX4));   //HEX4

decoder H3(.birth(MM_MSB),.MSB(MM_MSB),.HEX(HEX3));   //HEX3
decoder H2(.birth(MM),.MSB(MM_MSB),.HEX(HEX2));   //HEX2

decoder H1(.birth(DD_MSB),.MSB(DD_MSB),.HEX(HEX1));   //HEX1
decoder H0(.birth(DD_LSB),.MSB(DD_MSB),.HEX(HEX0));   //HEX0
endmodule
