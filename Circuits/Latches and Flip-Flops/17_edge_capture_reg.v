module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    integer i;
    reg [31:0] q;
    reg [31:0] nedge_reg;
    always @(posedge clk) begin
        q <= in; // it is important here
        if (reset) begin
            nedge_reg <= 0;
        end
        else begin
            nedge_reg <= (q & ~in) | nedge_reg;
        end
    end
	assign out = nedge_reg;
endmodule
