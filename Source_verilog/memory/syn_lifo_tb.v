module syn_lifo_tb ; 

parameter data_width = 8 ; 

reg clk,clr ;
reg push,pop; 
reg [data_width-1:0] data_in ; 
wire [data_width-1:0] data_out ; 
wire full,empty ; 

syn_lifo #(.data_width(data_width)) uut (.clk(clk),.clr(clr),.push(push),.pop(pop),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty)) ; 

always #5 clk = ~clk ;

initial 
    begin   
        clk = 0 ; 
        clr = 1 ; 
        push = 0 ; 
        pop = 0 ; 
        #10 ; 
        clr = 0 ; 

        push = 1; 
        data_in = 8'h1 ; 
        #10 ; 
        data_in = 8'h2 ; 
        #10 ; 
        data_in = 8'h3 ; 
        #10 ; 
        data_in = 8'h4 ; 
        #10 ; 
        data_in = 8'h5 ; 
        #10 ; 
        data_in = 8'h6 ; 
        #10 ; 
        data_in = 8'h7 ; 
        #10 ; 
        data_in = 8'h8 ; 
        #10 ; 

        push = 0 ; 
        pop = 1 ; 
        #100 ; 
        $stop ; 
    end 

endmodule 