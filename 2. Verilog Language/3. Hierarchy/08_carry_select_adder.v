module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1, cout2_0, cout2_1;
    wire [15:0] sum_0,sum_1;
    add16 add_lo (a[15:0],b[15:0],1'b0,sum[15:0],cout1);
    add16 add_hi_0 (a[31:16],b[31:16],1'b0,sum_0,cout2_0);
    add16 add_hi_1 (a[31:16],b[31:16],1'b1,sum_1,cout2_1);
    assign sum[31:16] = (cout1)? sum_1:sum_0;
endmodule
