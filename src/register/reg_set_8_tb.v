`timescale 1ns/1ps
module reg_set_8_tb;
    reg [7:0] d1,d2;
    reg clk,rst;
    wire [7:0] q1,q2;

    reg_set_8 reg_set_8_1(q1,q2,clk,rst,d1,d2);

    initial begin
        $monitor(" time %t  d1=%b clk=%b rst=%b q1=%b",$time,d1,clk,rst,q1);
        $monitor(" time %t  d2=%b clk=%b rst=%b q2=%b",$time,d2,clk,rst,q2);
        d1=0;
        d2=0;
        #15 d1=8'b1011_1100;
        #20 d1=8'b0000_0000;
        #30 d1=8'b0101_0011;
    end

    initial begin
        repeat(10) begin
            #10 clk=0;
            #10 clk=1;
        end
        #10 $finish;
    end

    initial begin
        rst=0;
        #90 rst=1;
    end

    initial begin
        $dumpfile("reg_set_8.vcd");
        $dumpvars(0,reg_set_8_tb);
    end

endmodule
