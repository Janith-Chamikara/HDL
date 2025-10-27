module d_flip_flop(
    input wire d,
    input wire clk,
    input wire en,
    input wire reset,
    output reg Q
);
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            Q <= 1'b0;
        end else if(en) begin
            Q <= d;
        end
    end
endmodule