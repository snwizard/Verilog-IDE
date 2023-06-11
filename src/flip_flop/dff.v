module dff(q,d,clk,rst);
    output reg q;
    input d, clk, rst;

    ////dff with asynchronous reset
    //always @(posedge clk, posedge rst) begin
    //    if(rst)
    //        q <= 1'b0;
    //    else
    //        q <= d; 
    //end

    //dff with synchronous reset
    always @(posedge clk)begin
        if(rst)
            q <= 1'b0;
        else
            q <= d;

    end

endmodule
