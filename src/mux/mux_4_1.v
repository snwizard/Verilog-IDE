`timescale 1ns/1ps
module mux_4_1(Y,I,S);
    output reg Y;
    input [3:0] I;
    input [1:0] S;

    //assign Y=I[S]; //dataflow method 1

    //assign Y= ~|S?I[0]:(&S?I[3]:(S[0]?I[1]:I[2])); //dataflow method 2

    always@(*) //behavioral
        case(S)
            2'd0: Y=I[0];
            2'd1: Y=I[1];
            2'd2: Y=I[2];
            2'd3: Y=I[3];
            default:$display("error");
        endcase

endmodule
