module buffer_tb  ; 

parameter data_width = 8  ;

reg data_en1, data_en2 ; 
reg [data_width-1:0] data_in1,data_in2 ; 
wire [data_width-1:0] data_out ; 

buffer #(.data_width(data_width)) uut (.data_en1(data_en1),.data_en2(data_en2),.data_in1(data_in1),.data_in2(data_in2),.data_out(data_out)); 

initial 
    begin   
        data_en1 = 1 ; data_en2 = 0 ; 
        data_in1 = 8'h1 ; data_in2 = 8'h2 ; 
        #10  ; 

        data_en1 = 0 ; data_en2 = 1 ; 
        data_in1 = 8'h1 ; data_in2 = 8'h2 ;     
        #10 ; 

        data_en1 = 1 ; data_en2 = 1 ; 
        data_in1 = 8'h1 ; data_in2 = 8'h2 ;     
        #10 ; 

        data_en1 = 0 ; data_en2 = 0 ; 
        data_in1 = 8'h1 ; data_in2 = 8'h2 ;     
        #10 ; 

        data_en1 = 1 ; data_en2 = 0 ; 
        data_in1 = 8'h1 ; data_in2 = 8'h2 ;     
        #10 ; 

        data_en1 = 1 ; data_en2 = 0 ; 
        data_in1 = 8'h1 ; data_in2 = 8'h2 ;     
        #10 ; 

    end 
endmodule  
