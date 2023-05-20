`timescale 1ns/1ps
module FA_4bit_df(s,cout,a,b,cin);
    input [3:0] a,b;
    input cin;
    output [3:0] s;
    output cout;

    assign {cout,s} = a+b+cin;
endmodule
