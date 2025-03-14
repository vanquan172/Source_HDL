module register_4bit (clk,clr,ce,d,q) ;

input clk,clr,ce ; 
input [3:0] d ; 
output [3:0] q ; 
reg [3:0] q; 

always @(negedge (clk) or posedge(clr) )
    begin 
        if (clr) 
            q <= 4'b0000 ; 
        else if (ce) 
            q <= d ;
    end 

endmodule 
            
 