`timescale 1ns / 1ps 
module mux21 (i1, i2, s, o); 

input i1, i2, s; 
output o; 

assign o = s ? i2 : i1; 

endmodule

module mux41_u_mux21 (a, b, c, d, sel, y);

input a, b, c, d; 
input [1:0] sel; 
output y; 
wire y0, y1; 

mux21 m1 (.i1(a), .i2(b), .s(sel[1]), .o(y0)); 
mux21 m2 (.i1(c), .i2(d), .s(sel[1]), .o(y1)); 
mux21 m3 (.i1(y0), .i2(y1), .s(sel[0]), .o(y)); 

endmodule  

