`timescale 1ns/1ps
module mux_4_1_tb;
    wire Y;
    reg [3:0] I;
    reg [1:0] S;

    mux_4_1 mux_4_1_tb(Y,I,S);

    initial begin
        $monitor("time %t input=4'b%b select=2'b%b output=%b",$time,I,S,Y);
        I=0;
        S=0;
        #10 I=4'b1101;
        #10 I=4'b1101; 
        #10 S=2'b10;
        #10 I=4'b1001; S=2'b11;
        #10 S=2'b10;
        #10 $finish;
    end

    initial begin
        $dumpfile("mux_4_1.vcd");
        $dumpvars(0,mux_4_1_tb);
    end
endmodule
