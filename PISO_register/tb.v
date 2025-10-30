`include "design.v"

module tb;
    reg clk;
    reg[7:0] data_in;
    reg load;
    reg reset;
    wire data_out;

    PISO_register #(.WIDTH(8)) uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        $monitor("At Time %t | RESET = %b | CLK = %b | LOAD = %b | DATA_IN = %b | DATA_OUT = %b", $time, reset, clk, load, data_in, data_out);

        reset = 1; load = 1; data_in = 8'd10; #10;
        reset = 0; load = 1; data_in = 8'b10101010; #10;
        reset = 0; load = 0; #100;

        $finish;
    end
endmodule

