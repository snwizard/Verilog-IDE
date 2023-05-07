`timescale 1ns/1ps
module HA(s,c,a,b); 
    input a,b;
    output s,c;

    //dataflow design style
    assign s=a^b;
    assign c=a&b;
endmodule //HA
