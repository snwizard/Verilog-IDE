`timescale 1ns/1ps
module comparator(Eq,Gt,St,A,B);
    input [3:0] A,B;
    output Eq,Gt,St;

    assign Eq = (A==B);
    assign Gt = (A>B);
    assign St = (A<B);

endmodule
