`timescale 1ns/1ps
module seven_seg_dec_tb;
    wire SSa,SSb,SSc,SSd,SSe,SSf,SSg;
    reg [3:0] In;
    wire [6:0] seg;

    assign seg = {SSa,SSb,SSc,SSd,SSe,SSf,SSg};

    seven_seg_dec ssd1(SSa,SSb,SSc,SSd,SSe,SSf,SSg,In);

    initial begin
        $monitor("time %t  In=%b Out=%b",$time,In,seg);
        In=0;
        repeat(16)
            #10 In = In+1;
    end

    initial begin
        $dumpfile("seven_seg_dec.vcd");
        $dumpvars(0,seven_seg_dec_tb);
    end

endmodule
