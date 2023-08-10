module Unit2 (
    input[9:0] SW,
    output  [9:0] LEDR,
    output  [7:0] HEX5,HEX4,HEX3,HEX2,HEX1,HEX0
     
);
Unit1b_Seg H2_5 (.birth(SW[7:4]),.HEX(HEX5));
Unit1b_Seg H2_1 (.birth(SW[3:0]),.HEX(HEX1));

Unit2_EL_Blank EL(.SW(SW[9:0]),.HEX3(HEX3),.HEX0(HEX0),.HEX2(HEX2),.HEX4(HEX4),.LEDR(LEDR));



    
    
endmodule