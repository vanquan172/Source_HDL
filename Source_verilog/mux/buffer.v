module buffer #(parameter data_width = 8) 
(
    input data_en1,data_en2,
    input [data_width-1:0] data_in1 ,
    input [data_width-1:0] data_in2 ,
    output reg [data_width-1:0] data_out 
) ; 

always @(*) 
    begin
        if (data_en1==1'b1 && data_en2 == 1'b0) 
            data_out = data_in1 ; 
        else if (data_en1==1'b0 && data_en2 == 1'b1) 
            data_out = data_in2 ; 
        else
            data_out = {data_width{1'bz}} ; 
    end 

endmodule 