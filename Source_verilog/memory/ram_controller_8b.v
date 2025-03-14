module ram_controller_8b (
    input wire clk,             
    input wire rst_n,            
    input wire [3:0] address,    
    input wire [7:0] data_in,    
    output reg [7:0] data_out,   
    input wire cs ,
    input wire read,           
    input wire write           
);

reg [7:0] ram [15:0]  ;
   
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_out <= 8'b0;
        end else begin
            if (write && cs) begin
                ram[address] <= data_in;
            end
            if (read && cs) begin   
                data_out <= ram[address];
            end
        end
    end

endmodule
