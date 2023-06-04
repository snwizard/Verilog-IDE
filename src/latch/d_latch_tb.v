`timescale 1ns/1ps
module d_latch_tb;
    wire q;
    reg d,en,rst;

    d_latch dl1(q,d,en,rst);

    initial begin
        $monitor("time %t d=%b en=%b rst=%b q=%b",$time,d,en,rst,q);
        d=0;
        en=0;
        rst=0;
        #10 en=1;
        #10 d=1;
        //#10 rst=0;
        #10 d=0;
        #10 en=0;
        #10 d=0;
        #10 d=1;
        #10 en=1;
        #10 en=0;
        #10 d=0;
        #10 rst=1;
        #10 $finish;
    end

    initial begin
        $dumpfile("d_latch.vcd");
        $dumpvars(0,d_latch_tb);
    end

endmodule
