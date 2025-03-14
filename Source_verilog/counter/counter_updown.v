module counter_updown (clk,clr,updown,q) ; 

input clk,clr,updown ; 
output [3:0] q ; 
reg [3:0] tmp ; 

always @ (posedge clk or posedge clr) 
    begin 
        if (clr) 
            tmp <= 4'b0000 ;
        else if (updown) 
            tmp <= tmp + 1'b1 ; 
        else 
            tmp <= tmp - 1'b1 ; 
    end 
assign q = tmp  ; 

endmodule 
/* khi su dung tham so de chon do rong bo dem 
module #(parameter n = 4;) (clk,clr,updown,q) ;

input clk,clr,updown ; 
output [n-1:0] q ; 
reg [n-1:0] tmp ; 

always @ (posedge clk or posedge clr) 
    begin 
        if (clr) 
            tmp <= {n{1'b0}} ;
        else if (updown) 
            tmp <= tmp + 1'b1 ; 
        else 
            tmp <= tmp - 1'b1 ; 
    end 
assign q = tmp  ; 

endmodule 
*/ 
