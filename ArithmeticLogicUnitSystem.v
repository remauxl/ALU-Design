`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2024 17:20:58
// Design Name: 
// Module Name: ArithmeticLogicUnitSystem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.0 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ArithmeticLogicUnitSystem(
    input[2:0] RF_OutASel,
    input[2:0] RF_OutBSel,
    input[2:0] RF_FunSel,

    input[3:0] RF_RegSel,
    input[3:0] RF_ScrSel,

    input[4:0] ALU_FunSel,
    
    input ALU_WF,
    
    input[1:0] ARF_OutCSel,
    input[1:0] ARF_OutDSel,

    input[2:0] ARF_FunSel,
    input[2:0] ARF_RegSel,

    input IR_LH,
    input IR_Write,
    input Mem_WR,
    input Mem_CS,

    input[1:0] MuxASel,
    input[1:0] MuxBSel,

    input MuxCSel,
    input Clock
    );

    reg[15:0] MuxAOut;
    reg[15:0] MuxBOut;
    reg[7:0]  MuxCOut;

    wire[15:0] ALUOut;
    wire[3:0] FlagOut;
    wire[7:0] MemOut;
    
    wire[15:0] OutA;
    wire[15:0] OutB;

    wire[15:0] OutC;
    wire[15:0] OutD;
    wire[15:0] IROut; 

    wire[15:0] Address; 

    always@(*) begin
        case(MuxASel)
        2'b00: MuxAOut <= ALUOut; //16
        2'b01: MuxAOut <= OutC;   //16
        2'b10: MuxAOut <= {8'b0,MemOut};  //8
        2'b11: MuxAOut <= {8'b0,IROut[7:0]}; //8
        endcase
        case(MuxBSel)
        2'b00: MuxBOut <= ALUOut;  //16
        2'b01: MuxBOut <= OutC;    //16
        2'b10: MuxBOut <= {8'b0,MemOut};  //8
        2'b11: MuxBOut <= {8'b0,IROut[7:0]}; //8
        endcase
        case(MuxCSel)
        1'b0: MuxCOut <= ALUOut[7:0];
        1'b1: MuxCOut <= ALUOut[15:8];
        endcase
    end

    InstructionRegister IR(MemOut,IR_LH,IR_Write,Clock,IROut);
    RegisterFile RF(MuxAOut,RF_OutASel,RF_OutBSel,RF_FunSel,RF_RegSel,RF_ScrSel,Clock,OutA,OutB);
    ArithmeticLogicUnit ALU(Clock,OutA,OutB,ALU_FunSel,ALU_WF,FlagOut,ALUOut);
    Memory MEM(Address,MuxCOut,Mem_WR,Mem_CS,Clock,MemOut);
    AddressRegisterFile ARF(Clock,MuxBOut,ARF_OutCSel,ARF_OutDSel,ARF_FunSel,ARF_RegSel,OutC,Address);


endmodule
