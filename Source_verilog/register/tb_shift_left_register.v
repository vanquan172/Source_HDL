module tb_shift_left_register  ; 

reg clk,si ; 
wire so ; 

shift_left_register uut (.clk(clk),.si(si),.so(so)) ; 

initial 
    begin 
        clk = 1 ; 
        forever #5 clk = ~clk ; 
    end 

initial 
    begin 
        

        si = 1 ; 
        #10 ; 
        si = 0 ; 
        #10 ; 
        si = 1 ; 
        #10 ; 
        si = 1 ; 
        #10 ; 
        si = 0 ; 
        #10 ; 
        si = 1 ; 
        #10 ; 
        si = 0 ; 
        #10 ; 
        si = 1 ; 
        #10 ; 
        si = 0 ; 
        #10 ; 
		  si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        $stop ; 
    end 

endmodule 