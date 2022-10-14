`timescale 1ns / 1ps

module counter_2x4(
    input i_clk_fnd,
    input i_reset,
    output [1:0] o_counter_fnd
    );

    reg [1:0] r_counter_fnd;
    assign o_counter_fnd = r_counter_fnd;

    always @(posedge i_clk_fnd or posedge i_reset) begin
        if(i_reset) begin
            r_counter_fnd <= 0;
        end

        else begin
            r_counter_fnd <= r_counter_fnd + 1;
        end
    end
endmodule
