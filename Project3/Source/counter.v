module counter(
    input clock, reset_n, reset_counter,
    input  [3:0] CurrentState,
    output  reg [2:0]counter,
    output reg [2:0]hazard
    
);




always @(posedge clock, negedge reset_n ) 
begin
    
    if (reset_n == 0 )
        begin
            hazard <=3'b111;
            counter <=0;
        end
    else if (reset_counter == 0) begin
            hazard <=3'b111;
            counter <=0;
    end
   
    else if (counter != 6) begin
        counter <= counter +1;
        hazard <= ~hazard;
       
    end
    else
        begin
            hazard <= ~hazard;
            counter <= 0;
        end
    
end

        
        
    
        

endmodule