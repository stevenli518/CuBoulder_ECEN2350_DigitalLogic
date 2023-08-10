module display_MM_Leap_Year(input [7:0]day_tmp, output [7:0]HEX3, output [7:0]HEX2);
integer day;
integer MM;
always @ (day_tmp)
begin
    day = day_tmp;
    if (day >= 1 && day <= 31)
    begin
        MM = 1;
    end
    if (day >= 32 && day <= 60)
    begin
        MM = 2;
    end
    if (day >= 61 && day <= 91)
    begin
        MM = 3;
    end
    if (day >= 92 && day <= 99)
    begin
        MM = 4;
    end
end
segment_HEX U3(4'b1111, HEX3);
segment_HEX U2(MM[3:0],HEX2);
endmodule