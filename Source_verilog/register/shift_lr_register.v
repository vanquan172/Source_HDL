module shift_lr_register (clk,si,left_right,po) ; 

input clk,si,left_right ; 
output [7:0] po ; 
reg [7:0] tmp ; 

always @(posedge clk) 
    begin 
        if (left_right == 1'b0) 
            tmp <= {tmp[6:0],si} ; 
        else 
            tmp <= {si,tmp[7:1]} ; 
    end 
assign po = tmp ; 

endmodule 