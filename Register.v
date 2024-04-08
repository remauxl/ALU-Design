`timescale 1ns / 1ps

module Register (
    input [15:0] I,
    input E,
    input [2:0] FunSel,
    input Clock,
    output reg [15:0] Q
);

always @(posedge Clock) begin
    case(E)
        1'b0: ; // Do nothing when E is 0
        1'b1: begin // Update Q based on FunSel when E is 1
            case(FunSel)
                default: ; // Do nothing if FunSel is not recognized
                3'b000: Q <= Q - 1'b1; // Decrement
                3'b001: Q <= Q + 1'b1; // Increment
                3'b010: Q <= I; // Load
                3'b011: Q <= 16'b0; // Clear
                3'b100: Q <= {16'b0, I[7:0]};
                3'b101: Q[7:0] <= I[7:0]; // Only Write Low
                3'b110: Q[15:8] <= I[7:0]; // Only Write High
                3'b111: begin // Sign
                    if(I[7] == 1)
                        Q <= {I[15], I[7:0]};
                    else
                        Q <= {8'h00, I[7:0]};
                end
            endcase
        end
    endcase
end

endmodule

