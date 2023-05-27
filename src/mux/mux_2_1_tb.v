`timescale 1ns/1ps
module mux_2_1_tb;

    wire Y;
    reg [1:0] I;
    reg S;

    mux_2_1 mux_2_1_dut(Y,I,S);

    initial begin
        $monitor("time %t   input=2'b%b select=%h output=%h",$time,I,S,Y);
        I=0;
        S=0;
        #10 I=2'b01;
        #10 I=2'b10;
        #10 S=1;
        #10 $finish;
    end

    initial begin
        $dumpfile("mux_2_1.vcd");
        $dumpvars(0,mux_2_1_tb);
    end
endmodule
