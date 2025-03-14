module fms_controler
(
    input [2:0] op ,
    input clk,zero,rst, 
    output reg mem_rd,load_ir,halt,inc_pc,load_ac,load_pc,mem_wr,
    output reg [2:0] state
) ; 

parameter inst_addr = 3'b000 ; 
parameter inst_fetch = 3'b001 ; 
parameter inst_load = 3'b010 ; 
parameter idle = 3'b011 ; 
parameter op_addr = 3'b100 ; 
parameter op_fetch= 3'b101 ; 
parameter alu_op = 3'b110 ; 
parameter store = 3'b111 ; 

//reg [2:0] state ; 

reg aluop  ; 

always @(posedge clk or negedge rst)
    begin
        if (rst == 0)
            state <= inst_addr ; 
        else 
            begin
                case(state) 
                    inst_addr :state <= inst_fetch ; 
                    inst_fetch : state <= inst_load ; 
                    inst_load : state <= idle ; 
                    idle : state <= op_addr ; 
                    op_addr : state <= op_fetch ; 
                    op_fetch : state <= alu_op ; 
                    alu_op : state <= store ; 
                    store : state <= inst_addr ; 
                    default : state <= inst_addr ; 
                endcase 
            end 
    end

always @(*)
    begin
        aluop = (op==3'b010)| (op==3'b011)|(op==3'b100)|(op==3'b101) ;
        case(state)
                inst_addr:
                    begin
                        mem_rd = 0 ; 
                        load_ir = 0 ; 
                        halt = 0 ; 
                        inc_pc = 0 ; 
                        load_ac = 0 ; 
                        load_pc = 0 ;
                        mem_wr = 0 ; 
                    end       
                inst_fetch: 
                   begin
                        mem_rd = 1 ; 
                        load_ir = 0 ; 
                        halt = 0 ; 
                        inc_pc = 0 ; 
                        load_ac = 0 ; 
                        load_pc = 0 ;
                        mem_wr = 0 ; 
                    end 
                inst_load: 
                   begin
                        mem_rd = 1 ; 
                        load_ir = 1 ; 
                        halt = 0 ; 
                        inc_pc = 0 ; 
                        load_ac = 0 ; 
                        load_pc = 0 ;
                        mem_wr = 0 ; 
                    end 
                idle: 
                   begin
                        mem_rd = 1 ; 
                        load_ir = 1 ; 
                        halt = 0 ; 
                        inc_pc = 0 ; 
                        load_ac = 0 ; 
                        load_pc = 0 ;
                        mem_wr = 0 ; 
                    end 
                op_addr: 
                    begin
                        mem_rd = 0 ; 
                        load_ir = 0 ; 
                        halt = (op==3'b000) ; 
                        inc_pc = 1 ; 
                        load_ac = 0 ; 
                        load_pc = 0 ;
                        mem_wr = 0 ; 
                    end 
                op_fetch: 
                   begin
                        mem_rd = aluop ; 
                        load_ir = 0 ; 
                        halt = 0 ; 
                        inc_pc = 0 ; 
                        load_ac = 0 ; 
                        load_pc = 0 ;
                        mem_wr = 0 ; 
                    end   
                alu_op: 
                    begin
                        mem_rd = aluop ; 
                        load_ir = 0 ; 
                        halt = 0 ; 
                        inc_pc = ((op==3'b001)&&zero) ; 
                        load_ac = aluop; 
                        load_pc = (op==3'b111) ;
                        mem_wr = 0 ; 
                    end 
                store: 
                    begin
                        mem_rd = aluop ; 
                        load_ir = 0 ; 
                        halt = 0 ; 
                        inc_pc = (op==3'b111) ; 
                        load_ac = aluop ; 
                        load_pc = (op==3'b111) ;
                        mem_wr = (op==3'b110) ; 
                    end

                endcase 
        
    end 

endmodule 
