module PIPO_register #(parameter WIDTH = 8)(
    input wire[WIDTH-1:0] data_in,
    input wire clk,
    input wire en,
    input wire reset,
    output reg[WIDTH-1:0] data_out
);
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            data_out <= 8'b00000000;
        end else if(en) begin
            data_out <= data_in;
        end
    end
endmodule