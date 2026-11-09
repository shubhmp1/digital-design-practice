
module memory                                      
#(                                                 
    parameter int DWIDTH = 32,                     
    parameter int AWIDTH = 32                      
                                                   
)                                                  
(                                                  
    input logic clk_i, wr_en_i, sel_i,             
    input logic [AWIDTH-1:0] addr_i,               
    input logic [DWIDTH-1:0] data_i,               
    output logic [DWIDTH-1:0] data_o                
                                                   
);                                                 
                                                   
    // Time scale and precision                    
    timeunit 1ns; timeprecision 100ps;             
                                                   
    // Memory size                                 
    localparam int SIZE = 1 << (AWIDTH -2);                       
                                                   
    // Memory array                                
    /*---ADD CODE HERE---*/                        
    logic [DWIDTH-1:0] memArray [0:SIZE-1];                                               
    // Word-aligned Write operation                
    always_ff @(posedge clk_i)begin                        
    if (wr_en_i && sel_i)begin
    memArray[addr_i >> 2] <= data_i;
    end
    
    end
                                                   
    // Word-aligned Read operation                 
    /*---ADD CODE HERE---*/
    assign data_o = memArray[addr_i >> 2];
                                                       
endmodule : memory                                 
