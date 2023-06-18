module freq_div(clk_div_2,clk_div_3,clk_div_4,clk,rst);
    output clk_div_2,clk_div_3,clk_div_4;
    input clk,rst;

    freq_div_2 fd2(clk_div_2,clk,rst);
    freq_div_4 fd4(clk_div_4,clk,rst);
    freq_div_3 fd3(clk_div_3,clk,rst);
    
endmodule
