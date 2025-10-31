module SIPO_register #(parameter WIDTH = 8)(
    input wire clk,
    input wire reset,
    input wire load,
    input wire data_in,

    output reg[WIDTH - 1:0] data_out;
)
    reg [WIDTH-1:0] shift_register;

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            data_out <= {WIDTH{1'b0}};
            shift_register <= {WIDTH{1'b0}};
        end else if(load) begin
            shift_register <= {shift_register[WIDTH-2:0], data_in};
        end else begin
            data_out <= shift_register;
        end
    end
endmodule