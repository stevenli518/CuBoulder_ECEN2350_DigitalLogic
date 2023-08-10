module Unit1b(
    input  [1:0] KEY,
    input  [23:0] My_Birthday,My_mom_birthday,
    output reg [23:0] Birthday ,
    output [7:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);
Unit1b_Seg H5 (.birth(Birthday[23:20]),.HEX(HEX5));
Unit1b_Seg H4 (.birth(Birthday[19:16]),.HEX(HEX4));
Unit1b_Seg H3 (.birth(Birthday[15:12]),.HEX(HEX3));
Unit1b_Seg H2 (.birth(Birthday[11:8]),.HEX(HEX2));
Unit1b_Seg H1 (.birth(Birthday[7:4]),.HEX(HEX1));
Unit1b_Seg H0 (.birth(Birthday[3:0]),.HEX(HEX0));
always @(*)
    begin
        if(KEY[1] == 1)
        begin
            Birthday[23:0] = 24'h051800;   
        end

        else

        begin
            Birthday[23:0] = 24'h030170;
        end

    end

        
endmodule



