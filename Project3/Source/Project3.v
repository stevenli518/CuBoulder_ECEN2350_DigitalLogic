module Project3(
    input ADC_CLK_10,
    input[1:0] KEY,
    input[9:0] SW,
    
    output wire[9:0] LEDR,
    output [7:0] HEX2
);

wire [1:0] KEY_A;
wire [9:0] SW_A;
assign KEY_A[1:0] = SW[9]? {q[4],KEY[0]} :KEY[1:0];
assign SW_A[9:0] = SW[9]? {SW[9:3],q[2:0]}:SW[9:0];

//assign SW_A[2:0]= SW[9]? q[2:0]:SW[2:0];
//assign KEY_A[1]= SW[9]? q[4]:KEY[1];
wire aclr,reset_n;
wire [2:0]address;
wire [7:0]q;
assign aclr = ~KEY[0];

assign reset_n = KEY[0];

wire clock02Hz;

wire [9:0] LEDR_A;


Project3_1 mid (.ADC_CLK_10(ADC_CLK_10),.KEY(KEY_A),.SW(SW_A),.LEDR(LEDR),.HEX2(HEX2));

auto A (.aclr(aclr),.address(address),.q(q),.clock(clock02HZ));

clock_divider  #(25_000_000) F02hz (.reset_n(reset_n),.clock_in(ADC_CLK_10),.clock_out(clock02HZ)); 

small_counter S(.clock(clock02HZ),.aclr(aclr),.address(address));
endmodule