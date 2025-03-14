module shift_left_register(clk,si,so);

input clk,si ; 
output so ; 
reg [7:0] tmp ; 

always @ (negedge clk) 
    begin 
        tmp <= tmp << 1 ; 
        tmp[0] <= si ; 
    end 
assign so = tmp[7] ; 

endmodule 