
module fullAdder (
    input  logic a, b, cin,
    output logic sum, cout
);
    logic s1, c1, c2;

    halfAdder hA1(
        .a(a),
        .b(b),
        .sum(s1),
        .cout(c1)
    );
    
    halfAdder hA2(
        .a(s1),
        .b(cin),
        .sum(sum),
        .cout(c2)
    );

    assign cout = c1 | c2;
    
endmodule : fullAdder
