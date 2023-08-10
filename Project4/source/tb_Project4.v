`timescale 1 ns / 100 ps
module tb_Project4();

reg MAX10_CLK1_50;
reg [1:0]KEY;

wire [3:0]  VGA_B,VGA_G,VGA_R;

wire VGA_HS,VGA_VS;

Project4 top (.MAX10_CLK1_50(MAX10_CLK1_50),.KEY(KEY),.VGA_B(VGA_B),.VGA_G(VGA_G),.VGA_R(VGA_R),.VGA_HS(VGA_HS),.VGA_VS(VGA_VS));

always #10 MAX10_CLK1_50 = ~MAX10_CLK1_50;

initial
begin
    $dumpfile("tb_Project4.vcd");$dumpvars;
    MAX10_CLK1_50 = 0;
    KEY[0] = 1'b0;
    #25 KEY[0] = 1'b1;

    #20000000;

    #25 $finish;
end
endmodule