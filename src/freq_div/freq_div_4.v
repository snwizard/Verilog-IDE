module freq_div_4(clk_out,clk,rst);
    output reg clk_out;
    input clk,rst;
    reg clk_2;

    always @(posedge clk)
        if(rst)
            clk_2 <= 0;
        else
            clk_2 <= ~clk_2;

    always @(posedge clk_2, posedge rst)
        if(rst)
            clk_out <= 0;
        else    
            clk_out <= ~clk_out;

endmodule