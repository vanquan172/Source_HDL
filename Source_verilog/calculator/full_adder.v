module full_adder (a,b,cin,cout,sum) ;

input a,b,cin ; 
output sum,cout ; 
wire sum,out  ;
assign sum = a ^ b ^ cin ; 
assign cout = ((a^b) & cin) | (a & b) ; 

endmodule 