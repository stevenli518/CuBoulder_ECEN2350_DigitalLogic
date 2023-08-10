`timescale 1ns / 100ps
module tb_Project1();
reg [9:0] SW;
reg [1:0] KEY;

wire [9:0] LEDR;
wire [7:0] HEX5,HEX4,HEX3,HEX2,HEX1,HEX0;

Project1 TOP (.SW(SW), .LEDR(LEDR),.KEY(KEY), .HEX5(HEX5),.HEX4(HEX4),.HEX3(HEX3),.HEX2(HEX2),.HEX1(HEX1),.HEX0(HEX0));

initial
    begin
        $dumpfile("Project1.vcd");
        $dumpvars;
        $display ("Start Simulation");
              SW[9] = 1'b0; KEY[0] = 1'b1; SW[7:0] = 8'b1111_1111 ;
          #10 SW[9] = 1'b1; KEY[0] = 1'b1; SW[7:4] = 4'b1010; SW[3:0] = 4'b1010;
          #10 $display("Simulation finished");
          #10 $finish;
          
          

    end


 initial
    begin
        $monitor($time, " SW[9] = %b, KEY[0] = %b, SW[7:0] = %b, LEDR[7:0] = %b,SW[7:4] = %b,SW[3:0] = %b HEX5 = %b, HEX4 = %b, HEX3 = %b, HEX2 = %b, HEX1 = %b,HEX0 = %b", SW[9],KEY[0], SW[7:0], LEDR[7:0],SW[7:4],SW[3:0], HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
    end   

endmodule