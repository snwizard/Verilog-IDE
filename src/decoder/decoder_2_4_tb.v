`timescale 1ns/1ps
module decoder_2_4_tb;
    wire [3:0] Y;
    reg [1:0] I;
    reg En;

    decoder_2_4 d_2_4(Y,I,En);

    initial begin
        $display("time %t   input=2'b%b En=%b output=4'b%b",$time,I,En,Y);
        I=0;
        En=0;
        #10
        repeat (2) begin
            En=En+1;
            repeat (4) begin
                I=I+1;
                #10;
            end
        end
        
    end

    initial begin
        $dumpfile("decoder_2_4.vcd");
        $dumpvars(0,decoder_2_4_tb);
    end

endmodule
