`timescale 1ns/1ps
module mux_2_1(Y,I,S);
    output reg Y;
    input [1:0] I;
    input S;

    //assign Y=S?I[1]:I[0]; //data flow

    always@(*) //anytime I or S changes //behavioral 
        if(S)
            Y=I[1];
        else
            Y=I[0];


endmodule
