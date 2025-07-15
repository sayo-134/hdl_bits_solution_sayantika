module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT=0, LEFT_FALL=1, RIGHT=2, RIGHT_FALL=3;
    reg [1:0] state, next_state;
    
    always @(posedge clk, posedge areset) begin
        if (areset) state <= LEFT;
        else state <= next_state;    
    end
    
    always @(*) begin
        case (state)
            LEFT: begin
                walk_left=1; walk_right=0; aaah=0;
                if (~ground) next_state = LEFT_FALL;
                else begin
                    if (bump_left && bump_right) next_state = RIGHT;
                    else if (bump_left) next_state = RIGHT;
                    else if (bump_right) next_state = LEFT;
                    else next_state = LEFT;                        
                end
            end
            LEFT_FALL: begin
                walk_left=0;walk_right=0;aaah=1;
                if (ground) next_state = LEFT;
                else next_state = LEFT_FALL;
            end
            RIGHT: begin
                walk_left=0; walk_right=1; aaah=0;
                if (~ground) next_state = RIGHT_FALL;
                else begin
                    if (bump_left && bump_right) next_state = LEFT;
                    else if (bump_right) next_state = LEFT;
                    else if (bump_left) next_state = RIGHT;
                    else next_state = RIGHT;                        
                end
            end
            RIGHT_FALL: begin
                walk_left=0;walk_right=0;aaah=1;
                if (ground) next_state = RIGHT;
                else next_state = RIGHT_FALL;
            end
        endcase
    end

endmodule
