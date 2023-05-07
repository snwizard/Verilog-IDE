`timescale 1ns/1ps
module FA_st_1(s,c,a,b,cin);
    input a,b,cin;
    output s,c;

    wire N1,N2,N3,N4;
    
    xor xor1(N1,a,b);
    xor xor2(s,N1,cin);
    and and1(N2,a,b);
    and and2(N3,b,cin);
    and and3(N4,cin,a);
    or   or1(c,N2,N3,N4);

endmodule
