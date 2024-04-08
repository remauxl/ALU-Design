`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 17:41:11
// Design Name: 
// Module Name: AddressRegisterFile
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


module AddressRegisterFile(
    input Clock,
    input [15:0] I,
    input [1:0] OutCSel,
    input [1:0] OutDSel,
    input [2:0] FunSel,
    input [2:0] RegSel,
    output reg[15:0] OutC,
    output reg[15:0] OutD
    );
    wire [15:0] PCOut;
    wire [15:0] AROut;
    wire [15:0] SPOut; 

    Register PC(I,!RegSel[2], FunSel, Clock, PCOut);
    Register AR(I,!RegSel[1], FunSel, Clock, AROut);
    Register SP(I,!RegSel[0], FunSel, Clock, SPOut); 
    
    always@(*)begin
       case(OutCSel)
            2'b00 : OutC <= PCOut;
            2'b01 : OutC <= PCOut;
            2'b10 : OutC <= AROut;
            2'b11 : OutC <= SPOut;
       endcase

       case(OutDSel)
            2'b00 : OutD <= PCOut;
            2'b01 : OutD <= PCOut;
            2'b10 : OutD <= AROut;
            2'b11 : OutD <= SPOut;
       endcase
   
    end
    
endmodule