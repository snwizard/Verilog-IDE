`timescale 1ns/1ps
module ram_dual_port_tb;
    wire [7:0] q;
    reg [7:0] data;
    reg [5:0] read_addr, write_addr;
    reg we, read_clk, write_clk;

    ram_dual_port ram_dp(q,data,read_addr,write_addr,we,read_clk,write_clk);

    initial begin
        $monitor("time=%t we=%b write_addr=%b data=%b read_addr=%b q=%b",$time,we,write_addr,data,read_addr,q);
        read_clk = 0;
        write_clk = 0;
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

    always #5 write_clk <= ~write_clk;
    always #10 read_clk <= ~read_clk;

    initial begin
        $dumpfile("dual_port_ram.vcd");
        $dumpvars(0,ram_dual_port_tb);
    end

endmodule
