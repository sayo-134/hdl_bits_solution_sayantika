module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    assign Y0 = (((~y[2] & y[0])||y[2]) & ~x) || x&(~y[2] & ~y[0]);
    assign z = (y[2] & ~y[1] & ~y[0]) || (~y[2] & y[1] & y[0]);
endmodule
