`timescale 1 ns / 100 ps
module tb_State();

reg clock = 0;
reg reset_n;
reg [9:0] SW;
reg [1:0] KEY;

wire [9:0] LEDR;
wire reset_counter;

wire [3:0] CurrentState, NextState;
wire [2:0]counter,hazard;
always #10 clock = ~clock;

CSL CS (.clock(clock),.reset_n(reset_n),.CurrentState(CurrentState),.NextState(NextState));

NSL NS (.CurrentState(CurrentState),.NextState(NextState),.SW(SW),.KEY(KEY),.reset_counter(reset_counter));

OL O (.LEDR(LEDR),.CurrentState(CurrentState),.counter(counter),.hazard(hazard));

counter C1(.clock(clock),.CurrentState(CurrentState),.counter(counter),.reset_n(reset_n),.hazard(hazard),.reset_counter(reset_counter));

initial
begin
    $dumpfile("tb_State.vcd");
    $dumpvars;
    reset_n = 0; KEY[1]= 1;
    #20 reset_n = 1;
    
    #20 SW[0] =1;           //Hazard
    #200
    #20 SW[0]=0; SW[1]=1;   //Left Turn
    #200
    #20 SW[2] = 1;          //Brake_Left
    #200
    #20 KEY[1] = 0;         //Brake_Right
    #200
    #20 SW[2]=0;            //Right Turn
    #200
    #20 SW[1]=0;SW[2]=1;    //Brake Light
    #100
    #40 reset_n =0;
    #100 $finish;
    
end
initial begin
    $monitor($time, " CurrentState = %d , NextState = %d , LEDR = %b", CurrentState,NextState, LEDR);
end



endmodule
