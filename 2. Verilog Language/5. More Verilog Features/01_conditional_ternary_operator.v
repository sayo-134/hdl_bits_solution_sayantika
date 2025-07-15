module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0] min1, min2;
    // assign intermediate_result1 = compare? true: false;
    assign min1 = (a>b)? b : a;
    assign min2 = (c>d)? d : c;
    assign min = (min1>min2)? min2 : min1;
endmodule
