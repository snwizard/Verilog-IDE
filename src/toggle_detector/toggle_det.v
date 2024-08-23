module toggle_det(trigger,clk,pulse);
    input trigger,clk;
    output pulse;

    reg trig_d;

    always @(posedge clk) begin
        trig_d <= trigger;
    end

    assign pulse = trigger & ~trig_d;

endmodule
