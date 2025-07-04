module top_module( 
    input [2:0] in,
    output [1:0] out );
    reg [1:0] out_reg;
    integer i;
    always @(*) begin
        out_reg = 0;
        for(i=0;i<3;i=i+1) out_reg = out_reg + in[i];
    end
    assign out = out_reg;
endmodule
