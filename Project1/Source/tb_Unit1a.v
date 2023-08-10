`timescale 1 ns /  100 ps
module tb_Unit1a();
reg [1:0] KEY ;
reg [7:0] SW ;
wire  [9:0] LEDR;

Unit1a U0(.KEY(KEY), .SW(SW), .LEDR(LEDR));
initial
    begin
        $dumpfile("Unit1a_output.vcd");
        $dumpvars;
        $display("Starting simulation about LEDR[7:0]");
                KEY[0] = 1'b0; SW[7:0] = 8'b0000_0000 ; 
            #10 KEY[0] = 1'b0; SW[7:0] = 8'b1111_1111;   
            #10 KEY[0] = 1'b1; SW[7:0] = 8'b0000_0000;
            #10 KEY[0] = 1'b1; SW[7:0] = 8'b1111_1111;
            #10 $display("Simulation finished");
            #10 $finish;
    end
initial
    begin
        $monitor($time, " KEY[0] = %b, SW[7:0] = %b, LEDR[7:0] = %b, LEDR[9:8] = %b", KEY[0], SW[7:0], LEDR[7:0],LEDR[9:8]);
    end

endmodule