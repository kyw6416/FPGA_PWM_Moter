`timescale 1ns / 1ps

module decoder_2x4(
    input [1:0] i_digitPosion,
    output [3:0] o_digitSelect
    );

    reg [3:0] r_digitSelect;
    assign o_digitSelect = r_digitSelect;

    always @(*) begin
        case (i_digitPosion)
            2'b00 : r_digitSelect = 4'b1110;
            2'b01 : r_digitSelect = 4'b1101;
            2'b10 : r_digitSelect = 4'b1011;
            2'b11 : r_digitSelect = 4'b0111;
        endcase
    end
endmodule
