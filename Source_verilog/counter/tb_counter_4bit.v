module tb_counter_4bit ;

parameter n = 6 ; 

reg clk,clr ;
wire [n-1:0] q ; 

counter_4bit #(.n(n)) uut (.clr(clr),.clk(clk),.q(q)) ; 

initial     
    begin 
        clk = 0 ; 
        forever #5 clk = ~clk ; 
    end 
initial 
    begin 
        clr = 0 ; 
        #30 ; 
        clr = 1 ; 
        #10 ; 
        clr = 0 ; 
        #170 ;
        $stop ; 
    end 
endmodule 
