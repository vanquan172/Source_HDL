module prior_encoder (d,bin)  ; 

input [7:0] d ;
output [2:0] bin ;
reg [2:0] bin ; 
// always @(d) 
    // begin 
        // casex(d) 
            // 8'b1xxx_xxxx: bin = 3'b111;
            // 8'b01xx_xxxx: bin = 3'b110;
            // 8'b001x_xxxx: bin = 3'b101;
            // 8'b0001_xxxx: bin = 3'b100;
            // 8'b0000_1xxx: bin = 3'b011;
            // 8'b0000_01xx: bin = 3'b010;
            // 8'b0000_001x: bin = 3'b001;
            // 8'b0000_0001: bin = 3'b000;
            // default: bin = 3'bxxx ; 
        // endcase
    // end 
integer i ; 
reg exit_flag ; 
always @(d) 
    begin 
        exit_flag = 0 ; 
        for (i=7;i>=0;i=i-1) 
            begin   
                if (d[i] && !exit_flag ) 
                    begin 
                        bin =  i ; 
                        exit_flag = 1 ; 
                    end 
            end 
    end 

endmodule 