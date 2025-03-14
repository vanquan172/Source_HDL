module full_sub (a,b,bi,bo,sub) ;

input a,b,bi ; 
output bo,sub ; 

assign sub = a ^ b ^ bi ; 
assign bo = (~a & b) | ((~(a ^ b)) & bi) ;

endmodule 