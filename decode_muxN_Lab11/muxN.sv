
module muxN #(

    parameter int N = 4,
    parameter int WIDTH = 32

) (
    input logic [0:N-1][WIDTH-1:0] d_i,
    input logic [$clog2(N)-1:0] sel_i,
    output logic [WIDTH-1:0] y_o
);

    timeunit 1ns; timeprecision 100ps;

    always_comb begin
    y_o = '0;
    
    if (sel_i < N) begin
        y_o = d_i[sel_i];
    end
    
    end

endmodule
