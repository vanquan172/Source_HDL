/*module gray_to_bin #(parameter n = 4) (gray,bin) ;

input [n-1:0] gray ;
output [n-1:0] bin ;
reg [n-1:0] bin ;
integer i ; 
always @(*)
    begin 
        bin[n-1] = gray[n-1] ; 
        bin[n-2:0] = bin[n-1:1] ^ gray[n-2:0] ; // xor tung bit 
    end 
endmodule  
*/
module gray_to_bin #(parameter n = 4) (gray,bin);  

input [n-1:0] gray ; 
output [n-1:0] bin ; 

assign bin[n-1] = gray[n-1] ;
genvar i ; 
generate 
    for (i=n-2;i>=0;i=i-1) 
        begin: gr_bn_gen
            assign bin[i] = gray[i] ^ bin[i+1];
        end 
endgenerate 

endmodule 
            
            
            
            