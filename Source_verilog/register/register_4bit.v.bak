module (clk,clr,ce,d,q) 

input clk,clr,ce ; 
input d[3:0] ; 
output q[3:0] ; 
reg q[3:0] ; 

always @(negedge (clk) or posedge(clr) )
    begin 
        if (clr) 
            q <= 4'b0000 ; 
        else if (ce) 
            q <= d ;
    end 
endmodule ; 
            
 