`timescale 1ns/1ps
module dff_tb;
    reg d,clk,rst;
    wire q;

    dff dff1(q,d,clk,rst);

    initial begin
        $monitor(" time %t  d=%b clk=%b q=%b",$time,d,clk,q);
        d=0;
        #15 d=1;
        #20 d=0;
        #30 d=1;
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
        $dumpfile("dff.vcd");
        $dumpvars(0,dff_tb);
    end

endmodule
