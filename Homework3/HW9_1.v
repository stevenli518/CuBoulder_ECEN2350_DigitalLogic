module HW9_1(
    input clock_in,reset_n,
    output reg clock_out
);

reg [22:0] clock_divider ;
parameter divide_by = 2;

always@(posedge clock_in,negedge reset_n)
begin
    if(~reset_n)
        begin
            clock_out = 0;
            clock_divider = 0;
        end
     else
        begin
            if(clock_divider != divide_by-1)begin
               clock_divider <= clock_divider+1; 
            end
            else begin
                clock_divider <= 0;
                clock_out = ~clock_out;
            end    
        end   
end

endmodule