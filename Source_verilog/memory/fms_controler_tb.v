module fms_controler_tb ; 

reg [2:0] op ;
reg clk,zero,rst ; 
wire mem_rd,load_ir,halt,inc_pc,load_ac,load_pc,mem_wr ;
wire [2:0] state  ; 

fms_controler uut (.op(op),.clk(clk),.zero(zero),.rst(rst),.mem_rd(mem_rd),.load_ir(load_ir),.halt(halt),.inc_pc(inc_pc),.load_ac(load_ac),.load_pc(load_pc),.mem_wr(mem_wr),.state(state))  ;

always 
    begin
        clk = ~clk  ; 
        #5 ; 
    end 

initial 
    begin
        clk = 0 ;
        rst = 0 ; 
        #10 ; 
        rst = 1 ;
        zero = 1 ;

        #40 ; 
        op = 3'b000 ; 
        #10 ; 
        op = 3'b010 ; 
        #30 ; 
        
        zero = 0 ; 
        #40 ; 
        op = 3'b001 ; 
        #10 ; 
        op = 3'b010 ; 
        #30 ; 
 
        #40 ; 
        op = 3'b011 ; 
        #10 ; 
        op = 3'b111; 
        #30 ; 
       $stop ; 
    end 
endmodule 
