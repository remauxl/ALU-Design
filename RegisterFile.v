`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 13:59:40
// Design Name: 
// Module Name: RegisterFile
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

module RegisterFile(
    input [15:0] I,
    input [2:0] OutASel,
    input [2:0] OutBSel,
    input [2:0] FunSel,
    input [3:0] RegSel,
    input [3:0] ScrSel,
    input Clock,
    output reg [15:0] OutA,
    output reg [15:0] OutB
);

    wire [15:0] R1_out;
    wire [15:0] R2_out;
    wire [15:0] R3_out;
    wire [15:0] R4_out;
    wire [15:0] S1_out;
    wire [15:0] S2_out;
    wire [15:0] S3_out;
    wire [15:0] S4_out;

    Register R1(I, !RegSel[3], FunSel , Clock , R1_out);
    Register R2(I, !RegSel[2], FunSel , Clock , R2_out);
    Register R3(I, !RegSel[1], FunSel , Clock , R3_out);
    Register R4(I, !RegSel[0], FunSel , Clock , R4_out);

    Register S1(I, !ScrSel[3], FunSel , Clock , S1_out);
    Register S2(I, !ScrSel[2], FunSel , Clock , S2_out);
    Register S3(I, !ScrSel[1], FunSel , Clock , S3_out);
    Register S4(I, !ScrSel[0], FunSel , Clock , S4_out);

    always @(*) begin
    case (OutASel)
        3'b000: OutA <= R1_out;
        3'b001: OutA <= R2_out;
        3'b010: OutA <= R3_out;
        3'b011: OutA <= R4_out;
        3'b100: OutA <= S1_out;
        3'b101: OutA <= S2_out;
        3'b110: OutA <= S3_out;
        3'b111: OutA <= S4_out;
    endcase
    
    case(OutBSel)
        3'b000: OutB <= R1_out;
        3'b001: OutB <= R2_out;
        3'b010: OutB <= R3_out;
        3'b011: OutB <= R4_out;
        3'b100: OutB <= S1_out;
        3'b101: OutB <= S2_out;
        3'b110: OutB <= S3_out;
        3'b111: OutB <= S4_out;
    endcase
 end       
endmodule

