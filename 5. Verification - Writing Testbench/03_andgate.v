module top_module();
    reg [1:0] in;
    wire out;
    andgate uut_and (in, out);
	initial begin
        in = 0;
        #10 in[0] = 1;
        #10 in = 2'b10;
        #10 in[0] = 1;
        #10 $finish;
    end
endmodule
