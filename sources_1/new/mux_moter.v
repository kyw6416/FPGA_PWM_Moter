`timescale 1ns / 1ps

module mux_moter(
    input [4:0] i_x,
    input [3:0] sel,
    output o_y
    );

    reg r_y;
    assign o_y = r_y;

    always @(*) begin
        case (sel)
            4'b0000 : r_y <= i_x[0];
            4'b0001 : r_y <= i_x[1];
            4'b0010 : r_y <= i_x[2];
            4'b0100 : r_y <= i_x[3];
            4'b1000 : r_y <= i_x[4];
            default: r_y <= 1'b0;
        endcase
    end
endmodule
