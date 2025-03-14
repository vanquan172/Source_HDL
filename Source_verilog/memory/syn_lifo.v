module syn_lifo #(parameter data_width =8 , depth = 8) 
(
    input clk ,clr , 
    input push,pop ,
    input [data_width-1:0] data_in ,
    output reg [data_width-1:0] data_out ,
    output full,empty  
);
 
reg [$clog2(depth):0] st_ptr ; 
reg [data_width-1:0] lifo [0:depth-1] ; 

always @(posedge clk) 
    begin
        if (clr)
            st_ptr <= 0 ; 
        else 
            begin
                if (push & !full) 
                    begin   
                        lifo[st_ptr] = data_in ; 
                        st_ptr = st_ptr + 1; 
                    end 
                else if (pop & !empty)
                    begin   
                        st_ptr = st_ptr - 1; 
                        data_out = lifo[st_ptr] ; 
                    end 
                else ; 
            end 
    end 
assign full = st_ptr == depth ; 
assign empty = st_ptr == 0 ; 

endmodule 