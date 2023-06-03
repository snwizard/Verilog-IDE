`timescale 1ns/1ps
module barrel_shifter_tb;
    reg [7:0]In; 
    reg [2:0]n;
    reg Lr;
    wire [7:0]Out;

    barrel_shifter bs1(Out,In,Lr,n);

    initial begin
        $monitor("time=%t Input=8'b%b Lr=%b shift_places=3'b%b Output=8'b%b",$time,In,Lr,n,Out);
        In=0;
        Lr=0;
        n=0;
        #10 In=8'b11011001; Lr=1; n=3;
        #10 Lr=0; n=4;
        #10 Lr=1; n=5;
        #10 Lr=0; n=7; 
        #10 $finish;      
    end

    initial begin
        $dumpfile("barrel_shifter.vcd");
        $dumpvars(0,barrel_shifter_tb);
    end

endmodule
