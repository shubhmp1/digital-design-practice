module package_typedef_enum 
    import typedefs::*;
(
    input  logic [6:0] opcode_in,
    input  logic [3:0] alu_op_in,
    output logic [6:0] opcode_out,
    output logic [3:0] alu_op_out,
    output logic       valid_opcode,
    output logic       valid_alu_op
);
    timeunit 1ns; timeprecision 100ps;
    
    assign opcode_out = opcode_in;
    assign alu_op_out = alu_op_in;

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
