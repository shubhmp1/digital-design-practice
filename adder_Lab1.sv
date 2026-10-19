
module adder #(
    parameter WIDTH = 32
 )
 (
    input  logic [WIDTH-1:0] a_i,
    input  logic [WIDTH-1:0] b_i,
    output logic [WIDTH-1:0] result_o
 );
 
    timeunit 1ns; timeprecision 100ps;
     
    assign result_o = a_i + b_i;

endmodule : adder
