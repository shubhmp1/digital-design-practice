/*******************************************************************************
* Ripple Carry Adder Module
* ----------------------------------------------------------------------------- 
* This module implements a Ripple Carry Adder using an array of Full Adders.
* 
* Inputs:
*   - a    : First input operand (array of bits)
*   - b    : Second input operand (array of bits)
*   - cin  : Carry input from previous stage (1 bit)
*
* Outputs:
*   - sum  : Sum output (array of bits)
*   - cout : Carry output to next stage (1 bit)
*******************************************************************************/
module rippleCarryAdder (
    input  logic [3:0] a, b, // 4-bit inputs
    input  logic cin,
    output logic [3:0] sum,
    output logic cout
);
    logic [2:0] c; // Carry bits

    // Instantiate Full Adders
    /*---ADD CODE HERE---*/
    fullAdder fa1 (.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]), .cout(c[0]));
    fullAdder fa2 (.a(a[1]),.b(b[1]),.cin(c[0]),.sum(sum[1]), .cout(c[1]));
    fullAdder fa3 (.a(a[2]),.b(b[2]),.cin(c[1]),.sum(sum[2]), .cout(c[2]));
    fullAdder fa4 (.a(a[3]),.b(b[3]),.cin(c[2]),.sum(sum[3]), .cout(cout));

    


endmodule : rippleCarryAdder