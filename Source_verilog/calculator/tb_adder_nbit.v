module tb_adder_nbit ;
parameter n = 4 ; 
reg cin ; 
reg [n-1:0] a,b; 
wire cout ;
wire [n-1:0] sum  ; 

adder_nbit #(.n(n)) uut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout)); 

initial 
    begin 
        cin = 0 ; // khong gan cin => mo phong ra kq xxxx  
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