module tb_gray_to_bin ; 

parameter n = 4 ; 
reg [n-1:0] gray ; 
wire [n-1:0] bin ; 

gray_to_bin #(.n(n)) uut (.gray(gray),.bin(bin))  ;

initial 
    begin 
        gray = 4'b1110; #1;
        gray = 4'b0100; #1;
        gray = 4'b0111; #1;
        gray = 4'b1010; #1;
        gray = 4'b1000;
    end

endmodule 
        
