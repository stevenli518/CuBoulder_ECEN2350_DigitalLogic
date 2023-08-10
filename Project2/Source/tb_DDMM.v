`timescale 1 ns /  100 ps
module tb_DDMM();

reg clock =0;

 wire reset_n;
 reg [1:0] KEY;
 reg [9:0]  SW;

 wire [3:0] MSB,LSB; // day of years
 wire [3:0] MM,DD_MSB,DD_LSB,MM_MSB;
 wire [4:0] DD;
wire [7:0] binary_value;
assign binary_value = (MSB[3:0]*10)+({4'b0,LSB[3:0]}); 
counterBCD C1(.clock(clock),.reset_n(reset_n),.countMSB(MSB),.countLSB(LSB));

DD_MSB_LSB D2(.DD(DD),.DD_MSB(DD_MSB),.DD_LSB(DD_LSB));
DDMM1 D1(.MSB(MSB),.LSB(LSB),.DD(DD),.MM(MM),.SW(SW),.MM_MSB(MM_MSB));




assign reset_n = KEY[0]? KEY[0]:KEY[0];

always#10 clock = ~clock;

initial
	begin
		$dumpfile("tb_DDMM.vcd");
		$dumpvars;
		    KEY[0] = 0;			// Reset/ initialized MSB and LSB/ KEY[0] is pressed
			SW[9:0] = 10'b0;

		#10 KEY[0] = 1;				// KEY[0] is not pressed after 10ns delay
		#2200;						// clock 110
		
		
		
		#10 $finish;
	end


initial
begin
	$monitor($time, " binary_value = %d, DD = %d , DD_MSB = %d,   DD_LSB = %d , MM = %d", binary_value,DD, DD_MSB,DD_LSB,MM );
end	
endmodule