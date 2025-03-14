module bin_decoder (bin,d) ;

input [2:0] bin ; 
output [7:0] d ; 
wire [7:0] tmp = 8'b00000001; 

assign d = tmp << bin  ;

endmodule