module mod_14_counter(
    input wire clk,
    input wire start,
    input wire stop,
    input wire reset,
    output reg[3:0] count
);
    reg Q_RS;
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            Q_RS <= 1'b0;
        end else if (start) begin 
            Q_RS <= 1'b1;
        end else if (stop) begin
            Q_RS <= 1'b0;
        end
    end 

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            count <= 4'd0;
        end else if (Q_RS) begin
            if(count > 4'd13) begin
                count <= 4'd0;
            end else begin
                count <= count + 1;
            end
        end
    end
endmodule