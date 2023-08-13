`timescale 1ns/1ps
module sequence_det_tb;
    reg inp,clk,reset;
    wire det;

    sequence_det sq_det(det,inp,clk,reset);

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
        $dumpfile("sequence_det.vcd");
        $dumpvars(0,sequence_det_tb);
    end

endmodule
