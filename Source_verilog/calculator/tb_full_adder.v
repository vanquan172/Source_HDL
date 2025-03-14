module tb_full_adder ;

reg a,b,cin ;
wire cout,sum ; 

full_adder uut (.a(a),.b(b),.cin(cin),.cout(cout),.sum(sum)) ;
 
initial 
    begin 
        a = 0 ; 
        b = 1 ; 
        cin = 0 ;
        #2 ; 
        a = 1 ; 
        b = 1 ; 
        cin = 0 ;
        #2 ; 
        a = 1 ; 
        b = 1 ; 
        cin = 1 ;
        #2 ; 
        a = 0 ; 
        b = 0 ; 
        cin = 0 ;
        #2 ; 
        a = 0 ; 
        b = 1 ; 
        cin = 1 ;
        #2 ; 
        $stop ; 
    end 
endmodule 