`timescale 1ns/1ps
module shift_reg_tb;
    reg clk,rst,SI;
    wire SO;

    shift_reg sr1(SO,clk,rst,SI);

    initial begin
        $monitor("time %t  SI=%b clk=%b rst=%b SO=%b",$time,SI,clk,rst,SO);
        SI=0;
        #30 SI=1;
        #20 SI=1;
        #20 SI=0;
        #20 SI=1;
    end

    initial begin
        repeat(15) begin
            #10 clk=0;
            #10 clk=1;
        end
        #10 $finish;
    end

    initial begin
        rst=1;
        #15 rst=0;
    end

    initial begin
        $dumpfile("shift_reg.vcd");
        $dumpvars(0,shift_reg_tb);
    end

endmodule
