module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter LEFT=0, LEFT_FALL=1, RIGHT=2, RIGHT_FALL=3, DIG_LEFT=4, DIG_RIGHT=5;
    reg [2:0] state, next_state;
    
    always @(posedge clk, posedge areset) begin
        if (areset) state <= LEFT;
        else state <= next_state;
    end
    
    always @(*) begin
        walk_left=0;walk_right=0;aaah=0;digging=0;
        case(state)
            LEFT: begin
                walk_left=1;
                if (~ground) next_state=LEFT_FALL;
                else if (dig) next_state=DIG_LEFT;
                else begin
                    if (bump_left && bump_right) next_state = RIGHT;
                    else if (bump_right) next_state = LEFT;
                    else if (bump_left) next_state = RIGHT;
                    else next_state = LEFT;
                end
            end
            LEFT_FALL: begin
                aaah=1;
                if (ground) next_state = LEFT;
                else next_state = LEFT_FALL;
            end
            DIG_LEFT: begin
                digging=1;
                if (~ground) next_state=LEFT_FALL;
                else next_state = DIG_LEFT;
            end
            RIGHT: begin
                walk_right=1;
                if (~ground) next_state=RIGHT_FALL;
                else if (dig) next_state=DIG_RIGHT;
                else begin
                    if (bump_left && bump_right) next_state = LEFT;
                    else if (bump_right) next_state = LEFT;
                    else if (bump_left) next_state = RIGHT;
                    else next_state = RIGHT;
                end
            end
            RIGHT_FALL: begin
                aaah=1;
                if (ground) next_state = RIGHT;
                else next_state = RIGHT_FALL;
            end
            DIG_RIGHT: begin
                digging=1;
                if (~ground) next_state=RIGHT_FALL;
                else next_state = DIG_RIGHT;
            end
        endcase
    end

endmodule
