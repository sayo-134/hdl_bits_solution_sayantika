module top_module (input a, input b, input c, output out);//
	wire out_b;
    assign out = ~out_b;
    andgate inst1 ( out_b, a, b, c, 1'b1, 1'b1);

endmodule
