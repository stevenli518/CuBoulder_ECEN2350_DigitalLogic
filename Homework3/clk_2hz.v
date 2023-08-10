module clock_2hz (input clk_in, input reset_n, output reg clk_out, output [9:0] LEDR);
reg [22:0] clk_divider;
parameter divide_by = 5000000;
always @ (posedge clk_in, negedge reset_n)
begin
    if (~reset_n)
    begin
        clk_out = 0;
        clk_divider = 0;
    end
    else
    begin
        if (clk_divider != divide_by - 1)
            clk_divider <= clk_divider + 1;
        else
        begin
            clk_divider <= 0;
            clk_out <= ~clk_out;
        end
    end
end
assign LEDR = clk_out?10'b00_0000_0001:10'b00_0000_0000;
endmodule