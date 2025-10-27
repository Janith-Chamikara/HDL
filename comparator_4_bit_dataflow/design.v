module comparator_4_bit_dataflow(
    input wire[3:0] A,
    input wire[3:0] B,
    output wire eq,
    output wire gt,
    output wire lt
);
    assign eq = (A == B);
    assign gt = (A > B);
    assign lt = (A < B);
endmodule