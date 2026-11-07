module regfile (
    input logic clk_i, rst_n_i,wen_i,
    input logic [4:0] raddr1_i, raddr2_i,waddr_i,
    input logic [31:0] wdata_i,
    output logic [31:0] rdata1_o, rdata2_o

    
  );
    timeunit 1ns; timeprecision 100ps;
       
    logic [31:0] mem [0:31];
    

 
    always_ff @(posedge clk_i or negedge rst_n_i)begin
    if (!rst_n_i)begin
        for (int i =0; i < 32; i++)begin
        mem[i] <= 0;
        end
    end
    else if (wen_i && (waddr_i != 0))begin
    mem[waddr_i] <= wdata_i;
    end
    
    end
  
    assign rdata1_o = (raddr1_i == 0) ? 0 : mem[raddr1_i];
    assign rdata2_o = (raddr2_i == 0) ? 0 : mem[raddr2_i];
  
endmodule