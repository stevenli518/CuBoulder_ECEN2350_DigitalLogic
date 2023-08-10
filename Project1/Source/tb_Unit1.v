`timescale 1 ns /  100 ps
module tb_Unit1();
reg [1:0] KEY ;
reg [9:0] SW ;

wire  [9:0] LEDR;
wire [7:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;


Unit1 U2 (.KEY(KEY), .SW(SW), .LEDR(LEDR),.HEX5(HEX5),.HEX4(HEX4),.HEX3(HEX3),.HEX2(HEX2),.HEX1(HEX1),.HEX0(HEX0));



initial
    begin
        $dumpfile("Unit1_output.vcd");
        $dumpvars;
        $display("Starting simulation ");
        $display("Unit1 a");
                KEY[0] = 1'b0; SW[7:0] = 8'b0000_0000 ; 
            #10 KEY[0] = 1'b0; SW[7:0] = 8'b1111_1111;   
            #10 KEY[0] = 1'b1; SW[7:0] = 8'b0000_0000;
            #10 KEY[0] = 1'b1; SW[7:0] = 8'b1111_1111;
            #10 $display("Unit1 b");
            #10 $display("My birthday:051800"); 
            #10 KEY[1] = 1'b1;    
            #10 $display("My mom's birthday :030170") ;
            #10 KEY[1] = 1'b0 ;      
            #10 $display("Simulation finished");
            #10 $finish;
    end


initial 
    begin
        $monitor($time," KEY[0] = %b, SW[7:0] = %b, LEDR[7:0] = %b, LEDR[9:8] = %b , KEY[1] = %b, HEX5 = %b, HEX4 = %b, HEX3 = %b, HEX2 = %b, HEX1 = %b, HEX0 = %b", KEY[0], SW[7:0], LEDR[7:0],LEDR[9:8],KEY[1],HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
    end       
endmodule