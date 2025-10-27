module testbench;
    reg A, B;       
    wire Y;        
    and_gate uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        $dumpfile("and_gate.vcd");  
        $dumpvars(0, testbench);
        $monitor("At time %t: A=%b B=%b => Y=%b", $time, A, B, Y);

        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        $finish;
    end
endmodule