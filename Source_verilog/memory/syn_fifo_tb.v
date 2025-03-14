module syn_fifo_tb ;

parameter data_width = 8 ; 
reg clk,clr; 
reg w_en,r_en ; 
reg [data_width-1:0] data_in ; 
wire [data_width-1:0] data_out ; 
wire full,empty ;



syn_fifo uut (.clk(clk),.clr(clr),.w_en(w_en),.r_en(r_en),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty))  ; 

always #5 clk = ~clk ; 

initial 
    begin 
        clk = 0 ;
        w_en = 0 ;
        r_en = 0 ; 
        data_in = 8'h1 ;  
        clr = 1 ; 
        #20 ; 
        clr = 0 ; 

        w_en = 1; 
        #10 ; 
        data_in = 8'h2 ;
        #10 ; 
        data_in = 8'h3 ; 
        #10 ; 
        data_in = 8'h4 ; 
        #10 ; 
        data_in = 8'h5 ; 
        #10 ; 
        data_in = 8'h6 ; 
        #10 ; 
        data_in = 8'h7 ; 
        #10 
        r_en = 1 ;
        #40 ; 
        data_in = 8'h2 ;
        #10 ; 
        data_in = 8'h3 ; 
        #10 ; 
        data_in = 8'h4 ; 
        #10 ;
        w_en = 0 ; 

        r_en = 1 ;
        #100 ; 
        $stop ; 
    end 


// initial 
//     begin   
//         clk = 1'b0 ; clr = 1'b0 ; 
//         w_en = 1'b0 ; data_in = 1'b0 ; 
    
//     repeat (10) @(posedge clk ) ; 
//     clr = 1'b1 ; 

//     repeat (2) 
//         begin 
//             for ( i = 0; i < 30; i=i+1) 
//                 begin 
//                     @(posedge clk)  ;
//                     w_en = (i%2) ? 1'b1 : 1'b0 ; 
//                     if (w_en & !full) 
//                         begin 
//                             data_in = $urandom ;      
//                         end 
//                 end 
//             #50 ; 
//         end 
//     end 


// initial 
//     begin   
//         clk = 1'b0 ; clr = 1'b0 ; 
//         r_en = 1'b0 ;  
    
//     repeat (20) @(posedge clk ) ; 
//     clr = 1'b1 ; 

//     repeat (2) 
//         begin 
//             for (i = 0; i < 30; i=i+1) 
//                 begin 
//                     @(posedge clk)  ;
//                     r_en = (i%2) ? 1'b1 : 1'b0 ; 
//                 end 
//             #50 ; 
//         end 
//         $finish ; 
//     end 

// initial begin 
//     $dumpfile("dump.vcd"); $dumpvars;
//   end
endmodule





                    
