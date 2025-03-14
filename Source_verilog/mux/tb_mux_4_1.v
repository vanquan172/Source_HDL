module tb_mux_4_1 ;

reg a,b,c,d ; 
reg sel ;
wire y ; 

mux_4_1 uut (.a(a),.b(b),.c(c),.d(d),.y(y)) ; 

initial 
    begin 
       {a,b,c,d} = 4'h5 ; 
       repeat (6)
            begin
                sel = $random ; 
                #5;
            end 
    end 

endmodule 