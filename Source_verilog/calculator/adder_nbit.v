module adder_nbit #(parameter n = 4 ) (a,b,cin,cout,sum) ; 

input cin ; 
input [n-1:0] a,b;
output [n-1:0] sum ;
output cout ; 

wire [n:0] c ; 
assign c[0] = cin ; 

genvar i ; 
generate
    for(i=0;i<n;i=i+1) 
        begin :adder_gen 
            full_adder uut (.a(a[i]),.b(b[i]),.cin(c[i]),.cout(c[i+1]),.sum(sum[i])) ; 
        end 
endgenerate
assign cout = c[n] ; 

endmodule  