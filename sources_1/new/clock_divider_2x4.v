`timescale 1ns / 1ps


module clock_divider_2x4(
    input i_clk,
    input i_reset,
    output o_clk_fnd
    );

    reg r_clk_fnd = 0;
    reg [31:0] r_counter_fnd = 0;

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_clk_fnd <= 0;
            r_counter_fnd <= 0;
        end
        else begin
            if (r_counter_fnd == 5_000_000 -1) begin
                r_counter_fnd <= 0;
                r_clk_fnd <= ~r_clk_fnd;
            end
            else begin
                r_counter_fnd <= r_counter_fnd + 1; 
            end
            end
    end
endmodule
