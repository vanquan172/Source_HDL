module add_sub #(parameter n = 4) (a,b,ctr,cout,s) ; 

input [n-1:0] a,b ;
input ctr ; 
output cout ; 
output [n-1:0] s ;

wire [n:0] c ; 
wire [n-1:0] bc ; 
assign c[0] = ctr ; 
// assign bc = b ^ ctr  ; => loi 
genvar i ; 
generate 
    for (i=0;i<n;i=i+1) 
    begin :add_sub_gen   
        assign bc[i] = b[i] ^ ctr ; // thuc hien dao tung bit cua b 
        full_adder uut (.a(a[i]),.b(bc[i]),.cin(c[i]),.cout(c[i+1]),.sum(s[i])) ; 
    end 
endgenerate 

assign cout = c[n] ; 

endmodule 