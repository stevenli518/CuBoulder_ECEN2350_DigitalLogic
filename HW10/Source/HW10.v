module HW10(
    input  ADC_CLK_10,
    output wire [9:0] LEDR,
    input[1:0] KEY
);

wire reset_n;
wire [3:0] CurrentState, NextState;
wire clock2HZ;

assign reset_n = KEY[0]? KEY[0]:KEY[0];

clock_divider  #(5_000_000) F2hz (.reset_n(reset_n),.clock_in(ADC_CLK_10),.clock_out(clock2HZ));

CSL CS (.clock(clock2HZ),.reset_n(reset_n),.CurrentState(CurrentState),.NextState(NextState));
NSL NS (.CurrentState(CurrentState),.NextState(NextState));
OL O (.LEDR(LEDR),.CurrentState(CurrentState));



endmodule