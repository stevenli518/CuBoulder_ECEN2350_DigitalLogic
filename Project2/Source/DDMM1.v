module DDMM1(
input wire  [3:0] MSB,LSB,
//input  clock, reset_n,
input [9:0] SW,
output reg[4:0] DD,
output reg[3:0] MM,MM_MSB

);
wire [7:0] binary_value;
assign binary_value = (MSB[3:0]*10)+({4'b0,LSB[3:0]});   // 4 bits to decimal



wire leap_year;
assign leap_year = SW[9];


always@(*)
begin
    
     if (binary_value <= 31) begin          // January
        MM <= 1;
        DD <= binary_value; // 
        MM_MSB = 0;
    end
    else if (binary_value <= 31+28+leap_year) begin  //Feb
        MM <= 2;
        DD <= binary_value - 31;
        MM_MSB = 0;
    end
    else if (binary_value <= 31+28+leap_year+31) begin // March
        MM <= 3;
        DD <= binary_value - 31-28-leap_year;
        MM_MSB = 0;
    end
    else  begin                                         // April
        MM <= 4;
        DD <= binary_value-31-28-leap_year-31;
        MM_MSB = 0;
    end
end



endmodule