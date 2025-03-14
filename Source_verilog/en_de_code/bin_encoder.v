module bin_encoder (d,bin)  ;

input [7:0] d ; 
output [2:0] bin ; 

assign bin[0] = d[1] | d[3] | d[5] | d[7]  ; 
assign bin[1] = d[2] | d[3] | d[6] | d[7]  ; 
assign bin[2] = d[4] | d[5] | d[6] | d[7]  ; 

endmodule 