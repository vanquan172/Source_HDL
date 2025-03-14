module tb_add_sub ; 

parameter n = 4  ;

reg [n-1:0] a,b ;
reg ctr ; 
wire [n-1:0] s ;
wire cout ; 

add_sub #(.n(n)) uut (.a(a),.b(b),.ctr(ctr),.s(s),.cout(cout)) ; 

initial 
    begin 
        ctr = 0 ; 
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

        ctr = 1; 
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