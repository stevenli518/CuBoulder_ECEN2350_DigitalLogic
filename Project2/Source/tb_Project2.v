//`include "frequency.vh"
`timescale 1 ns / 100 ps
module tb_Project2();


reg [1:0]KEY;
reg [9:0] SW;
reg ADC_CLK_10;

wire [7:0] HEX5,HEX4,HEX3,HEX2,HEX1,HEX0;
wire [9:0] LEDR;

Project2 top (.ADC_CLK_10(ADC_CLK_10),.KEY(KEY),.SW(SW),.HEX5(HEX5),.HEX4(HEX4),.HEX3(HEX3),.HEX2(HEX2),.HEX1(HEX1),.HEX0(HEX0),.LEDR(LEDR));

always #10 ADC_CLK_10 = ~ADC_CLK_10;

initial
begin
    $dumpfile("tb_top.vcd");$dumpvars;
    ADC_CLK_10 = 0; SW[9]=0; KEY[0] = 0;KEY[1] =1;

    #100 KEY[0] = 1;
    #20000;
    #1000 SW[9] = 1;
    #3000;
    #100 $finish;
end


endmodule