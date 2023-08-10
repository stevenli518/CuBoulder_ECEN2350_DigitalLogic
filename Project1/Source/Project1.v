module Project1(
    input  [1:0]  KEY,
	input  [9:0] SW,
    output  [9:0] LEDR,
    output  [7:0] HEX5,HEX4,HEX3,HEX2,HEX1,HEX0                        
    
);
wire [7:0] HEX1A,HEX1B;
wire [7:0] HEX2A,HEX2B;
wire [7:0] HEX3A,HEX3B;
wire [7:0] HEX4A,HEX4B;
wire [7:0] HEX5A,HEX5B;
wire [7:0] HEX0A,HEX0B;
wire [9:0] LEDRA,LEDRB;
assign LEDR = SW[9]? LEDRB:LEDRA;
assign HEX1 = SW[9]? HEX1B:HEX1A;
assign HEX2 = SW[9]? HEX2B:HEX2A;
assign HEX3 = SW[9]? HEX3B:HEX3A;
assign HEX4 = SW[9]? HEX4B:HEX4A;
assign HEX5 = SW[9]? HEX5B:HEX5A;
assign HEX0 = SW[9]? HEX0B:HEX0A;
Unit1 P1 (.KEY(KEY), .SW(SW), .LEDR(LEDRA),.HEX5(HEX5A),.HEX4(HEX4A),.HEX3(HEX3A),.HEX2(HEX2A),.HEX1(HEX1A),.HEX0(HEX0A));
Unit2 P2(.SW(SW),.LEDR(LEDRB),.HEX5(HEX5B),.HEX4(HEX4B),.HEX3(HEX3B),.HEX2(HEX2B),.HEX1(HEX1B),.HEX0(HEX0B));
endmodule