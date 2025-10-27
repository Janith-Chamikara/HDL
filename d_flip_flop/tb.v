`include "design.v"

module tb;
    reg d;
    wire Q;
    reg clk;
    reg en;
    reg reset;
  
    d_flip_flop uut (.d(d), .Q(Q), .clk(clk), .reset(reset), .en(en));
  
    initial clk = 0;
    always #5 clk = ~clk;
  
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        $monitor("D = %b, Q = %b, Reset = %b, Enable = %b, Clock = %b",d,Q,reset,en,clk);
        d = 0; en = 0; reset = 0;
        #10;d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;
        #10 reset = 1;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 en = 1;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 reset = 0;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        $finish;
    end
 endmodule
                
                 
              
  