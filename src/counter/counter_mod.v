module counter_mod(count,clk,rst);
    parameter MOD_N = 46;
    parameter WIDTH = $clog2(MOD_N);

    output reg [WIDTH-1:0]count;
    input clk,rst;

    always @(posedge clk)
        if(rst || count>= MOD_N)
            count <= 0;
        else
            count <= count+1;

endmodule
