module tb_counter_updown  ;

reg clk,clr,updown ;
wire [3:0] q  ;

counter_updown uut (.clk(clk),.clr(clr),.updown(updown),.q(q))  ;

initial 
    begin 
        clk = 0 ; 
        forever #5 clk = ~clk ; 
    end 

initial 
    begin 
        clr = 0 ; updown = 1 ;
        #30 ; 
        clr = 1 ; 
        #10 
        clr = 0 ;
        #20 ; 
        updown = 0 ;
        #20 ; 
        updown = 1 ; 
        #80 ; 
        $stop ; 
    end 

endmodule 