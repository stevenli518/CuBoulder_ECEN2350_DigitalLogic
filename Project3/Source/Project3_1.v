module Project3_1(
    input ADC_CLK_10,
    input[1:0] KEY,
    input[9:0] SW,
    
    output wire[9:0] LEDR,
    output [7:0] HEX2
);
wire clock2HZ;
wire reset_n, reset_counter;
assign reset_n = KEY[0]? KEY[0]:KEY[0];
wire [2:0]counter,hazard;
wire [3:0] CurrentState,NextState;



clock_divider  #(2_000_000) F5hz (.reset_n(reset_n),.clock_in(ADC_CLK_10),.clock_out(clock2HZ));

CSL CS (.clock(clock2HZ),.reset_n(reset_n),.CurrentState(CurrentState),.NextState(NextState));

NSL NS (.CurrentState(CurrentState),.NextState(NextState),.SW(SW),.KEY(KEY),.reset_counter(reset_counter));

OL O (.LEDR(LEDR),.CurrentState(CurrentState),.counter(counter),.hazard(hazard));

counter C1(.clock(clock2HZ),.CurrentState(CurrentState),.counter(counter),.reset_n(reset_n),.hazard(hazard),.reset_counter(reset_counter));

decoder H2(.birth(CurrentState),.MSB(CurrentState),.HEX(HEX2)); 

endmodule