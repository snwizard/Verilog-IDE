module counter_load(count,clk,u_d,load,rst,data);
    output reg [7:0] count;
    input [7:0] data;
    input clk,u_d,load,rst;

    always @(posedge clk)
        if(rst)
            count <= 8'b0;
        else if(load)
            count <= data;
        else if(u_d)
            count <= count+1;
        else
            count <= count-1;

endmodule
