module tb;
    reg [3:0] A;
    reg [3:0] B;
    wire eq, gt, lt;

    comparator_4_bit_dataflow uut (.A(A), .B(B), .eq(eq), .gt(gt), .lt(lt));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        $monitor("A = %b, B = %b, EQ = %b, GT = %b, LT = %b", A, B, eq, gt, lt);

        A = 4'b1010; B = 4'b1010; #10;
        A = 4'b1010; B = 4'b1000; #10;
        A = 4'b0001; B = 4'b0010; #10;

        $finish;
    end
endmodule