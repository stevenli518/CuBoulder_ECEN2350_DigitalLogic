`timescale 1 ns / 100 ps
module tb_State();

reg clock = 0;
reg reset_n;

wire [9:0] LEDR;
wire [3:0] CurrentState, NextState;

always #10 clock = ~clock;

CSL CS (.clock(clock),.reset_n(reset_n),.CurrentState(CurrentState),.NextState(NextState));
NSL NS (.CurrentState(CurrentState),.NextState(NextState));
OL O (.LEDR(LEDR),.CurrentState(CurrentState));

initial
begin
    $dumpfile("tb_State.vcd");
    $dumpvars;
    reset_n = 0;
    #20 reset_n = 1;

    #300;
    #20 reset_n =0;
    #20 $finish;
    
end
initial begin
    $monitor($time, " CurrentState = %d , NextState = %d , LEDR = %d", CurrentState,NextState, LEDR);
end



endmodule
