`timescale 1ns / 1ps

module mode(
    input i_clk,
    input i_reset,
    input [2:0] i_button,
    output [3:0] o_lightState
    );

    parameter S_0 = 4'd0,
              S_1 = 4'd1,
              S_2 = 4'd2,
              S_3 = 4'd3,
              S_4 = 4'd4;

    reg [2:0] curState, nextState;
    reg [3:0] r_lightState;
    assign o_lightState = r_lightState;

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) curState <= S_0;
        else         curState <= nextState;
        
    end

    always @(curState  or i_button) begin
        case (curState)
            S_0 : begin
                if (i_button[1]) nextState <= S_1;
                else          nextState <= S_0;
            end
            S_1  : begin
                if (i_button[1]) nextState <= S_2;
                else if (i_button[2]) nextState <= S_0;
                else if (i_button[0]) nextState <= S_0;
                else          nextState <= S_1;
            end
             S_2  : begin
                if (i_button[1]) nextState <= S_3;
                else if (i_button[2]) nextState <= S_1;
                else if (i_button[0]) nextState <= S_0;
                else          nextState <= S_2;
            end
             S_3  : begin
                if (i_button[1]) nextState <= S_4;
                else if (i_button[2]) nextState <= S_2;
                else if (i_button[0]) nextState <= S_0;
                else          nextState <= S_3;
            end
             S_4  : begin
                if (i_button[2]) nextState <= S_3;
                else if (i_button[0]) nextState <= S_0;
                else          nextState <= S_4;
            end
        endcase
    end

    always @(curState) begin
        r_lightState <= 4'bxxxx;
        case (curState)
            S_0 : r_lightState <= 4'b0000;
            S_1 : r_lightState <= 4'b0001;
            S_2 : r_lightState <= 4'b0010;
            S_3 : r_lightState <= 4'b0100;
            S_4 : r_lightState <= 4'b1000;
        endcase
    end
endmodule
