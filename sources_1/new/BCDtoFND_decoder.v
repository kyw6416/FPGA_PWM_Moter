`timescale 1ns / 1ps

module BCDtoFND_decoder(
    input [3:0] i_value,
    output [7:0] o_fndFont
    );

    reg [7:0] r_fndFont;
    assign o_fndFont = r_fndFont;

    reg [3:0] r_value;
    assign o_value = r_value;


    always @(*) begin
        r_fndFont = 8'b11111111;
        case (r_value)
            4'h0 : r_fndFont = 8'hc0;
            4'h1 : r_fndFont = 8'hf9;
            4'h2 : r_fndFont = 8'ha4;
            4'h3 : r_fndFont = 8'hb0;
            4'h4 : r_fndFont = 8'h99;
            4'h5 : r_fndFont = 8'h92;
            4'h6 : r_fndFont = 8'h82;
            4'h7 : r_fndFont = 8'hf8;
            4'h8 : r_fndFont = 8'h80;
            4'h9 : r_fndFont = 8'h90;
            4'ha : r_fndFont = 8'h7f;
            default : r_fndFont = 8'hff;
        endcase

        case (i_value)
            4'b0000 : r_value = 4'd00;
            4'b0001 : r_value = 4'd01;
            4'b0010 : r_value = 4'd02;
            4'b0100 : r_value = 4'd03;
            4'b1000 : r_value = 4'd04;
            default : r_fndFont = 4'd00;
        endcase
    end 
endmodule
