module seq_detector(
    input wire clk,
    input wire reset,
    input wire input_bit,
    output reg out
);
    reg [3:0] current_state;
    reg [3:0] next_state;

    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 3'b10;
    parameter s3 = 3'b11;

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            current_state <= s0;
        end else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case(current_state)
            s0: next_state = input_bit ? s1 : s0;
            s1: next_state = input_bit ? s1 : s2;
            s2: next_state = input_bit ? s3 : s0;
            s3: next_state = input_bit ? s4 : s2;
            s4: next_state = input_bit ? s1 : s2;
            default: next_state = s0;
        endcase
    end

    always begin
        out = current_state == s4;
    end

endmodule