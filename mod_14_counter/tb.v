`include "design.v"

module tb;
    reg clk;
    reg reset;
    reg stop;
    reg start;
    wire[3:0] count;

    mod_14_counter uut (
        .clk(clk),
        .reset(reset),
        .stop(stop),
        .start(start),
        .count(count)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        $monitor("At time %t | RESET = %b | CLK = %b | STOP = %b | START = %b | COUNT = %b", $time, reset, clk, stop, start, count);

        reset = 1; start = 1; stop = 0; #10;
        reset = 0; start = 1; stop = 0; #50;
        reset = 0; start = 0; stop = 1;
        $finish;
    end
endmodule