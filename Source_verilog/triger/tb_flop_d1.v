module tb_flop_d1 ;
// khai bao tin hieu dung trong mo phong 
reg clk,clr ;
reg d ;
wire q ;

flop_d1 uut (.clk(clk),.clr(clr),.d(d),.q(q)) ; 

initial begin 
    clr = 0 ; 
    forever #5 clk = ~clk ; 
end ; 

initial begin 
    clr = 0 ; 
    d = 0 ; 
    #10 ; 
    d = 1 ;
    #10 ; 
    clr = 1 ;
    #10 ; 
    clr = 0 ; 
    #10 ; 
    d = 1 ; 
    #10 ; 
    $finish ; 
end 

endmodule ; 