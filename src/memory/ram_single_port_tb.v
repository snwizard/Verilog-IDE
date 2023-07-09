`timescale 1ns/1ps
module ram_single_port_tb;
    wire [7:0] q;
    reg [7:0] data;
    reg [5:0] read_addr, write_addr;
    reg we, clk;

    ram_single_port ram_sp(q,data,read_addr,write_addr,we,clk);

    initial begin
        $monitor("time=%t we=%b write_addr=%b data=%b read_addr=%b q=%b",$time,we,write_addr,data,read_addr,q);
        clk = 0;
        data = 0;
        read_addr = 0;
        write_addr = 0;
        we = 0;
        #10
        we = 1;
        write_addr = 5;
        data = 8'b10101010;
        #10
        write_addr = 10;
        data = 8'b10110011;
        #10
        we=0;
        read_addr = 16;
        #10
        read_addr = 10;
        #10
        we = 1;
        write_addr = 5;
        data = 8'b11110000;
        read_addr = 5;
        #10
        we = 0;
        #20
        $finish;
    end

    always #5 clk <= ~clk;

    initial begin
        $dumpfile("single_port_ram.vcd");
        $dumpvars(0,ram_single_port_tb);
    end

endmodule
