module tb_bin_encoder ;

reg [7:0] d ; 
wire [2:0] bin ; 

bin_encoder uut (.d(d),.bin(bin)) ; 
integer i ;
initial 
    begin 
        d = 8'b1 ; 
        # 1 ; 
        for (i=0;i<8;i=i+1) 
            begin 
                d = d << 1 ; 
                # 1; 
            end 
    end

endmodule 

        