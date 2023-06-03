`timescale 1ns/1ps
module encoder_4_2_tb;
    wire [1:0] Y;
    wire V;
    reg [3:0] I;

    encoder_4_2 enc1(Y,V,I);

    initial begin
        $monitor("time %t input=2'b%b valid=%b output=4'b%b",$time,I,V,Y);
        I=0;
        repeat (16) begin
            #10 I=I+1;
        end
        #10 $finish;
    end

    initial begin
        $dumpfile("encoder_4_2.vcd");
        $dumpvars(0,encoder_4_2_tb);
    end
endmodule
