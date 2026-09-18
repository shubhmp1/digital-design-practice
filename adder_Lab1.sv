/*******************************************************************************
 * Module: adder
 * 
 * File Name: adder.sv
 * Project: TRIX-V (Tiny RISC-V Core)
 *
 * Description:
 *     This module add the input.
 *
 *
 * Modification History:
 * Ver   Who    Date        Changes
 * ----  -----  ----------  -----------------------------------------------
 * 1.0   
 *
 * Copyright (c) AICLAB. All rights reserved.
 *******************************************************************************/
module adder #(
    parameter WIDTH = 32
 )
 (
    input  logic [WIDTH-1:0] a_i,
    input  logic [WIDTH-1:0] b_i,
    output logic [WIDTH-1:0] result_o
 );
 
    // Time scale and precision
    timeunit 1ns; timeprecision 100ps;
     
    // Add operation
    /*---ADD CODE HERE---*/
    assign result_o = a_i + b_i;

endmodule : adder
