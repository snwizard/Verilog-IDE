`timescale 1ns/1ps
module encoder_4_2(Y,V,I);
    output  [1:0] Y;
    output  V;
    input [3:0] I;

    // 0001 --> Y=00 V=1  
    // 0010 --> Y=01 V=1
    // 0100 --> Y=10 V=1
    // 1000 --> Y=11 V=1
    // others   V=0

    //assign Y={I[3]|I[2],I[1]|I[3]}; //encoder dataflow
    //assign V=   I[3]&~I[2]&~I[1]&~I[0] |
    //            ~I[3]&I[2]&~I[1]&~I[0] |
    //            ~I[3]&~I[2]&I[1]&~I[0] |
    //            ~I[3]&~I[2]&~I[1]&I[0];

    //always @(*) begin //encoder behavioral
    //    case(I)
    //        4'b0001 : {V,Y} = 3'b100;
    //        4'b0010 : {V,Y} = 3'b101;
    //        4'b0100 : {V,Y} = 3'b110;
    //        4'b1000 : {V,Y} = 3'b111;
    //        default : {V,Y} = 3'b000;
    //    endcase
    //end 

    assign {V,Y} = I[0]?3'b100:I[1]?3'b101:I[2]?3'b110:I[3]?3'b111:3'b000; //priority encoder dataflow

    //always @(*) begin //priority encoder behavioral
    //        if(I[0])      {V,Y}=3'b100;
    //        else if(I[1]) {V,Y}=3'b101;
    //        else if(I[2]) {V,Y}=3'b110;
    //        else if(I[3]) {V,Y}=3'b111;
    //        else          {V,Y}=3'b000;
    //end

endmodule
