module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    
    integer i;
    always @(posedge clk) begin
        if (load) q <= data;
        else begin
            q[0] <= q[1];
            for (i=1;i<=510;i=i+1) begin
                q[i] <= q[i+1] ^ q[i-1];
            end
            q[511] <= q[510];
        end
    end

endmodule
