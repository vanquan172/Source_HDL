module shift_left_register_sload (clk,sload,d,si,so) ;

input clk,sload,si ; 
input [7:0] d ; 
output so ; 
reg [7:0] tmp ; 

always @(posedge clk) 
    begin 
        if (sload) 
            tmp <= d ;
        else 
            begin
                tmp <= tmp << 1 ; 
                tmp[0] <= si ; 
            end 
    end 
assign so = tmp[7] ; 

endmodule 
