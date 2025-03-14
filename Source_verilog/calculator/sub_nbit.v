module sub_nbit #(parameter n = 4) (a,b,bi,bo,sub) ;

input bi  ;
input [n-1:0] a,b ;
output bo ; 
output [n-1:0] sub ; 

wire [n:0] bin ;
assign bin[0] = bi ;
genvar i ; 
generate 
    for (i=0;i<n;i=i+1) 
        begin : sub_gen
            full_sub uut (.a(a[i]),.b(b[i]),.bi(bin[i]),.sub(sub[i]),.bo(bin[i+1])) ; 
        end 
endgenerate 
assign bo = bin[n] ; 

endmodule 