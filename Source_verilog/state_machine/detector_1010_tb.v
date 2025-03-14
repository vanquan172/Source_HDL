module detector_1010_tb ; 

reg clk,clr,in ; 
wire out ; 

detector_1010 uut (.clk(clk),.clr(clr),.in(in),.out(out)) ; 

initial 
    begin 
        clk = 1 ; 
        forever #5 clk = ~clk ; 
    end 

initial 
    begin 
        in = 0 ;
        clr = 1; # 10 ; 
        clr = 0 ; 
        in = 1 ; #10 ; 
        in = 0 ; #10 ;
        in = 1 ; #10 ; 
        in = 0 ; #10 ;

        in = 1 ; #10 ; 
        in = 0 ; #10 ;       
        in = 1 ; #10 ; 
        in = 1 ; #10 ;
        in = 1 ; #10 ; 
        in = 0 ; #10 ;
        in = 1 ; #10 ; 
        in = 0 ; #10 ;

        in = 1 ; #10 ; 
        in = 1 ; #10 ;
        in = 1 ; #10 ; 
        in = 0 ; #10 ;
        in = 1 ; #10 ; 
        in = 0 ; #10 ;
        $stop ; 
    end 

endmodule 
