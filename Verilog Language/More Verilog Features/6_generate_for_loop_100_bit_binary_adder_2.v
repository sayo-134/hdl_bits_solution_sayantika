module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    full_adder fadd0(a[0],b[0],cin,sum[0],cout[0]);
	
    generate
        genvar i;
        for(i=1;i<100;i=i+1) begin: generate_full_adders
            full_adder faddi(a[i],b[i],cout[i-1],sum[i],cout[i]); 
        end
    endgenerate
endmodule

module full_adder (
	input a, b, cin,
	output sum, cout);
    assign {cout,sum} = a + b + cin;
endmodule
