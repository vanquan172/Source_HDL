module tb_shift_left_register_sload ;

reg clk,sload,si ;
reg [7:0] d ;
wire so ;

shift_left_register_sload uut (.clk(clk),.sload(sload),.si(si),.d(d),.so(so)) ; 

initial 
    begin 
        clk = 0 ; 
        forever #5 clk = ~clk ; 
    end 

initial 
    begin 
        sload = 0 ; 
        #2 ; 
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
        d = 8'b10101111 ; 
        sload = 1 ; 
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        si = 0 ; 
        #10 ;
        sload = 0 ; 
        si = 0 ; 
        #10 ;
        $stop ; 
    end 
endmodule 