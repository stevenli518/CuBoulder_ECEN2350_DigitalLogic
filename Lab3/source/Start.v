module Start(a,b,c,d,x);
input a,b,c,d ;
output x;
    assign x = ~a&b&~c&d |a&~b&c&d |a&b&~c&d;
    
endmodule