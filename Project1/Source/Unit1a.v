module Unit1a(KEY,SW,LEDR);
    input  [1:0] KEY;
	input  [9:0] SW;
	output reg [9:0] LEDR;	
    
    //assign LEDR[7:0] = KEY[0]? ~SW[7:0]:SW[7:0];
    //assign LEDR[9:8] = 2'b00;
always @(KEY,SW)
    
    begin
        
        if(KEY[0] == 1)
            begin
                LEDR[0] = ~SW[0];
                LEDR[1] = ~SW[1];
                LEDR[2] = ~SW[2];
                LEDR[3] = ~SW[3];
                LEDR[4] = ~SW[4];
                LEDR[5] = ~SW[5];
                LEDR[6] = ~SW[6];
                LEDR[7] = ~SW[7];
                LEDR[9:8]=2'b00;
            end
        else 
            begin
                LEDR[0] = SW[0];
                LEDR[1] = SW[1];
                LEDR[2] = SW[2];
                LEDR[3] = SW[3];
                LEDR[4] = SW[4];
                LEDR[5] = SW[5];
                LEDR[6] = SW[6];
                LEDR[7] = SW[7]; 
                LEDR[9:8]=2'b00;
            end
                       
    end 
      
endmodule