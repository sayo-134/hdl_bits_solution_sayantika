module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] cout_int;
    bcd_fadd add0 (a[3:0],b[3:0],cin,cout_int[0],sum[3:0]);
    genvar i;
    generate
        for(i=1;i<100;i=i+1) begin: packed_bcd_adder
            bcd_fadd addi (a[(i<<2)+3:(i<<2)],b[(i<<2)+3:(i<<2)],cout_int[i-1],cout_int[i],sum[(i<<2)+3:(i<<2)]);
        end
    endgenerate
    assign cout = cout_int[99];
	
endmodule
