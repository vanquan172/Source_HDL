module detector_1010 (clk,clr,in,out) ;

input clk,clr,in ; 
output out ; 
parameter idle = 0 , s1 = 1 , s10 = 2 , s101 = 3 ; 
reg [1:0] cur_state,next_state ; 

always @(negedge clk) 
    begin 
        if(clr) 
            cur_state = idle ; 
        else
            cur_state = next_state  ;
    end 

always @(cur_state or in) 
    begin 
        case (cur_state) 
            idle : 
                begin 
                    if (in) next_state = s1 ; 
                    else next_state = idle ; 
                end 
            s1 : 
                begin 
                    if (in) next_state = s1 ;
                    else next_state = s10 ;
                end 
            s10 : 
                begin 
                    if (in) next_state = s101 ;
                    else next_state = idle ;
                end 
            s101 : 
                begin 
                    if (in) next_state = s1 ;
                    else next_state = idle ;
                end 
            default: next_state = idle ; 
        endcase
    end 

    assign out = (cur_state == s101) && (in == 0) ? 1 :0 ; 

endmodule 

 


