module top_module ( input clk, input d, output q );
    wire internal_q[1:0];
    my_dff dff1(clk,d,internal_q[0]);
    my_dff dff2(clk,internal_q[0],internal_q[1]);
    my_dff dff3(clk,internal_q[1],q);
endmodule
