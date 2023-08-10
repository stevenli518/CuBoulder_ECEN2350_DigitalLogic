module CSL(
input clock,reset_n,
input [3:0] NextState,
output reg [3:0] CurrentState
);


always @(posedge clock, negedge reset_n ) begin
    if (reset_n == 0) begin
        CurrentState <= 0;
    end
    else 
        CurrentState <= NextState;
end
endmodule