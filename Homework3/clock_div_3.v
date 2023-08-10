module clock_div_3 (input clk_in, input reset, output reg clk_out);
reg [22:0] clk_divider_pos, clk_divider_neg;
parameter divide_by = 3;
always @ (posedge clk_in, negedge reset)
begin
    if (~reset)
    begin
        clk_out = 0;
        clk_divider_pos = 0;
    end
    else
    begin
        if (clk_divider_pos != divide_by - 1)
            clk_divider_pos <= clk_divider_pos + 1;
        else
        begin
            clk_divider_pos <= 0;
            clk_out <= 1;
        end
    end
end
always @ (negedge clk_in, negedge reset)
begin
    if (~reset)
    begin
        clk_out = 0;
        clk_divider_neg = 0;
    end
    else
    begin
        if (clk_divider_neg != divide_by)
            clk_divider_neg <= clk_divider_neg + 1;
        else
        begin
            clk_divider_neg <= 0;
            clk_out <= 0;
        end
    end
end
endmodule