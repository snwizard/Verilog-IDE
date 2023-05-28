`timescale 1ns/1ps
module decoder_2_4(Y,I,En);
    output reg [3:0] Y;
    input [1:0] I;
    input En;

    //assign Y = {En & &I, 
    //            En & I[1] & ~I[0],
    //            En & ~I[1] & I[0],
    //            En & ~|I};

    always @(*) begin  //behavioral
        case({En,I})
            3'b100 : Y=4'b0001;
            3'b101 : Y=4'b0010;
            3'b110 : Y=4'b0100;
            3'b111 : Y=4'b1000;
            3'b000,
            3'b001,
            3'b010,
            3'b011 : Y=4'b0000;
            default : $display("error");
        endcase
    end

endmodule
