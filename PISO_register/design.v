module PISO_register #(parameter WIDTH = 8)(
    input wire[WIDTH-1:0] data_in,
    input wire clk,
    input wire load,
    input wire reset,
    output reg data_out
);
    reg[WIDTH-1:0] shift_register;

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            data_out <= 1'b0;
            shift_register <= {WIDTH{1'b0}};
        end else if(load) begin
            shift_register <= data_in;
        end else begin
            data_out <= shift_register[WIDTH - 1];
            shift_register <= {{shift_register[WIDTH-2:0]}, {1'b0}};
        end
    end
endmodule