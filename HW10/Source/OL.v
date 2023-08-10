module OL(
    input [3:0] CurrentState,
    output reg [9:0] LEDR
);

parameter ZERO_B = 0;
parameter ONE_B = 9'b0_0000_0001;
parameter TWO_B = 9'b0_0000_0010;
parameter THREE_B = 9'b0_0000_0011;
parameter FIVE_B = 9'b0_0000_0101;
parameter EIGHT_B = 9'b0_0000_1000;
parameter THIRTEEN = 9'b0_0000_1101;
parameter TWENTY_ONE = 9'b0_0001_0101;
parameter THIRTY_FOUR = 9'b0_0010_0010;

parameter ZERO = 4'b0000;
parameter ONE = 4'b0001;
parameter TWO = 4'b0010;
parameter THREE = 4'b0011;
parameter FOUR = 4'b0100;
parameter FIVE = 4'b0101;
parameter SIX = 4'b0110;
parameter SEVEN = 4'b0111;
parameter EIGHT = 4'b1000;



always@(*)begin
    case(CurrentState)
    ZERO : LEDR = ZERO_B;
    ONE : LEDR = ONE_B;
    TWO : LEDR = TWO_B;
    THREE : LEDR = THREE_B;
    FOUR : LEDR = FIVE_B;
    FIVE : LEDR = EIGHT_B;
    SIX : LEDR = THIRTEEN;
    SEVEN : LEDR = TWENTY_ONE;
    EIGHT: LEDR = THIRTY_FOUR;
    default: LEDR = ZERO_B;
    endcase
end

endmodule
