
module fflop #(
    // Parameters
    parameter int WIDTH = 32
) (

    input logic clk_i, rst_n_i,
    input logic [WIDTH-1:0] d_i,
    output logic [WIDTH-1:0] q_o
    
);

    timeunit 1ns; timeprecision 100ps;
    

    always_ff @(posedge clk_i or negedge rst_n_i)begin
    if (!rst_n_i)begin
    q_o <= 0;
    end
    
    else begin
    q_o <= d_i;
    end
    
    end

endmodule