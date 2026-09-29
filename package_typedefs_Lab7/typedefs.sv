/*******************************************************************************
 * Module: typedefs
 * 
 * File Name: typedefs.sv
 * Project: TRIX-V (Tiny RISC-V Core)
 *
 * Description:
 *     Type definitions and enum declarations for RISC-V opcodes and ALU operations
 *
 * Modification History:
 * Ver   Who    Date        Changes
 * ----  -----  ----------  -----------------------------------------------
 * 1.0   
 *
 * Copyright (c) AICLAB. All rights reserved.
 *******************************************************************************/
package typedefs;
    // Time scale and precision
    timeunit 1ns; timeprecision 100ps;

    // RISC-V ALU Operation Codes
    // Import the enum types from the module we're testing - RISC-V opcodes
        typedef enum logic [6:0] {
            OPCODE_LOAD       = 7'b0000011,
            OPCODE_STORE      = 7'b0100011,
            OPCODE_R_TYPE     = 7'b0110011,
            OPCODE_I_TYPE_ALU = 7'b0010011,
            OPCODE_JALR       = 7'b1100111,
            OPCODE_JAL        = 7'b1101111,
            OPCODE_BRANCH     = 7'b1100011
        } opcode_t;

    // RISC-V opcode
    // RISC-V ALU Operations
        typedef enum logic [3:0] {
            ALU_ADD = 4'b0000,
            ALU_SUB = 4'b0001,
            ALU_AND = 4'b0010,
            ALU_OR  = 4'b0011,
            ALU_XOR = 4'b0100,
            ALU_SLT = 4'b0101,
            ALU_SLL = 4'b0110,
            ALU_SRL = 4'b0111,
            ALU_SRA = 4'b1000
        } alu_op_t;
    

endpackage : typedefs


    

    
