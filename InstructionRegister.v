`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 16:19:20
// Design Name: 
// Module Name: InstructionRegister
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module InstructionRegister(
    input [7:0] I,
    input LH,
    input Write,
    input Clock,
    output reg [15:0] IROut
);

always @(posedge Clock) begin
if(!Write) begin
        IROut <= IROut;
        end
        
else begin
    if(!LH) begin
        IROut[7:0] <= I[7:0];
        end
    else begin
        IROut[15:8] <= I[7:0];
        end
        end 
end

endmodule