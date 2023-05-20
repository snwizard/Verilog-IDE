`timescale 1ns/1ps
module FA_4bit_tb;

    reg [3:0] a,b;
    reg cin;
    wire [3:0] s;
    wire cout;
    wire [3:0] s_ref;
    wire cout_ref;

    assign {cout_ref,s_ref}=a+b+cin;

    FA_4bit_st  FA_4bit(s,cout,a,b,cin);

    initial //excuted only once and cannot be synthesized
    begin
        $monitor("time=%t \t a=%b \t b=%b \t cin=%b \t s=%b \t cout=%b",$time,a,b,cin,s,cout);
        a=0;
        b=0;
        cin=0; //a,b,cin set a time 0
        #10
        repeat(16) begin
            a=a+1;
            repeat(16) begin
                b=b+1;
                repeat(2) 
                    #10 cin=cin+1;
            end
        end
        #10 $finish;
    end

    initial begin
        $dumpfile("full_adder_4_bit.vcd");
        $dumpvars(0,FA_4bit_tb);
    end
endmodule
