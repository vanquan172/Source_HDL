module alu8b_tb ; 
parameter n = 8 ; 
reg [n-1:0] data ; 
reg [n-1:0] accum ; 
wire [n-1:0] out; 
reg [2:0] op ; 

alu8b  #(.n(n)) uut (.data(data),.accum(accum),.out(out),.op(op)) ; 

initial 
    begin   
        op = 3'b000 ; 
        data = 8'b00000000 ; accum = 8'b01111111 ; 
        #10 ;
        
        op = 3'b001 ; 
        data = 8'b00000000 ; accum = 8'b01111111 ; 
        #10 ;

        op = 3'b010 ; 
        data = 8'b00000000 ; accum = 8'b01111111 ; 
        #10 ;
    
        op = 3'b011 ; 
        data = 8'b00000000 ; accum = 8'b01111111 ; 
        #10 ;

        op = 3'b100 ; 
        data = 8'b00000000 ; accum = 8'b01111111 ; 
        #10 ;

        op = 3'b101 ; 
        data = 8'b00000000 ; accum = 8'b01111111 ; 
        #10 ;
    
        op = 3'b110 ; 
        data = 8'b00000000 ; accum = 8'b01111111 ; 
        #10 ;

        op = 3'b110 ; 
        data = 8'b00000000 ; accum = 8'b01111111 ; 
        #10 ;
    end 

endmodule 