module counterBCD(
    input clock, reset_n,
    output reg [3:0] countLSB, countMSB
    //output wire [7:0] HEX5,HEX4
);


always @(posedge clock, negedge reset_n ) 
begin
    if (reset_n == 0)
        begin
            countLSB <= 1;             // Reset LEB = 1
            countMSB <= 0;             // Reset MSB = 0;
        end
    
    else if (countLSB != 9) 
        begin
            countLSB <= countLSB + 1;       //LSB counter
        end
    else if (countMSB == 9 && countLSB==9 )         // Roll over / same as reset 
        begin
            countLSB <= 1;
            countMSB <= 0;
        end
            
    else
        begin
            if(countLSB == 9)begin              //MSB counter
                    countMSB <= countMSB+1;
                end
            countLSB <=0;                       // When LSB count to 9, roll over
                
               
        end    
end
endmodule