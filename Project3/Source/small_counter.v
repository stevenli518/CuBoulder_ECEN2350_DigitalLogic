module small_counter(
    input clock, aclr,
    output reg [2:0] address
    //output [3:0] q

);

always@(posedge clock,posedge aclr)
begin
    if(aclr == 1)begin
        address <= 3'b0;
    end
   
    else if (address != 6) begin
        address <= address +1;

    end
    else begin
        address <= 0;
    end
end
endmodule