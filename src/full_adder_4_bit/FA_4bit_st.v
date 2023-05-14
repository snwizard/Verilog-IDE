`timescale 1ns/1ps
module FA_4bit_st(s,cout,a,b,cin);
    input [3:0] a,b;
    input cin;
    output [3:0]s;
    output cout;

    wire n1,n2,n3;

    FA_st_2 FA1(s[0],n1,a[0],b[0],cin);
    FA_st_2 FA2(s[1],n2,a[1],b[1],n1);
    FA_st_2 FA3(s[2],n3,a[2],b[2],n2);
    FA_st_2 FA4(s[3],cout,a[3],b[3],n3);

endmodule
