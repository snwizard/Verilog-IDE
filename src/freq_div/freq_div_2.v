module freq_div_2(clk_out,clk,rst);
    output reg clk_out;
    input clk,rst;

    always @(posedge clk)
        if(rst)
            clk_out <= 0;
        else
            clk_out <= ~clk_out;

endmodule
