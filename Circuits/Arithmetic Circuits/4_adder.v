module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [2:0] cout_int;
    full_adder FA0(x[0],y[0],1'b0,cout_int[0],sum[0]);
    full_adder FA1(x[1],y[1],cout_int[0],cout_int[1],sum[1]);
    full_adder FA2(x[2],y[2],cout_int[1],cout_int[2],sum[2]);
    full_adder FA3(x[3],y[3],cout_int[2],sum[4],sum[3]);
endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );
    assign {cout,sum} = a + b + cin;
endmodule

