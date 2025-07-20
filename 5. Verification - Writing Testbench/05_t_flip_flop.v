module top_module ();
    reg clk, reset, t;
	wire q;
    tff uut_tff(clk,reset,t,q);
    always #5 clk = ~clk;
    initial clk = 0;
    initial begin
        reset = 1;
        #10 reset = 0;
    end
    initial begin
        t = 0;
        #10 t = 1;
        //#10 t = 0;
    end
endmodule
