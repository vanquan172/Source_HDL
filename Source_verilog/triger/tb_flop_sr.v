module tb_flop_sr ; 

reg clk,clr,s,r ; 
wire q ,qd ; 

flop_sr uut (.clk(clk),.clr(clr),.s(s),.r(r),.q(q),.qd(qd)) ;

initial 
    begin
        clk = 1 ;
        forever #5 clk = ~clk ;
    end

initial 
    begin
        clr = 0 ;
        s = 0 ; r =0 ; #10 ; 
        s = 0 ; r =1 ; #10 ; 
        s = 1 ; r =0 ; #10 ; 
        s = 1 ; r =1 ; #10 ; 
        $stop ;  
    end 
endmodule 