module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    integer i;
    reg [7:0] q, anyedge_reg;
    assign anyedge = anyedge_reg;
    always @(posedge clk) begin
        for (i=0;i<=7;i=i+1) begin
            q <= in;
            anyedge_reg <= in ^ q;
        end
    end

endmodule
