module univeral_shift_reg_tb ;

reg clk,clr ;
reg [1:0] select ;
reg [3:0] p_din ;
reg s_left_din,s_right_din ;
wire s_left_dout,s_right_dout ;
wire  [3:0] p_dout ;

universal_shift_reg uut (.clk(clk),.clr(clr),.select(select),.p_din(p_din),.s_left_din(s_left_din),
.s_right_din(s_right_din),.s_left_dout(s_left_dout),.s_right_dout(s_right_dout),
.p_dout(p_dout)) ; 

initial 
    begin 
        clk = 0 ;
        forever #5 clk = ~clk ;
    end  

initial 
    begin 
        $monitor("at time %t, select=%b, p_din=%b, s_left_din=%b, s_right_din=%b --> p_dout = %b, s_left_dout = %b, s_right_dout = %b",$time,select, p_din, s_left_din, s_right_din, p_dout, s_left_dout, s_right_dout);
        clr = 1;
        #10 ;
        clr = 0;
        
        p_din = 4'b1101;
        s_left_din = 1'b1;
        s_right_din = 1'b0;
        
        select = 2'h3; #10;
        select = 2'h1; #20;
        p_din = 4'b1101;
        select = 2'h3; #10;
        select = 2'h2; #20;
        select = 2'h0; #20;
        
        $finish;
    end
endmodule 