`timescale 1 ns /  100 ps
module tb_HW9();



reg reset_n;

reg clock = 0;
HW9 HW9 (.clock_in(clock),.reset_n(reset_n),.clock_out(clock_out));

always  #10 clock =~clock;
initial 
begin
    $dumpfile("HW9.vcd"); $dumpvars;
    clock = 0; reset_n = 0;
     
    #10 reset_n = 1;
    
    #3000;
    #100 $finish;

end

endmodule