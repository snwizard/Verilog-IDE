module reg_set_8(q1,q2,clk,rst,d1,d2);
    output reg [7:0] q1,q2;
    input [7:0] d1,d2;
    input clk,rst;

    always @(posedge clk) begin
        if(rst) begin
            q1 <= 0;
            q2 <= 0;
        end
        else begin
            q1 <= d1;
            q2 <= d2;
        end
    end

endmodule
