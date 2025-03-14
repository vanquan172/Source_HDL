module flop_d1(clk,clr,d,q)
input clk,clr,d ; 
output q ; 
reg q ; 

always @(posedge clk) 
begin
    if (clr)
        q <= 1'b0 ; 
    else 
        q <= d ; 
end 

endmodule ; 