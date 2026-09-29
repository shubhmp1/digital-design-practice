module package_typedef_enum 
    import typedefs::*;
(
    input  logic [6:0] opcode_in,    // Raw opcode input
    input  logic [3:0] alu_op_in,    // Raw ALU operation input
    output logic [6:0] opcode_out,   // Decoded opcode
    output logic [3:0] alu_op_out,   // Decoded ALU operation
    output logic       valid_opcode,  // Indicates if opcode is valid
    output logic       valid_alu_op   // Indicates if ALU operation is valid
);
    // Time scale and precision
    timeunit 1ns; timeprecision 100ps;

    // Pass through the inputs
    assign opcode_out = opcode_in;
    assign alu_op_out = alu_op_in;

    // Validate opcode
    always_comb begin
        valid_opcode = 1'b0;
        case (opcode_in)
            OPCODE_LOAD:       valid_opcode = 1'b1;
            OPCODE_STORE:      valid_opcode = 1'b1;
            OPCODE_R_TYPE:     valid_opcode = 1'b1;
            OPCODE_I_TYPE_ALU: valid_opcode = 1'b1;
            OPCODE_JALR:       valid_opcode = 1'b1;
            OPCODE_JAL:        valid_opcode = 1'b1;
            OPCODE_BRANCH:     valid_opcode = 1'b1;
            default:           valid_opcode = 1'b0;
        endcase
    end

    // Validate ALU operation
    always_comb begin
        valid_alu_op = 1'b0;
        case (alu_op_in)
            ALU_ADD: valid_alu_op = 1'b1;
            ALU_SUB: valid_alu_op = 1'b1;
            ALU_AND: valid_alu_op = 1'b1;
            ALU_OR:  valid_alu_op = 1'b1;
            ALU_XOR: valid_alu_op = 1'b1;
            ALU_SLT: valid_alu_op = 1'b1;
            ALU_SLL: valid_alu_op = 1'b1;
            ALU_SRL: valid_alu_op = 1'b1;
            ALU_SRA: valid_alu_op = 1'b1;
            default: valid_alu_op = 1'b0;
        endcase
    end

endmodule