module gps_ca_top(clk, reset, prn_select,prn_code);
input clk ;
input reset ;
input [5:0] prn_select ;
output prn_code ;
wire [9:0] g2_from_reg ;
wire g2_selected ;
wire g1_selected ;
g2_lfsr u3 (.g2(g2_from_reg),.clk(clk),.reset(reset));
prn_selector u1 (.prn_select(prn_select)  , .g2_selected(g2_selected),.g2_state(g2_from_reg));
g1_lfsr u2 ( .g1_output(g1_selected),.clk(clk),.reset(reset) );

assign prn_code = g2_selected ^ g1_selected ;
endmodule 

 

