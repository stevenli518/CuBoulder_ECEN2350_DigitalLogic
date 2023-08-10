`timescale 1 ns /  100 ps
module tb_Unit2();

reg [9:0] SW ;

wire  [9:0] LEDR;
wire [7:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

Unit2 Un2(.SW(SW),.LEDR(LEDR),.HEX5(HEX5),.HEX4(HEX4),.HEX3(HEX3),.HEX2(HEX2),.HEX1(HEX1),.HEX0(HEX0));

initial
begin
    $dumpfile("output_unit2.vcd");
    $dumpvars;
    $display("Simulation Started Unit2");
                SW[7:4]= 4'b0000;  SW[3:0]= 4'b0001; // SW[7:4] HEX5 (0) = 1100_0000;  SW[3:0] HEX1(1)= 1111_1001;   HEX3 = 1100_0111;   LEDR[9:3]=000_0000;
    #10         SW[7:4]= 4'b1010; SW[3:0]= 4'b1010; // SW[7:4] HEX5 (10) = 1000_1000;  SW[3:0] HEX1(10)= 1000_1000;  HEX3 = 1000_0110;   LEDR[9:3]=000_0000;
    #10         SW[7:4]= 4'b1010; SW[3:0]= 4'b0001;// SW[7:4] HEX5 (10) = 1000_1000;   SW[3:0] HEX1(1)= 1111_1001;   HEX3 = 1111_1111;   LEDR[9:3]=000_0000;
    #10 $display("Simulation finished _Chengming Li");
    #10 $finish;

end
initial 
    begin
        $monitor($time," SW[7:4] = %b, SW[3:0] = %b, LEDR[2:0] = %b, HEX5 = %b, HEX3 = %b, HEX1 = %b, LEDR[9:3] = %b, HEX0 = %b, HEX2 = %b, HEX4 = %b", SW[7:4], SW[3:0], LEDR[2:0], HEX5,HEX3,HEX1,LEDR[9:3], HEX0,HEX2,HEX4);
    end




endmodule
