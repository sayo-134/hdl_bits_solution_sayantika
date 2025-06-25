module top_module( 
    input [99:0] in,
    output [99:0] out
);
    integer i;
    reg [99:0] out_reg;
    assign out = out_reg;
    
    always @(*) begin
        for(i=0;i<100;i=i+1) begin
            out_reg[i] = in[99-i];
        end
    end

endmodule
