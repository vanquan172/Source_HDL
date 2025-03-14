module universal_shift_reg (
    input clk,clr,
    input [1:0] select , 
    input s_left_din,s_right_din , 
    input [3:0] p_din,
    output reg [3:0] p_dout , 
    output s_left_dout,s_right_dout 
)  ;

always @(negedge clk) 
    begin   
            if (clr) 
                p_dout = 4'b0000 ;
            else 
                begin 
                    if (select == 2'b01)
                        p_dout = {s_right_din,p_dout[3:1]}  ;
                    else if (select == 2'b10) 
                        p_dout = {p_dout[2:0],s_left_din}  ;
                    else if (select == 2'b11)     
                        p_dout = p_din ; 
                end 
    end
assign s_left_dout = p_dout[3] ;  
assign s_right_dout = p_dout[0] ;  
endmodule 
    