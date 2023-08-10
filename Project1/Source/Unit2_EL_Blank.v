module Unit2_EL_Blank(
    input  [9:0] SW,
    output reg  [7:0] HEX3,
    output [7:0] HEX0,HEX2,HEX4,
    output reg [9:0] LEDR
    //output  [9:3] LEDR
    
);
assign HEX0[7:0]= 8'b1111_1111;
assign HEX2[7:0]= 8'b1111_1111;
assign HEX4[7:0]= 8'b1111_1111;
//assign LEDR[9:3] = 7'b000_0000;
always@(*)
    begin
        if(SW[7:4] == SW[3:0])
            begin
              
              LEDR[2:0] = 3'b100;       //SW[7:4]=SW[3:0]  light LEDR2
              LEDR[9:3] = 7'b000_0000;
              HEX3[7:0] = 8'b1000_0110;  // E
              
              
            end
        else if (SW[7:4]< SW[3:0])   
            begin
                LEDR[2:0] = 3'b001;     //SW[7:4]<SW[3:0]  light LEDR0
                LEDR[9:3] = 7'b000_0000;
                HEX3[7:0] = 8'b1100_0111;// L
               
               
            end
        else if(SW[7:4]>SW[3:0])
            begin
                LEDR[2:0] = 3'b010;      //SW[7:4]>SW[3:0]  light LEDR1
                LEDR[9:3] = 7'b000_0000;
                HEX3[7:0] = 8'b1111_1111;// blank
                
              
            end
    end
    

endmodule