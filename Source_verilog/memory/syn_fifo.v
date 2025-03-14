module syn_fifo #(parameter data_width = 8, depth = 8) 
(
    input clk,clr ,
    input w_en,r_en , 
    input [data_width-1:0] data_in , 
    output reg [data_width-1:0] data_out , 
    output full,empty  
);

reg [$clog2(depth)-1:0] w_ptr , r_ptr ; 
reg [data_width-1:0] fifo [0:depth-1]  ;

// always @(posedge clk) 
//     begin 
//         if (clr) 
//             begin 
//                 w_ptr <= 0 ; r_ptr <= 0 ; 
//                 data_out <= 0 ; 
//             end 
//     end 

// always @(posedge clk) 
//     begin 
//         if (w_en && !full) 
//             begin 
//                 fifo[w_ptr] <= data_in ;
//                 w_ptr <= w_ptr + 1 ; 
//             end 
//     end 
// always @(posedge clk) 
//     begin 
//         if (r_en && !empty) 
//             begin 
//                 data_out <= fifo[r_ptr] ;
//                 r_ptr <= r_ptr + 1 ; 
//             end 
//     end 

always @(posedge clk ) 
    begin
        if (clr) 
            begin 
                w_ptr <= 0 ; r_ptr <= 0 ; 
                data_out <= 0 ; 
            end 
        else
            begin
                if (w_en && !full)
                    begin 
                        fifo[w_ptr] <= data_in ;
                        w_ptr <= w_ptr + 1 ; 
                    end

                if (r_en && !empty) 
                    begin 
                        data_out <= fifo[r_ptr] ;
                        r_ptr <= r_ptr + 1 ;
                    end 
            end
    end  
                
assign full = ((w_ptr+1'b1) == r_ptr);
assign empty = (w_ptr == r_ptr);
endmodule 