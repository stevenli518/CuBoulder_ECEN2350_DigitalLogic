`timescale 1 ns /  100 ps
module tb_Unit1b();
    reg  [1:0] KEY;
    wire [7:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

Unit1b U0 (.KEY(KEY), .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .HEX4(HEX4), .HEX5(HEX5));

initial
    begin
    $dumpfile("Unit1b_output.vcd");
    $dumpvars;
    $display("Simulation begin ");
    $display("My birthday:051800") ; 
    KEY[1] = 1;    
    #10 $display("My mom's birthday :030170") ;
    #10 KEY[1] = 0 ;  
    #10 $finish;
    end

 initial 
    begin
        $monitor($time," KEY[1] = %b, HEX5 = %b, HEX4 = %b, HEX3 = %b, HEX2 = %b, HEX1 = %b, HEX0 = %b", KEY[1],HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
    end   

endmodule