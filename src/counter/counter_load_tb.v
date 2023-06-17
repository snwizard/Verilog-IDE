`timescale 1ns/1ps
module counter_load_tb;
    reg [7:0] data;
    reg clk,u_d,rst,load;
    wire [7:0] count;

    counter_load c1(count,clk,u_d,load,rst,data);

    always #5 clk = !clk;

    initial begin
        $monitor("time=%t  clk=%b load=%b data=%b u_d=%b rst=%b count=%b",$time,clk,load,data,u_d,rst,count);
        load=0;
        clk=0;
        u_d=1;
        rst=0;
        #10 load=1; data=8'b1010_0101;
        #10 load=0;
        #100 rst=1;
        #20 rst=0;
        #50 u_d=0;
        #100 $finish;
    end

    initial begin
        $dumpfile("counter_load.vcd");
        $dumpvars(0,counter_load_tb);
    end

endmodule
