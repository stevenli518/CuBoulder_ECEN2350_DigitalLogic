module DD_MSB_LSB(
input [4:0] DD,
output reg [3:0] DD_MSB,DD_LSB

);


always@(DD)
begin
    if (DD < 10) begin
        DD_MSB = 0;
        DD_LSB = DD;
    end

    else if (DD< 20)begin
        DD_MSB = 1;
        DD_LSB = DD-10 ;
    end
    else if (DD <30) begin
        DD_MSB = 2;
        DD_LSB = DD-20;

    end  
    else 
    begin
        DD_MSB = 3;
        DD_LSB = DD-30;
    end 
end



endmodule