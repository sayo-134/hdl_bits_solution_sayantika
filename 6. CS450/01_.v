module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);	
    reg [9:0] count;
    assign tc = (count=='b0);
    always @(posedge clk) begin
        if (load) count <= data;
        else count <= (count != 'b0)?(count - 1'b1):count;
    end

endmodule
