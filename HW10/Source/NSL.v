module NSL(
    input [3:0] CurrentState,
    output reg [3:0] NextState
);
parameter ZERO = 4'b0000;
parameter ONE = 4'b0001;
parameter TWO = 4'b0010;
parameter THREE = 4'b0011;
parameter FOUR = 4'b0100;
parameter FIVE = 4'b0101;
parameter SIX = 4'b0110;
parameter SEVEN = 4'b0111;
parameter EIGHT = 4'b1000;

always@(*)
begin
    case(CurrentState)
        ZERO : NextState = ONE;
        ONE : NextState = TWO;
        TWO : NextState = THREE;
        THREE : NextState = FOUR;
        FOUR : NextState = FIVE;
        FIVE : NextState = SIX;
        SIX : NextState = SEVEN;
        SEVEN : NextState = EIGHT;
        EIGHT: NextState = ZERO;
        default: NextState = ZERO;
    endcase
end


endmodule