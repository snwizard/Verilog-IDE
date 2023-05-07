`timescale 1ns/1ps
module FA_st_2(s,c,a,b,cin);
    input a,b,cin;
    output s,c;
    wire N1,N,N3;

    //HA HA1(N1,N2,a,b);
    HA HA1(.s(N1),.c(N2),.a(a),.b(b));
    //HA HA2(s,N3,N1,cin);
    HA HA2(.s(s),.c(N3),.a(N1),.b(cin));
    or or1(c,N2,N3);
endmodule
