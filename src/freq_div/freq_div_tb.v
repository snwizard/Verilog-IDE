`timescale 1ns/1ps
module freq_div_tb;
    reg clk,rst;
    wire clk_div_2;
    wire clk_div_4;
    wire clk_div_3;

    freq_div fd(clk_div_2,clk_div_3,clk_div_4,clk,rst);

    always #5 clk <= ~clk;

    initial begin
        clk=0;
        rst=1;
        #25 rst=0;
        #200 $finish;
    end

    initial begin
        $dumpfile("freq_div.vcd");
        $dumpvars(0,freq_div_tb);
    end

endmodule
