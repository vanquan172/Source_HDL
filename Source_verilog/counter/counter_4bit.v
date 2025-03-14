module counter_4bit #(parameter n = 6) (clk,clr,q) ;
// su dung tham so de co the mo rong mot cach linh hoat 
input clk,clr ; 
output [n-1:0] q ; 
reg [n-1:0] tmp = {n{1'b0}}; // khoi tao gtri bdau without tmp = xxxx => simutation 

always @ (posedge clk or posedge clr)
    begin 
        if (clr) 
            tmp <= {n{1'b0}} ; 
        else 
            tmp <= tmp +1'b1 ; 
    end 
    assign q = tmp ; 
endmodule 
