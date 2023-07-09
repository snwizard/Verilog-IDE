module ram_dual_port (
    output reg [7:0] q,
    input [7:0] data,
    input [5:0] read_addr, write_addr,
    input we, read_clk, write_clk
);

    reg [7:0] ram[63:0];

    always @(posedge write_clk)
        if(we)
            ram[write_addr] <= data;

    always @(posedge read_clk)
        q <= ram[read_addr];

endmodule
