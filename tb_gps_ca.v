`timescale 1ns/1ps
module tb_gps_ca;
// Inputs
reg clk;
reg reset;
reg [5:0] prn_select;
// Outputs
wire prn_code;
wire [9:0] g1_state;
wire [9:0] g2_state;
// Instantiate DUT
gps_ca_top DUT(
    .clk(clk),
    .reset(reset),
    .prn_select(prn_select),
    .prn_code(prn_code),
    .g1_state(g1_state),
    .g2_state(g2_state)
);
// Clock Generation
always #5 clk = ~clk;
// Test Sequence
initial
begin
    clk = 0;
    reset = 1;
    prn_select = 6'd1;
    #20;
    reset = 0;
    // PRN1
    #500;
    prn_select = 6'd2;
    // PRN2
    #500;
    prn_select = 6'd3;
    // PRN3
    #500;
    prn_select = 6'd4;
    // PRN4
    #500;
    $stop;
end

endmodule
