`timescale 1ns/1ps
module FA_tb;

    reg a,b,cin;
    wire s,c;

    FA_st_2  FA1(s,c,a,b,cin);

    initial //excuted only once and cannot be synthesized
    begin
        $monitor("time=%t \t a=%b \t b=%b \t cin=%b \t s=%b \t c=%b",$time,a,b,cin,s,c,);
        a=0;
        b=0;
        cin=0; //a,b,cin set a time 0
        #10 a=1;
        #10 b=1;
        #10 cin=1;
        #10 $finish;
    end

    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0,FA_tb);
    end
endmodule
