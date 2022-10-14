`timescale 1ns / 1ps

module top_moter(
    input i_clk,
    input i_reset,
    input [2:0] i_button,
    output [3:0] o_Led,
    output [3:0] o_digitSelect,
    output [7:0] o_fndFont,
    output o_y
    );

    // LED stat
    wire [2:0] w_button;
    button_control btn0(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[0]),
    .o_button(w_button[0])
    );

    button_control btn1(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[1]),
    .o_button(w_button[1])
    );

    button_control btn2(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[2]),
    .o_button(w_button[2])
    );

    wire [3:0] w_state;
    assign o_Led = w_state;
    mode fsm(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(w_button),
    .o_lightState(o_Led)
    );
    // LED END

    // fnd_2x4 start
    wire w_clk_2x4;
    clock_divider_2x4 clk_div_2x4(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk_fnd(w_clk_2x4)
    );

    wire [1:0] w_count_2x4;
    counter_2x4 cnt_2x4(
    .i_clk_fnd(w_clk_2x4),
    .i_reset(i_reset),
    .o_counter_fnd(w_count_2x4)
    );

    decoder_2x4 decoder_2x4(
    .i_digitPosion(w_count_2x4),
    .o_digitSelect(o_digitSelect)
    );
    // fnd_2x4 end

    // fnd_data start


    BCDtoFND_decoder BCDtoFND(
    .i_value(w_state),
    .o_fndFont(o_fndFont)
    );


    // moter start
    wire w_clk_moter;
    clockDivider_moter clkdiv_moter(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk(w_clk_moter)
    );

    wire [9:0] w_counter; 
    counter_moter cnt(
    .i_clk(w_clk_moter),
    .i_reset(i_reset),
    .o_counter(w_counter)
    );

    wire [4:0] w_light;
    comparator comp(
    .i_counter(w_counter),
    .o_light(w_light)
    );

    mux_moter mux_mo(
    .i_x(w_light),
    .sel(w_state),
    .o_y(o_y)
    );
    // moter end
endmodule
