module shift_reg(SO,clk,rst,SI);
    input SI;
    input clk,rst;
    output SO;
    reg [7:0] SR;

    assign SO=SR[7];

    always @(posedge clk, posedge rst)
        if(rst)
            SR <= 8'b0;
        else
            SR <= {SR[6:0],SI};
        
endmodule
