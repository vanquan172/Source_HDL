module #(parameter depth = 8, data_width =8) 
(
    input clk,clr , 
    input w_en,r_en ,
    input [data_width-1:0] data_in ,
    output [data_width-1:0] data_out ,
    output full,empty 
); 

reg [$clog2(depth)-1:0] w_ptr , r_ptr ; 
reg [data_width-1:0] fifo [0:depth-1] ; 
reg [$clog2(depth)-1:0] cnt ; 

assign full = (cnt == 8) ? 1'b1 :1'b0 ; 
assign empty = (cnt == 0) ? 1'b1 :1'b0 ; 

always (posedge clk ) 
    begin 
        if (clr)
            begin 
                w_en = 0 ;
                r_en = 0 ; 
            end 
        else 
            begin 
                if(w_en & !full) 
                    begin 
                        fifo[w_ptr] = data_in ; 
                        w_ptr = w_ptr + 1 ; 
                    end 
                else if (r_en & !empty) 
                    begin 
                        data_out = fifo [r_ptr] ; 
                        r_ptr = r_ptr + 1; 
                    end 
                else ;
            end 
        if (w_ptr == 8) 
            w_ptr = 0 ;
        else if (r_ptr == 8) 
            r_ptr = 0 ; 
        else ;

        if (r_ptr > w_ptr) 
            cnt = r_ptr - w_ptr ;  
        else if (r_ptr < w_ptr) 
            cnt = w_ptr - r_ptr ; 
        else ;
    end 

endmodule  

