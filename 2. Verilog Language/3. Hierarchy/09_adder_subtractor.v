module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b_add_sub;
    assign b_add_sub = (sub)? ~b:b;
    wire cout0,cout1;
    add16 add_lo(a[15:0],b_add_sub[15:0],sub,sum[15:0],cout0);
    add16 add_hi(a[31:16],b_add_sub[31:16],cout0,sum[31:16],cout1);
endmodule
