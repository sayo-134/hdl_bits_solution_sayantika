module top_module();
    reg clk, in;
    reg [2:0] s;
	wire out;
    q7 uut_q7 (clk,in,s,out);
    always #5 clk = ~clk;
    initial clk = 0;
    initial begin
        in = 0;
        #20 in = 1;
        #10 in = 0;
        #10 in = 1;
        #30 in = 0;
    end
    initial begin
        s = 3'd2;
        #10 s = 3'd6;
        #10 s = 3'd2;
        #10 s = 3'd7;
        #10 s = 3'd0;
    end
endmodule
