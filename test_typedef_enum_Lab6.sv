module test_typedef_enum;
    // Time scale and precision
    timeunit 1ns; timeprecision 100ps;
    import tb_utils_pkg::*;

    // Test signals
    logic [6:0] opcode_in;
    logic [3:0] alu_op_in;
    logic [6:0] opcode_out;
    logic [3:0] alu_op_out;
    logic       valid_opcode;
    logic       valid_alu_op;
    int         error_count = 0;
    int         test_count = 0;

    logic       exp_valid_opcode;
    logic       exp_valid_alu_op;

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

    // Instantiate the decoder module
    typedef_enum dut (.*);

    // Check results task
    task automatic check_result(string test_name, logic exp_valid_opcode, logic exp_valid_alu_op);
        test_count++;
        
        if (valid_opcode !== exp_valid_opcode || valid_alu_op !== exp_valid_alu_op) begin
            error_count++;
            $error("[%s] FAILED: opcode=0b%7b, alu_op=0b%4b\nExpected: valid_opcode=%b, valid_alu_op=%b\nGot:      valid_opcode=%b, valid_alu_op=%b",
                test_name, opcode_in, alu_op_in, exp_valid_opcode, exp_valid_alu_op, valid_opcode, valid_alu_op);
        end else begin
            $display("[%s] PASSED: opcode=0b%7b, alu_op=0b%4b, valid_opcode=%b, valid_alu_op=%b",
                test_name, opcode_in, alu_op_in, valid_opcode, valid_alu_op);
        end
    endtask

    // Test stimulus
    initial begin
        $display("\nStarting RISC-V Decoder Testbench");

        // Test all valid opcodes with a valid ALU operation
        opcode_in = OPCODE_LOAD;
        alu_op_in = ALU_ADD;
        #1 check_result("Valid LOAD + ADD", 1'b1, 1'b1);

        opcode_in = OPCODE_STORE;
        alu_op_in = ALU_ADD;
        #1 check_result("Valid STORE + ADD", 1'b1, 1'b1);

        opcode_in = OPCODE_R_TYPE;
        alu_op_in = ALU_SUB;
        #1 check_result("Valid R_TYPE + SUB", 1'b1, 1'b1);

        opcode_in = OPCODE_I_TYPE_ALU;
        alu_op_in = ALU_AND;
        #1 check_result("Valid I_TYPE_ALU + AND", 1'b1, 1'b1);

        opcode_in = OPCODE_JALR;
        alu_op_in = ALU_OR;
        #1 check_result("Valid JALR + OR", 1'b1, 1'b1);

        opcode_in = OPCODE_JAL;
        alu_op_in = ALU_XOR;
        #1 check_result("Valid JAL + XOR", 1'b1, 1'b1);

        opcode_in = OPCODE_BRANCH;
        alu_op_in = ALU_SLT;
        #1 check_result("Valid BRANCH + SLT", 1'b1, 1'b1);

        // Test invalid opcodes
        opcode_in = 7'b1111111;
        alu_op_in = ALU_ADD;
        #1 check_result("Invalid opcode + valid ALU", 1'b0, 1'b1);

        opcode_in = 7'b0000000;
        alu_op_in = ALU_ADD;
        #1 check_result("Invalid opcode + valid ALU", 1'b0, 1'b1);

        // Test invalid ALU operations
        opcode_in = OPCODE_R_TYPE;
        alu_op_in = 4'b1111;
        #1 check_result("Valid opcode + invalid ALU", 1'b1, 1'b0);

        opcode_in = OPCODE_LOAD;
        alu_op_in = 4'b1001;
        #1 check_result("Valid opcode + invalid ALU", 1'b1, 1'b0);

        // Test all ALU operations with a valid opcode
        opcode_in = OPCODE_R_TYPE;
        alu_op_in = ALU_ADD;
        #1 check_result("R_TYPE + ADD", 1'b1, 1'b1);

        alu_op_in = ALU_SUB;
        #1 check_result("R_TYPE + SUB", 1'b1, 1'b1);

        alu_op_in = ALU_AND;
        #1 check_result("R_TYPE + AND", 1'b1, 1'b1);

        alu_op_in = ALU_OR;
        #1 check_result("R_TYPE + OR", 1'b1, 1'b1);

        alu_op_in = ALU_XOR;
        #1 check_result("R_TYPE + XOR", 1'b1, 1'b1);

        alu_op_in = ALU_SLT;
        #1 check_result("R_TYPE + SLT", 1'b1, 1'b1);

        alu_op_in = ALU_SLL;
        #1 check_result("R_TYPE + SLL", 1'b1, 1'b1);

        alu_op_in = ALU_SRL;
        #1 check_result("R_TYPE + SRL", 1'b1, 1'b1);

        alu_op_in = ALU_SRA;
        #1 check_result("R_TYPE + SRA", 1'b1, 1'b1);

        // Test both invalid opcode and invalid ALU op
        opcode_in = 7'b1010101;
        alu_op_in = 4'b1111;
        #1 check_result("Invalid opcode + invalid ALU", 1'b0, 1'b0);

        // Random tests
        $display("\nRunning 20 random tests...");
        for (int i = 0; i < 20; i++) begin
            opcode_in = $urandom;
            alu_op_in = $urandom;
            #1;
            
            // Calculate expected results based on module logic
            exp_valid_opcode = (opcode_in == OPCODE_LOAD || 
                                     opcode_in == OPCODE_STORE ||
                                     opcode_in == OPCODE_R_TYPE ||
                                     opcode_in == OPCODE_I_TYPE_ALU ||
                                     opcode_in == OPCODE_JALR ||
                                     opcode_in == OPCODE_JAL ||
                                     opcode_in == OPCODE_BRANCH);
                                     
            exp_valid_alu_op = (alu_op_in == ALU_ADD ||
                                     alu_op_in == ALU_SUB ||
                                     alu_op_in == ALU_AND ||
                                     alu_op_in == ALU_OR ||
                                     alu_op_in == ALU_XOR ||
                                     alu_op_in == ALU_SLT ||
                                     alu_op_in == ALU_SLL ||
                                     alu_op_in == ALU_SRL ||
                                     alu_op_in == ALU_SRA);
                                     
            check_result($sformatf("Random test %0d", i), exp_valid_opcode, exp_valid_alu_op);
        end

        // Display final test results
        $display("\nTestbench completed");
        $display("Tests executed: %0d", test_count);
        $display("Errors detected: %0d", error_count);

        // Display final results
        display_result(error_count);
        
            
        $finish;
    end

endmodule