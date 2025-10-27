`include "design.v"

module tb;
    reg[3:0] A, B;
    wire eq, lt ,gt;

    comparator_4_bit_behavioral uut (
        .A(A),
        .B(B),
        .eq(eq),
        .lt(lt),
        .gt(gt)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        $monitor("A = %b, B = %b, EQAL = %b, GREATER = %b, LOWER = %b", A, B, eq, gt, lt);

        A=4'b1010; B = 4'b1010; #10;
        A=4'b1000; B = 4'b0001; #10;
        A=4'b0101; B = 4'b1011; #10;

        $finish;
    end
endmodule