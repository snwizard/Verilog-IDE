`timescale 1ns/1ps
module fifo_single_clk_tb;

    parameter FIFO_DEPTH = 64;
    parameter FIFO_WIDTH = 8;
    parameter FIFO_CTR_BITS = $clog2(FIFO_DEPTH);

    wire [FIFO_WIDTH-1:0] buf_out;
    wire buf_empty,buf_full;
    wire [FIFO_CTR_BITS-1:0] fifo_counter;

    reg clk,rst;
    reg [FIFO_WIDTH-1:0] buf_in;
    reg rd_en,wr_en;

    fifo_single_clk #(  .FIFO_DEPTH(FIFO_DEPTH),
                        .FIFO_WIDTH(FIFO_WIDTH)
                    )
                    fifo1(buf_out,buf_empty,buf_full,fifo_counter,buf_in,rd_en,wr_en,clk,rst);

    initial begin
        $monitor("time=%t rd_en=%b wr_en=%b buf_in=%b buf_out=%b",$time,rd_en,wr_en,buf_in,buf_out);
        clk=0;
        rst=1;
        buf_in=0;
        rd_en=0;
        wr_en=0;

        #10
        rst=0;
        #10
        wr_en=1;
        buf_in=8'b10110011;
        #10
        buf_in=8'b11110000;
        #10
        buf_in=8'b10101010;
        #10
        wr_en=0;
        #10
        rd_en=1;
        #100
        $finish;
    end

    always #5 clk <= ~clk;

    initial begin
        $dumpfile("fifo_single_clk.vcd");
        $dumpvars(0,fifo_single_clk_tb);
    end

endmodule
