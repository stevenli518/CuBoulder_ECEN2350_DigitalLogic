`timescale 1 ns /  100 ps
module tb_Problem3();
reg [7:0]a ;
reg [7:0]b ;
wire x;


Problem3 U0 (.a(a), .b(b), .x(x));

initial
    begin
            a = 8'b0000_0000 ; b = 8'b0000_0000;
        #10 a = 8'b1010_0101 ; b = 8'b0101_0101;
        
        #20 $display("Simulation success!");
            $display("Chengming Li");
    
    end

initial
    begin
            $monitor($time ," a=%b, b=%b, x=%b\n",a,b,x);
            
 
    end
    
endmodule