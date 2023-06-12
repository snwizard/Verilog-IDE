module seven_seg_dec(SSa,SSb,SSc,SSd,SSe,SSf,SSg,bcd);
    output SSa,SSb,SSc,SSd,SSe,SSf,SSg;
    input [3:0] bcd;
    reg [6:0] seg_ah; //7 segment encoding in active high

    always @(bcd) begin
        case(bcd)
            4'd0 : seg_ah = 7'b111_1110;
            4'd1 : seg_ah = 7'b011_0000;
            4'd2 : seg_ah = 7'b110_1101;
            4'd3 : seg_ah = 7'b111_1001;
            4'd4 : seg_ah = 7'b011_0011;
            4'd5 : seg_ah = 7'b101_1011;
            4'd6 : seg_ah = 7'b101_1111;
            4'd7 : seg_ah = 7'b111_0000;
            4'd8 : seg_ah = 7'b111_1111;
            4'd9 : seg_ah = 7'b111_1011;
            default : seg_ah = 7'b000_0001; 
        endcase
    end
    assign {SSa,SSb,SSc,SSd,SSe,SSf,SSg} = seg_ah;
endmodule
 