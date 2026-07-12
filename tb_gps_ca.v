`timescale 1ns/1ps
module tb_gps_ca;

    reg clk;
    reg reset;
    reg [5:0] prn_select;
    wire prn_code;

    integer p, i;
    reg [9:0] first10;
    reg [11:0] padded;
    integer d0, d1, d2, d3;

    // Instantiate DUT (matches your actual top module: 4 ports only)
    gps_ca_top DUT(
        .clk(clk),
        .reset(reset),
        .prn_select(prn_select),
        .prn_code(prn_code)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;

        // Loop over PRN 1 to 4
        for (p = 1; p <= 4; p = p + 1) begin
            reset = 1;
            prn_select = p;
            #20;
            reset = 0;

            first10 = 10'b0;
            for (i = 0; i < 10; i = i + 1) begin
                @(posedge clk);
                first10 = {first10[8:0], prn_code};
            end

            padded = {2'b00, first10};
            d0 = padded[11:9];
            d1 = padded[8:6];
            d2 = padded[5:3];
            d3 = padded[2:0];

            $display("PRN %0d : binary = %b : octal = %0d%0d%0d%0d",
                      p, first10, d0, d1, d2, d3);
        end

        $stop;
    end

endmodule
