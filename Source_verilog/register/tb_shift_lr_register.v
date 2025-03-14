module tb_shift_lr_register ; 

reg clk,si,left_right ; 
wire [7:0] po ;

shift_lr_register uut (.clk(clk),.si(si),.left_right(left_right),.po(po)) ; 

initial 
    begin 
        clk = 1 ; 
        forever #5 clk = ~clk ; 
    end 
initial 
    begin 
        left_right = 0 ; 
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
        left_right = 1 ; 
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        left_right = 0 ; 
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