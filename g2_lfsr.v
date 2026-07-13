module g2_lfsr(clk,  reset , g2);
input clk ;
input reset ;
output [9:0] g2 ;
reg [9:0] g2 ;
wire feedback ;
assign feedback = g2[9] ^ g2[8]^g2[1] ^ g2[2]^g2[5] ^ g2[7];

always@(posedge clk , posedge reset)
begin
	if(reset)
		g2 <= 10'b1111111111;
	else 
		g2 <= { g2[8:0],feedback};
end
endmodule
	
		
	

