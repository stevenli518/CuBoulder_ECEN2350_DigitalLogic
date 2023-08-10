module display_DD_Not_Leap_Year(input [7:0]day_tmp, output [7:0]HEX1, output [7:0]HEX0);
integer day, day_left, day_right;
always @ (day_tmp)
begin
    day = day_tmp; // 1
    if(day > 31 && day <= 59) //2
    begin
        day = day_tmp - 31;
    end
    if(day > 59 && day <= 90) //3
    begin
        day = day_tmp - (31 + 28);
    end
    if(day > 90 && day <= 99)
    begin
        day = day_tmp - (31 + 28 + 31);
    end
    
    day_left= day / 10;
    day_right = day - day_left * 10;
    if (day_left == 0)
    begin
        day_left = 4'b1111;
    end
end
segment_HEX U0(day_left[3:0],HEX1);
segment_HEX U1(day_right[3:0],HEX0);
endmodule