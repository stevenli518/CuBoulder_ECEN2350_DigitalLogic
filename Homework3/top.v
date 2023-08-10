module project2(input ADC_CLK_10, input [1:0]KEY, input [9:0] SW,output [7:0]HEX5, output [7:0]HEX4, output [7:0]HEX3, output [7:0]HEX2, output [7:0]HEX1, output [7:0]HEX0, output [9:0]LEDR);


wire clk, clk_2hz, clk_5hz;
wire [7:0]count;
wire [7:0] HEX5_tmp, HEX4_tmp;

clock_2hz U0(.clk_in(ADC_CLK_10), .reset_n(KEY[0]), .clk_out(clk_2hz));
clock_5hz U1(.clk_in(ADC_CLK_10), .reset_n(KEY[0]), .clk_out(clk_5hz));

assign clk = KEY[1]?clk_2hz:clk_5hz;

counter_day_year U2(.clock(clk), .reset_n(KEY[0]), .count(count), .LEDR(LEDR));
display_day U3(.day_tmp(count), .HEX5(HEX5), .HEX4(HEX4));
display_MM_Not_Leap_Year U4(.day_tmp(count), .HEX3(HEX3), .HEX2(HEX2));
display_DD_Not_Leap_Year U5(.day_tmp(count), .HEX1(HEX1), .HEX0(HEX0));



endmodule