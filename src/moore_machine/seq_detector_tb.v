`timescale 1ns/1ps
module seq_detector_tb;
    reg inp,clk,reset;
    wire det;

    seq_detector sq_det(det,inp,clk,reset);

    initial begin
        $monitor("time=%t clk=%b reset=%b inp=%b det=%b ",$time,clk,reset,inp,det);
        clk = 0;
        reset = 1;
        inp = 0;
        #10
        reset = 0;
        #20
        inp = 1;
        #10
        inp = 1;
        #10
        inp = 0;
        #10
        inp = 1;
        #10
        inp = 0;
        #20
        inp = 1;
        #100
        $finish;

    end

    always #5 clk <= ~clk;

    initial begin
        $dumpfile("seq_detector.vcd");
        $dumpvars(0,seq_detector_tb);
    end

endmodule
