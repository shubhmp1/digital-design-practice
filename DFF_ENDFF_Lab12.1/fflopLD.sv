/*******************************************************************************
 * Module: fflopLD
 * 
 * File Name: fflopLD.sv
 * Project: TRIX-V (Tiny RISC-V Core)
 *
 * Description:
 *     Parameterized flip-flop with asynchronous active-low reset and load enable.
 *     Default width is 32 bits
 *
 * Modification History:
 * Ver   Who    Date        Changes
 * ----  -----  ----------  -----------------------------------------------
 * 1.0   
 *
 * Copyright (c) AICLAB. All rights reserved.
 *******************************************************************************/
module fflopLD #(
    parameter int WIDTH = 32
) (
    input logic clk_i, rst_n_i, en_i,
    input logic [WIDTH-1:0] d_i,
    output logic [WIDTH-1:0] q_o
);
    // Time scale and precision
    timeunit 1ns; timeprecision 100ps;
    
    always_ff @(posedge clk_i or negedge rst_n_i)begin
        if (!rst_n_i)begin
        q_o <= 0;
        end
        else if(en_i)begin
        q_o <= d_i;
        end

    end

endmodule