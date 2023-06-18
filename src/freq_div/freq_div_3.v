module freq_div_3(clk_out,clk,rst);
    output clk_out;
    input clk,rst;

    reg [1:0] pos_cnt, neg_cnt;

    always @(posedge clk)
        if(rst || pos_cnt == 2)
            pos_cnt <= 0;
        else
            pos_cnt <= pos_cnt+1;
    
    always @(negedge clk)
        if(rst || neg_cnt ==2)
            neg_cnt <= 0;
        else 
            neg_cnt <= neg_cnt+1;

    assign clk_out = (pos_cnt==2) || (neg_cnt==2);

endmodule
