`timescale 1ns/1ps
module counter_mod_tb;
    reg clk,rst;
    wire [5:0] count;

    counter_mod c1(count,clk,rst);

    initial begin
        $monitor("time=%t clk=%b rst=%b count=%b",$time,clk,rst,count);
        clk=0;
        rst=0;
        #10 rst=1;
        #10 rst=0;
        #500 $finish;
    end

    always #5 clk=~clk;

    initial begin
        $dumpfile("counter_mod.vcd");
        $dumpvars(0,counter_mod_tb);
    end

endmodule
