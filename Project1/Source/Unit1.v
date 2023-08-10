module Unit1(
    input  [1:0] KEY,
	input  [9:0] SW,
    input [3:0] birth,
    input  [23:0] My_Birthday ,My_mom_birthday,
    
    output wire [23:0] Birthday,  
	output wire  [9:0] LEDR,
    output wire  [7:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);
/*assign  My_Birthday = 24'h051800;
assign  My_mom_birthday = 24'h030170;*/

Unit1a U0(.KEY(KEY), .SW(SW), .LEDR(LEDR));
Unit1b U1 (.KEY(KEY), .My_Birthday(My_Birthday),.My_mom_birthday(My_mom_birthday),.Birthday(Birthday),.HEX5(HEX5),.HEX4(HEX4),.HEX3(HEX3),.HEX2(HEX2),.HEX1(HEX1),.HEX0(HEX0));

endmodule
