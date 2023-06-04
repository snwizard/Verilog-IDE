module d_latch(q,d,en,rst);
    output reg q;
    input d,en,rst;

    //assign q=en?d:q; //dataflow

    always @(q,d,en,rst) //behavioral
        if(rst) q=1'b0;
        else if(en) q=d;

endmodule
