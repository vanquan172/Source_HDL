module bin_to_gray #(parameter n = 4) (bin,gray) ;

input [n-1:0] bin ; 
output [n-1:0] gray ; 

assign gray[n-1] = bin [n-1] ;

genvar i ;
generate 
    for (i=n-2;i>=0;i=i-1)
        begin :bn_to_gr_gen
            assign gray[i] = bin[i] ^ bin[i+1] ; 
        end 
endgenerate 

endmodule
/*
module bin_to_gray #(parameter n = 4 ) (bin,gray) ;

input [n-1:0] bin ;
output reg [n-1:0] gray ;

always @(bin) 
    begin   
        gray[n-1] = bin[n-1] ; 
        gray[n-2:0] = bin[n-1:1] ^ bin[n-2:0] ; // xor tung bit mot  
    end 

endmodule 
*/
