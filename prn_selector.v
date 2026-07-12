module prn_selector(

    input  [4:0] prn_select,
    input  [9:0] g2_state,

    output reg g2_selected

);

always @(*) begin

    case(prn_select)

        // PRN 1 (G2 taps 2 & 6)
        6'd1:
            g2_selected = g2_state[1] ^ g2_state[5];

        // PRN 2 (G2 taps 3 & 7)
        6'd2:
            g2_selected = g2_state[2] ^ g2_state[6];

        // PRN 3 (G2 taps 4 & 8)
        6'd3:
            g2_selected = g2_state[3] ^ g2_state[7];

        // PRN 4 (G2 taps 5 & 9)
        6'd4:
            g2_selected = g2_state[4] ^ g2_state[8];

        default:
            g2_selected = g2_state[1] ^ g2_state[5];

    endcase

end

endmodule
