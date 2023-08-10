`timescale 10 ns / 1 ns
module tb();

reg [7:0]a;
reg [7:0]b;
wire c;

problem3 U1 (.a(a), .b(b), .x(c));

initial
    begin
    $dumpfile("problem3.vcd");
    $dumpvars;
    $display("Starting simulation");
        a = 8'b0000_0000;
        b = 8'b0000_0000;
    #10 a = 8'b1010_0101;
        b = 8'b0101_0101;
    #10 $display("Simulation ended.");
        $display("Yichuan Su");
    $finish;
    end

initial
    $monitor($time, "a = %b,b = %b,c = %b", a, b, c);
endmodule