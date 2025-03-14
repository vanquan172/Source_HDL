module syn_fifo_3 #(parameter depth = 8, data_width = 8 ) 
(
    input clk ,clr , 
    input w_en,r_en ,
    input [data_width-1:0] data_in , 
    output reg [data_width-1:0] data_out , 
    output full,empty 
) ;

reg [data_width-1:0] fifo [0:depth-1] ; 
reg [$clog2(depth)-1:0] w_ptr , r_ptr ; 
reg [$clog2(depth):0] cnt ; 

always @(posedge clk)
    begin 
        if (clr) 
            begin   
                w_ptr <= 0 ; r_ptr <= 0 ; 
                cnt <= 0 ;
            end 

        else 
            begin
                // case ({w_en,r_en})   // thuc hien case cnt se cong lien tuc hoac tru lien tuc mac du full hoac empty  
                //     2'b00,2'b11 : cnt <= cnt ; 
                //     2'b10 : cnt <= cnt + 1; 
                //     2'b01 : cnt <= cnt - 1; 
                // endcase
                if (w_en & !full) 
                    begin   
                        fifo[w_ptr] <= data_in ; 
                        w_ptr <= w_ptr + 1 ; 
                        cnt <= cnt + 1; 
                    end 
                if (r_en & !empty) 
                    begin
                        data_out <= fifo[r_ptr] ; 
                        r_ptr <= r_ptr + 1;
                        cnt <= cnt - 1; 
                    end 

                if ({w_en,r_en}== 2'b00 || {w_en,r_en}== 2'b11 )
                    cnt <= cnt ; 
            
            end 
    end 

assign full = (cnt == depth ) ? 1'b1 : 1'b0 ; // do rong cnt 3 bit can't = 8 => cnt must 4bit ;  
assign empty = (cnt == 0) ? 1'b1 : 1'b0 ;

endmodule 
