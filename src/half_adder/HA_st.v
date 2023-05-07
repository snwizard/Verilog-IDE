`timescale 1ns/1ps
module HA_st(s,c,a,b);
    input a,b;
    output s,c;

    //structural design style
    xor xor1(s,a,b);
    and and1(c,a,b);
endmodule
