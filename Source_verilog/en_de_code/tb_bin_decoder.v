module tb_bin_decoder ;

reg [2:0] bin ; 
wire [7:0] d ; 

bin_decoder uut (.bin(bin),.d(d)) ;

initial 
    begin
        repeat (8) 
            begin   
                bin = $random ; 
                # 2; 
            end 
    end
endmodule 