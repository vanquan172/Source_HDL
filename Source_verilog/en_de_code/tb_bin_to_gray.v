module tb_bin_to_gray ;

parameter n = 4 ;
reg [n-1:0] bin ; 
wire [n-1:0] gray ; 

bin_to_gray #(.n(n)) uut (.bin(bin),.gray(gray)) ; 

initial 
    begin 
        bin = 4'b1011; #1;
        bin = 4'b0111; #1;
        bin = 4'b0101; #1;
        bin = 4'b1100; #1;
        bin = 4'b1111 ;
    end 

endmodule 

