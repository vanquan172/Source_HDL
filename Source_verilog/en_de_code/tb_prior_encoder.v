module tb_prior_encoder ;

reg [7:0] d ; 
wire [2:0] bin ;

prior_encoder uut (.d(d),.bin(bin)) ; 

initial 
    begin 
        repeat (5) 
            begin   
                d = $random ;
                # 2 ; 
            end 
    end 
endmodule 

