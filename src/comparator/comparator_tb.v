`timescale 1ns/1ps
module comparator_tb;
    wire Eq,Gt,St;
    reg [3:0] A,B;

    comparator c1(Eq,Gt,St,A,B);

    initial begin
        $monitor("time=%t A=4'b%b B=4'b%b Eq=%b Gt=%b St=%b",$time,A,B,Eq,Gt,St);
        A=0;
        B=0;
        #10 A=4'b1011;
        #10 B=4'b1100;
        #10 A=4'b1100;
        #10 B=4'b0011;
        #10 $finish;
    end

    initial begin
        $dumpfile("comparator.vcd");
        $dumpvars(0,comparator_tb);
    end

endmodule
