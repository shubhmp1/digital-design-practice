
module addr_decoder #(

    parameter logic [11:0] DMEM_START = 12'h000,
    parameter logic [11:0] DMEM_END = 12'h3FF,
    parameter logic [11:0] UART_START = 12'h400,
    parameter logic [11:0] UART_END = 12'h40F

) (

    input logic [11:0] addr,
    output logic sel_dmem,
    output logic sel_uart
    
);

    timeunit 1ns; timeprecision 100ps;
    
    always_comb begin
    sel_dmem = 1'b0;
    sel_uart = 1'b0;
    
    if ((addr >= DMEM_START) && (addr <= DMEM_END))begin
        sel_dmem = 1'b1;
    end
    
    if((addr >= UART_START) && (addr <= UART_END))begin
        sel_uart = 1'b1;
    end

    end
    
endmodule : addr_decoder