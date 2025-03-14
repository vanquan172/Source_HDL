module alu8b #(parameter n = 8)
(
    input [n-1:0] data ,
    input [n-1:0] accum ,
    output reg [n-1:0] out ,
    input [2:0] op 
 //   output zero 
);

always @(*) 
    begin 
        case (op)
            3'b000 : out = accum ; // HLT
            3'b001 : out = accum ; // SKZ
            3'b010 : out = data + accum ; 
            3'b011 : out = data & accum ; 
            3'b100 : out = data ^ accum ; 
            3'b101 : out = data ; 
            3'b110 : out = accum ; 
            3'b111 : out = accum ; 
        endcase 
    end 

endmodule    