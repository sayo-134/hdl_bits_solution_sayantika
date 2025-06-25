module top_module( 
    input [254:0] in,
    output [7:0] out );
	
    integer i;
    reg [7:0] out_reg;
    assign out = out_reg;
    
    always @(*) begin
        out_reg = 8'd0;
        for(i=0;i<255;i=i+1) begin
            out_reg = out_reg + in[i];
        end
    end
    
endmodule
