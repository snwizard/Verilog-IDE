module ram_single_port(
    output reg [7:0] q,
    input [7:0] data,
    input [5:0] read_addr, write_addr,
    input we, clk
);
    //single port ram simultaneous operations allowed
    //1 write
    //1 read
    //1 write and 1 read --> read while write
    reg [7:0] ram [63:0];

    always @(posedge clk) begin
        if(we)
            ram[write_addr] <= data;
        q <= ram[read_addr]; 
    end

endmodule
