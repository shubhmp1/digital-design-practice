
module counter
#(
    parameter WIDTH = 32
)
(
    input  logic clk_i,
    input  logic rst_n_i,
    input  logic en_i,
    input  logic [WIDTH-1:0] data_i,
    input  logic ld_i,
    output logic [WIDTH-1:0] data_o
);


timeunit 1ns; timeprecision 100ps;

logic [WIDTH-1:0] count_r;

function automatic logic [WIDTH-1:0] next_count(input logic [WIDTH-1:0] count_r, 
                                input logic [WIDTH-1:0] data_i, 
                                input logic ld_i, 
                                input logic en_i);
    
    if (ld_i)begin 
        return data_i;
    end
    
    else if (en_i && ~ld_i)begin
        return (count_r+1);
    end
    
    else begin
        return count_r;
    end
    
endfunction

always_ff @(posedge clk_i or negedge rst_n_i) begin
    if (!rst_n_i)
        count_r <= {WIDTH{1'b0}};
    else
        count_r <= next_count(count_r, data_i, ld_i, en_i);
end
    

assign data_o = count_r;

endmodule : counter