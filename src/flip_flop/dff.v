module dff(q,d,clk,rst);
    output reg q;
    input d, clk, rst;

    always @(posedge clk or posedge rst) begin
        if(rst)
            q <= 1'b0;
        else
            q <= d; 
    end

endmodule
