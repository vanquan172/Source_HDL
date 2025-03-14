module tb_sub_nbit ;

parameter n = 4; 
reg bi;
reg [n-1:0] a,b ;
wire [n-1:0] sub ;
wire bo ; 

sub_nbit #(.n(n)) uut (.a(a),.b(b),.bi(bi),.sub(sub),.bo(bo)) ; 

initial 
    begin 
        bi = 0 ; 
        a = 4'b0001 ;
        b = 4'b0010 ;
        #5 ; 
        a = 4'b1001 ;
        b = 4'b0110 ;
        #5 ; 
        a = 4'b0101 ;
        b = 4'b1011 ;
        #5 ; 
        a = 4'b1111 ;
        b = 4'b0001 ;
        #5 ; 
        a = 4'b1111 ;
        b = 4'b1111 ;
        #5 ;
        $stop ;  
    end 
endmodule 