`timescale 1ns/1ps
module ram_true_dual_port_tb;
    wire [7:0] q_a, q_b;
    reg [7:0] data_a, data_b;
    reg [5:0] addr_a, addr_b;
    reg we_a, we_b, clk;

    ram_true_dual_port ram_tdp(q_a,q_b,data_a,data_b,addr_a,addr_b,we_a,we_b,clk);

    initial begin
        $monitor("time=%t we_a=%b addr_a=%b data_a=%b q_a=%b we_b=%b addr_b=%b data_b=%b q_b=%b",$time,we_a,addr_a,data_a,q_a,we_b,addr_b,data_b,q_b);
        clk = 0;
        we_a = 0;
        addr_a = 0;
        data_a = 0;
        we_b = 0;
        addr_b = 0;
        data_b = 0;
        
        #10
        we_a = 1;
        addr_a = 5;
        data_a = 8'b10101010;
        #10
        addr_a = 10;
        data_a = 8'b10110011;
        #10
        we_a=0;
        addr_b = 16;
        #10
        addr_b = 10;
        #10
        we_b = 1;
        addr_b = 5;
        data_b = 8'b11110000;
        addr_a = 5;
        #10
        we_b = 0;
        #20
        $finish;
    end

    always #5 clk <= ~clk;

    initial begin
        $dumpfile("true_dual_port_ram.vcd");
        $dumpvars(0,ram_true_dual_port_tb);
    end

endmodule
