`include "design.v"

module tb;
    reg [7:0] data_in;
    reg clk;
    reg en;
    reg reset;
    wire[7:0] data_out;

    PIPO_register #(.WIDTH(8)) uut (
        .data_in(data_in),
        .data_out(data_out),
        .reset(reset),
        .clk(clk),
        .en(en)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        $monitor("At TIME %t | RESET = %b | CLK = %b | EN = %b | DATA_IN = %b | DATA_OUT = %b", $time, reset, clk, en, data_in, data_out);

        reset = 0; en = 1; data_in = 8'd64; #10;
        reset = 1; en = 0; data_in = 8'd64; #10;
        reset = 1; en = 1; data_in = 8'd64; #10;

        $finish;
    end
endmodule