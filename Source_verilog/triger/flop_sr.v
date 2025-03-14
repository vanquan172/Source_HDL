module flop_sr (s,r,clk,clr,q,qd) ; 

input s,r,clk,clr ; 
output q,qd ; 
reg q = 0; 

always @(posedge clk) 
    begin   
        if (clr)
            q = 0;
        else 
            begin
                if ({s,r} == 2'b11 ) 
                    q = 1'bx ; 
                else 
                    q = s | (~r & q) ;
            end 
    end 
        assign qd = ~q ;  

endmodule 