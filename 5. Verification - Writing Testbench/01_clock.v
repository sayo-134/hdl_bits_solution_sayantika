module top_module ( );
    reg clk;
    dut u1(clk);
    always #5 clk = ~clk;
    initial clk = 0;

endmodule
