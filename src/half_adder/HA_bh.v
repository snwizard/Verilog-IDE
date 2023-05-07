`timescale 1ns/1ps
module HA_bh(s,c,a,b); 
    input a,b;
    output reg s,c;

    //behavioral design style
    always @(a,b)
    begin
        s=a^b;
        c=a&b;
    end
endmodule //HA
