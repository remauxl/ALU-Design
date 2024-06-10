`timescale 1ns / 1ps

module SequenceCounter(
    input Clock,
    input Reset,
    output [7:0] T
    );

    reg [7:0] counter = 8'b1000000;
    
    always @(posedge Clock)
        begin
            counter = {counter[6:0], counter[7]};
            if (Reset == 1'b1) begin  
                counter = 8'b1;
                end
        end
    assign T = counter;

endmodule


module SequenceDecoder(
    input [7:0] T,
    output T0,
    output T1,
    output T2,
    output T3,
    output T4,
    output T5,
    output T6,
    output T7
    );

    assign T0=(~T[7]&~T[6]&~T[5]&~T[4]&~T[3]&~T[2]&~T[1]&T[0]);
    assign T1=(~T[7]&~T[6]&~T[5]&~T[4]&~T[3]&~T[2]&T[1]&~T[0]);
    assign T2=(~T[7]&~T[6]&~T[5]&~T[4]&~T[3]&T[2]&~T[1]&~T[0]);
    assign T3=(~T[7]&~T[6]&~T[5]&~T[4]&T[3]&~T[2]&~T[1]&~T[0]);
    assign T4=(~T[7]&~T[6]&~T[5]&T[4]&~T[3]&~T[2]&~T[1]&~T[0]);
    assign T5=(~T[7]&~T[6]&T[5]&~T[4]&~T[3]&~T[2]&~T[1]&~T[0]);
    assign T6=(~T[7]&T[6]&~T[5]&~T[4]&~T[3]&~T[2]&~T[1]&~T[0]);
    assign T7=(T[7]&~T[6]&~T[5]&~T[4]&~T[3]&~T[2]&~T[1]&~T[0]);

endmodule



module OPCodeDecoder(
    input [5:0] s,
    output S00,
    output S01,
    output S02,
    output S03,
    output S04,
    output S05,
    output S06,
    output S07,
    output S08,
    output S09,
    output S0A,
    output S0B,
    output S0C,
    output S0D,
    output S0E,
    output S0F,
    output S10,
    output S11,
    output S12,
    output S13,
    output S14,
    output S15,
    output S16,
    output S17,
    output S18,
    output S19,
    output S1A,
    output S1B,
    output S1C,
    output S1D,
    output S1E,
    output S1F,
    output S20,
    output S21
    );
    assign 
    S00=(~s[5]&~s[4]&~s[3]&~s[2]&~s[1]&~s[0]),
    S01=(~s[5]&~s[4]&~s[3]&~s[2]&~s[1]&s[0]),
    S02=(~s[5]&~s[4]&~s[3]&~s[2]&s[1]&~s[0]),
    S03=(~s[5]&~s[4]&~s[3]&~s[2]&s[1]&s[0]),
    S04=(~s[5]&~s[4]&~s[3]&s[2]&~s[1]&~s[0]),
    S05=(~s[5]&~s[4]&~s[3]&s[2]&~s[1]&s[0]),
    S06=(~s[5]&~s[4]&~s[3]&s[2]&s[1]&~s[0]),
    S07=(~s[5]&~s[4]&~s[3]&s[2]&s[1]&s[0]),
    S08=(~s[5]&~s[4]&s[3]&~s[2]&~s[1]&~s[0]),
    S09=(~s[5]&~s[4]&s[3]&~s[2]&~s[1]&s[0]),
    S0A=(~s[5]&~s[4]&s[3]&~s[2]&s[1]&~s[0]),
    S0B=(~s[5]&~s[4]&s[3]&~s[2]&s[1]&s[0]),
    S0C=(~s[5]&~s[4]&s[3]&s[2]&~s[1]&~s[0]),
    S0D=(~s[5]&~s[4]&s[3]&s[2]&~s[1]&s[0]),
    S0E=(~s[5]&~s[4]&s[3]&s[2]&s[1]&~s[0]),
    S0F=(~s[5]&~s[4]&s[3]&s[2]&s[1]&s[0]),
    S10=(~s[5]&s[4]&~s[3]&~s[2]&~s[1]&~s[0]),
    S11=(~s[5]&s[4]&~s[3]&~s[2]&~s[1]&s[0]),
    S12=(~s[5]&s[4]&~s[3]&~s[2]&s[1]&~s[0]),
    S13=(~s[5]&s[4]&~s[3]&~s[2]&s[1]&s[0]),
    S14=(~s[5]&s[4]&~s[3]&s[2]&~s[1]&~s[0]),
    S15=(~s[5]&s[4]&~s[3]&s[2]&~s[1]&s[0]),
    S16=(~s[5]&s[4]&~s[3]&s[2]&s[1]&~s[0]),
    S17=(~s[5]&s[4]&~s[3]&s[2]&s[1]&s[0]),
    S18=(~s[5]&s[4]&s[3]&~s[2]&~s[1]&~s[0]),
    S19=(~s[5]&s[4]&s[3]&~s[2]&~s[1]&s[0]),
    S1A=(~s[5]&s[4]&s[3]&~s[2]&s[1]&~s[0]),
    S1B=(~s[5]&s[4]&s[3]&~s[2]&s[1]&s[0]),
    S1C=(~s[5]&s[4]&s[3]&s[2]&~s[1]&~s[0]),
    S1D=(~s[5]&s[4]&s[3]&s[2]&~s[1]&s[0]),
    S1E=(~s[5]&s[4]&s[3]&s[2]&s[1]&~s[0]),
    S1F=(~s[5]&s[4]&s[3]&s[2]&s[1]&s[0]),
    S20=(s[5]&~s[4]&~s[3]&~s[2]&~s[1]&~s[0]),
    S21=(s[5]&~s[4]&~s[3]&~s[2]&~s[1]&s[0]);
endmodule

module s1case(
    input [2:0] s1,
     output [3:0] RegSel
);
    reg [3:0] RegSelx; 
    always@(*)begin
        case (s1)
        3'b000:
            RegSelx <= 3'b011;
        3'b001:
            RegSelx <= 3'b011;
        3'b010:
            RegSelx <= 3'b110;
        3'b011:
            RegSelx <= 3'b101;
        3'b100:
            RegSelx <= 4'b0111;
        3'b101:
            RegSelx <= 4'b1011;
        3'b110:
            RegSelx <= 4'b1101;
        3'b111:
            RegSelx <= 4'b1110;
    endcase
    end
    assign RegSel = RegSelx;

endmodule

module s2case (
    input [2:0] s2,
    output [3:0] RegSel
);
    reg [3:0] RegSelx; 
    always@(*)begin
        case (s2)
        3'b000: 
            RegSelx <= 3'b011;
        3'b001:
            RegSelx <= 3'b011;
        3'b010:
            RegSelx <= 3'b110;
        3'b011:
            RegSelx <= 3'b101;
        3'b100:
            RegSelx <= 4'b0111;
        3'b101:
            RegSelx <= 4'b1011;
        3'b110:
            RegSelx <= 4'b1101;
        3'b111:
            RegSelx <= 4'b1110;
    endcase
    end
    assign RegSel = RegSelx;
endmodule

module dregcase (
    input [2:0] dreg,
    output [3:0] RegSel
);
    reg [3:0] RegSelx; 
    always@(*)begin
        case (dreg)
            3'b000:
                RegSelx <= 3'b011;
            3'b001:
                RegSelx <= 3'b011;
            3'b010:
                RegSelx <= 3'b110;
            3'b011:
                RegSelx <= 3'b101;
            3'b100:
                RegSelx <= 4'b0111;
            3'b101:
                RegSelx <= 4'b1011;
            3'b110:
                RegSelx <= 4'b1101;
            3'b111:
                RegSelx <= 4'b1110;
        endcase
    end
    assign RegSel = RegSelx;
endmodule

module rselcase (
    input [1:0] rsel,
    output [3:0] RegSel
);
    reg [3:0] RegSelx;
    always @ (*) begin
        case (rsel) 
            2'b00:
                RegSelx <= 4'b0111;
            2'b01:
                RegSelx <= 4'b1011;
            2'b10:
                RegSelx <= 4'b1101;
            2'b11:
                RegSelx <= 4'b1110;
        endcase
    end
    assign RegSel = RegSelx;
endmodule


module ControlUnit(
    input T0,
    input T1,
    input T2,
    input T3,
    input T4,
    input T5,
    input T6,
    input T7,
    
    input BRA,
    input BNE,
    input BEQ,
    input POP,
    input PSH,
    input INC,
    input DEC,
    input LSL,
    input LSR,
    input ASR,
    input CSL,
    input CSR,
    input AND,
    input ORR,
    input NOT,
    input XOR,
    input NAND, // X
    input MOVH, // XX
    input LDR,
    input STR,
    input MOVL,
    input ADD,
    input ADC,
    input SUB,
    input MOVS,
    input ADDS,
    input SUBS, //X
    input ANDS, //X
    input ORRS,
    input XORS,
    input BX,
    input BL,
    input LDRIM,
    input STRIM,

    input [1:0] RSEL,
    input [2:0] DSTREG,
    input [2:0] SREG1,
    input [2:0] SREG2,
    input S,

    input Z,
    input C,
    input N,
    input O,  

    output reg [2:0] RF_OutASel,
    output reg [2:0] RF_OutBSel,
    output reg [2:0] RF_FunSel,

    output reg [3:0] RF_RegSel,
    output reg [3:0] RF_ScrSel,

    output reg [4:0] ALU_FunSel,
    
    output reg  ALU_WF,
    
    output reg [1:0] ARF_OutCSel,
    output reg [1:0] ARF_OutDSel,

    output reg [2:0] ARF_FunSel,
    output reg [2:0] ARF_RegSel,

    output reg  IR_LH,
    output reg  IR_Write,
    output reg  Mem_WR,
    output reg  Mem_CS,


    output reg [1:0] MuxASel,
    output reg [1:0] MuxBSel,

    output reg  MuxCSel,
    output reg SC_reset
    );
    wire [3:0] SourceR1;
    wire [3:0] SourceR2;
    wire [3:0] DestinationDR;
    wire [3:0] RxSel;
 
    s1case s1case(.s1(SREG1), .RegSel(SourceR1));
    s2case s2case(.s2(SREG2), .RegSel(SourceR2));
    dregcase dregcase1(.dreg(DSTREG), .RegSel(DestinationDR));
    rselcase rselcase1(.rsel(RSEL), .RegSel(RxSel));


 
    always@(*)begin
    
        if(T7)begin 
          ARF_RegSel <= 3'b111;
          RF_RegSel <= 4'b1111;
          ARF_FunSel <= 3'b011;
          RF_FunSel <= 3'b011;
          IR_Write <= 1'b0;
          Mem_CS <= 1'b1; 
          _ALUSystem.ARF.PC.Q = 16'b0;
          _ALUSystem.ARF.AR.Q = 16'b0;
          _ALUSystem.ARF.SP.Q = 16'b0;
          _ALUSystem.RF.R1.Q = 16'b0;
          _ALUSystem.RF.R2.Q = 16'b0;
          _ALUSystem.RF.R3.Q = 16'b0;
          _ALUSystem.RF.R4.Q = 16'b0;
          _ALUSystem.RF.S1.Q = 16'b0;
          _ALUSystem.RF.S2.Q = 16'b0;
          _ALUSystem.RF.S3.Q = 16'b0;
          _ALUSystem.RF.S4.Q = 16'b0;
          _ALUSystem.ALU.ALUOut = 16'b0;
          
                   
        end
   
         if(T0)begin
            SC_reset = 1'b0; 
            RF_RegSel <= 4'b1111; 
            ARF_RegSel <= 3'b011;
            ARF_FunSel <= 3'b001;
            ARF_OutDSel <= 2'b01;
            Mem_WR <= 1'b0;
            Mem_CS <= 1'b0;
            IR_Write <= 1'b1;
            IR_LH <= 1'b0;
        end
        
        else if(T1)begin 
            SC_reset = 1'b0; 
            RF_RegSel <= 4'b1111; 
            ARF_RegSel <= 3'b011;
            ARF_FunSel <= 3'b001;
            ARF_OutDSel <= 2'b01;
            Mem_WR <= 1'b0;
            Mem_CS <= 1'b0;
            IR_Write <= 1'b1;
            IR_LH <= 1'b1;     
        end


        //////////////// BRA & BNE & BEQ ////////////////

        if((BRA&T2)|(BNE&T2&~Z)|(BEQ&T2&Z)) begin 
            SC_reset <= 1'b0;
            ARF_OutCSel <= 2'b00;
            MuxASel <= 2'b01;
            RF_FunSel <= 3'b010;
            RF_ScrSel <= 4'b0111;
            ARF_RegSel <= 3'b111;
        end

        if((BRA&T3)|(BNE&T3&~Z)|(BEQ&T3&Z)) begin
            SC_reset <= 1'b0;
            MuxASel <= 2'b11;
            RF_ScrSel <= 4'b1011; 
            RF_FunSel <= 3'b111;
            ARF_RegSel <= 3'b111;

        end

        if((BRA&T4)|(BNE&T4&~Z)|(BEQ&T4&Z)) begin
            SC_reset <= 1'b0;
            RF_OutASel <= 3'b100;
            RF_OutBSel <= 3'b101;
            RF_RegSel <= 4'b0000;
            ALU_FunSel <= 5'b10100;
            ALU_WF <= 0;
        end
    
        if((BRA&T5)|(BNE&T5&~Z)|(BEQ&T5&Z)) begin
            SC_reset <= 1'b1;
            MuxBSel <= 2'b00;
            ARF_RegSel <= 3'b011;
            ARF_FunSel <= 3'b010;
        end


        //////////////// POP ////////////////

        if((POP&T2)) begin
            SC_reset <= 1'b0;
            ARF_OutDSel <= 2'b11;
            ARF_RegSel <= 3'b110;
            ARF_FunSel <= 3'b001;

            Mem_WR <= 1'b0;
            Mem_CS <= 1'b0;

            MuxASel <= 2'b10;
            RF_RegSel <= RxSel;
            RF_FunSel <= 3'b101;
        end

        if((POP&T3)) begin
            SC_reset <= 1'b1;
            ARF_OutDSel <= 2'b11;

            Mem_WR <= 1'b0;
            Mem_CS <= 1'b0;

            MuxASel <= 2'b10;
            RF_RegSel <= RxSel;
            RF_FunSel <= 3'b110;
        end

        //////////////// PSH ////////////////

        if((PSH&T2)) begin
            SC_reset <= 1'b0;
            RF_OutASel <= RSEL[1:0];
            ALU_FunSel <= 5'b10000;
            ALU_WF <= 0;
        end

        if (PSH&T3) begin
            MuxCSel <= 1'b1;
            ARF_OutDSel <= 2'b11;
            Mem_CS <= 1'b0;
            Mem_WR <= 1'b1;
            ARF_FunSel <= 3'b000;
            ARF_RegSel <= 3'b110;
        end

        if((PSH&T4)) begin
            SC_reset <= 1'b1;
            MuxCSel <= 1'b0;
            ARF_OutDSel <= 2'b11;
            Mem_CS <= 1'b0;
            Mem_WR <= 1'b1;
        end
        
    
        //////////////// INC & DEC ////////////////

        if ((INC | DEC) & T2) begin
            if (DSTREG== SREG1) begin
                SC_reset = 1'b1;
                if(DSTREG[2]==1'b1) begin
                    RF_RegSel <= SourceR1;
                    if (INC) begin
                        RF_FunSel <= 3'b001;
                    end 
                    else begin
                        RF_FunSel <= 3'b000;
                    end
                end

                else begin
                    ARF_RegSel <= SourceR1;
                    if (INC) begin
                        ARF_FunSel <= 3'b001;
                    end 
                    else begin
                        ARF_FunSel <= 3'b000;
                    end
                end 
            end

            else begin
                SC_reset = 1'b0;
                if (DSTREG[2]== 1'b1) begin
                    if (SREG1[2]==1'b1) begin
                        RF_OutASel <= SREG1[1:0];
                        ALU_FunSel <= 5'b10000;
                        ALU_WF <= S;
                        ALU_WF <= S;
                    end
                    else begin
                        ARF_OutCSel <= SREG1[1:0];
                        MuxASel <= 2'b01;
                        RF_FunSel <= 3'b010;
                        RF_RegSel <= DestinationDR;
                    end

                end 

                else begin
                    if (SREG1[2]==1'b1) begin
                        RF_OutASel <= SREG1[1:0];
                        ALU_FunSel <= 5'b10000;
                        ALU_WF <= S;
                    end
                    else begin
                        ARF_OutCSel <= SREG1[1:0];
                        MuxBSel <= 2'b01;
                        RF_FunSel <= 3'b010;
                        RF_ScrSel <= 4'b0111;
                    end

                end
            end
        end


        if ((INC | DEC) & T3) begin
            if (DSTREG[2]==1'b1) begin
                if (SREG1[2]==1'b1) begin
                    SC_reset = 1'b0;
                    MuxASel <= 2'b00;
                    RF_FunSel <= 3'b010;
                    RF_RegSel <= DestinationDR;
                end

                else begin
                    SC_reset = 1'b1;
                    if(INC)begin
                        RF_FunSel <= 3'b001;
                    end
                    if(DEC)begin
                        RF_FunSel <= 3'b000;
                    end
                    RF_RegSel <= DestinationDR;
                end
                
            end

            else begin
                if (SREG1[2]==1'b1) begin
                    SC_reset = 1'b0;
                    MuxBSel <= 2'b00;
                    ARF_FunSel <= 3'b010;
                    ARF_RegSel <= DestinationDR;
                end
                else begin
                    SC_reset = 1'b0;
                    RF_OutASel <= 3'b100;
                    ALU_FunSel <= 5'b10000;
                    ALU_WF <= S;
                end 

            end

        end

        if ((INC | DEC) & T4) begin
            if (DSTREG[2]==1'b1) begin
                if (SREG1[2]==1'b1) begin
                    SC_reset = 1'b1;
                    if(INC)begin
                        RF_FunSel <= 3'b001;
                    end
                    if(DEC)begin
                        RF_FunSel <= 3'b000;
                    end
                    RF_RegSel <= DestinationDR;
                end
                
            end

            else begin
                if (SREG1[2]==1'b1) begin
                    SC_reset = 1'b1;
                    if(INC)begin
                        ARF_FunSel <= 3'b001;
                    end
                    if(DEC)begin
                        ARF_FunSel <= 3'b000;
                    end
                    ARF_RegSel <= DestinationDR;
                end
                else begin
                    SC_reset = 1'b0;
                    MuxBSel <= 2'b00;
                    ARF_FunSel <= 3'b010;
                    ARF_RegSel <= DestinationDR;
                end
            end

        end

        if ((INC | DEC) & T5) begin
            SC_reset = 1'b1;
            ARF_RegSel <= DestinationDR;
            if(INC) begin
                ARF_FunSel <= 3'b001;
            end
            else begin
                ARF_FunSel <= 3'b000;
            end
        end


        //////////////// LSL & LSR & ASR & CSL & CSR & NOT & MOVS ////////////////

        if ((LSL| LSR  | ASR | CSL | CSR | NOT | MOVS) &T2) begin
            SC_reset <= 1'b0;
            if (SREG1[2] == 1'b1) begin
                RF_OutASel <= SREG1[1:0];
                ALU_WF <= S;
                    
                if (LSL) begin
                    ALU_FunSel <= 5'b11011;
                end
                else if (LSR) begin
                    ALU_FunSel <= 5'b11100;
                end
                else if (ASR) begin
                    ALU_FunSel <= 5'b11101;
                end
                else if (CSL) begin
                    ALU_FunSel <= 5'b11110;
                end
                else if (CSR) begin
                    ALU_FunSel <= 5'b11111;
                end
                else if (NOT) begin
                    ALU_FunSel <= 5'b10010;
                end
                else if (MOVS) begin
                    ALU_FunSel <= 5'b10000;
                end
            end

            else begin
                ARF_OutCSel <= SREG1[1:0];
                MuxASel <= 2'b01;
                RF_FunSel <= 3'b010;
                RF_ScrSel<= 4'b0111;
            end
        end
            
        if ( (LSL| LSR | ASR | CSL | CSR | NOT |MOVS) & T3) begin 
            if (SREG1[2]==1'b1) begin
                if (DSTREG[2]==1'b1) begin
                    SC_reset <= 1'b1;
                    MuxASel <= 2'b00;
                    RF_FunSel <= 3'b010;
                    RF_RegSel <= DestinationDR;
                end
                else begin
                    SC_reset <= 1'b1;
                    MuxBSel <= 2'b00;
                    ARF_FunSel <= 3'b010;
                    ARF_RegSel <= DestinationDR;    
                end
            end
            else begin
                RF_OutASel <= 3'b100;
                ALU_WF <= S;
                SC_reset <= 1'b0;
                if (LSL) begin
                    ALU_FunSel <= 5'b11011;
                end
                else if (LSR) begin
                    ALU_FunSel <= 5'b11100;
                end
                else if (ASR) begin
                    ALU_FunSel <= 5'b11101;
                end
                else if (CSL) begin
                    ALU_FunSel <= 5'b11110;
                end
                else if (CSR) begin
                    ALU_FunSel <= 5'b11111;
                end
                else if (NOT) begin
                    ALU_FunSel <= 5'b10010;
                end
                else if (MOVS) begin
                    ALU_FunSel <= 5'b10000;
                end 
            end            
        end
            
        if( (LSL| LSR | ASR | CSL | CSR | NOT |MOVS) & T4) begin 
            SC_reset <= 1'b1;
            if (DSTREG[2]==1'b1) begin
                MuxASel <= 2'b00;
                RF_FunSel <= 3'b010;
                RF_RegSel <= DestinationDR;
            end
            else begin
                MuxBSel <= 2'b00;
                ARF_FunSel <= 3'b010;
                ARF_RegSel <= DestinationDR;    
                
            end
        end

        
//////////////// AND & OR & XOR & NAND & ADD & ADC & SUB & ADDS & SUBS & ANDS &O ORRS & XORS ////////////////

        if ((AND | ORR | XOR | NAND |ADD | ADC | SUB | ADDS | SUBS | ANDS | ORRS | XORS ) &T2) begin
            ALU_WF <= S;
            SC_reset <= 1'b0;
            if (SREG1[2] == SREG2[2]) begin
                if (SREG1[2]==1'b1) begin
                    RF_OutASel <= SREG1[1:0];
                    RF_OutBSel <= SREG2[1:0];
                    if (AND | ANDS) begin
                        ALU_FunSel <= 5'b10111;
                    end
                    if (ORR | ORRS) begin
                        ALU_FunSel <= 5'b11000;
                    end
                    if (XOR | XORS) begin
                        ALU_FunSel <= 5'b11001;
                    end
                    if (NAND) begin
                        ALU_FunSel <= 5'b11010;
                    end
                    if (ADD | ADDS) begin
                        ALU_FunSel <= 5'b10100;
                    end
                    if (ADC) begin
                        ALU_FunSel <= 5'b10101;
                    end
                    if (SUB | SUBS ) begin
                        ALU_FunSel <= 5'b10110;
                    end
                end
                else begin
                    ARF_OutCSel <= SREG1[1:0];
                    MuxASel <= 2'b01;
                    RF_FunSel <= 3'b010;
                    RF_ScrSel <= 4'b0111; 
                end
            end
            
            else begin
                if (SREG1[2] == 1'b1) begin
                    ARF_OutCSel <= SREG2[1:0];
                    MuxASel <= 2'b01;
                    RF_FunSel <= 3'b010;
                    RF_ScrSel <= 4'b0111; // S1
                    
                end
                else begin
                    ARF_OutCSel <= SREG1[1:0];
                    MuxASel <= 2'b01;
                    RF_FunSel <= 3'b010;
                    RF_ScrSel <= 4'b0111;  // S1                    
                end
            end 
        end
                        

        if ((AND | ORR | XOR | NAND |ADD | ADC | SUB | ADDS | SUBS | ANDS | ORRS | XORS) & T3 ) begin
        ALU_WF <= S;
        SC_reset <= 1'b0;

        if (SREG1[2] == SREG2[2]) begin
                if (SREG1[2]==1'b1) begin
                    if (DSTREG[2]==1'b1) begin
                        SC_reset <= 1'b1;
                        MuxASel <= 2'b00;
                        RF_FunSel <= 3'b010;
                        RF_RegSel <= DestinationDR;
                    end
                    else begin
                        MuxBSel <= 2'b01;
                        ARF_FunSel <= 3'b010;
                        ARF_RegSel <= DestinationDR;
                        SC_reset <= 1'b1;
                    end
                end
                else begin
                    ARF_OutCSel <= SREG2[1:0];
                    MuxASel <= 2'b01;
                    RF_FunSel <= 3'b010;
                    RF_ScrSel <= 4'b1011; // S2
                end
        end

        
        else begin
            if (SREG1[2] == 1'b1) begin
                    SC_reset <= 1'b0;
                    RF_OutASel <= SREG1[1:0];
                    RF_OutBSel <= 3'b100;
                    ALU_WF <= S;
                    if (AND | ANDS) begin
                    ALU_FunSel <= 5'b10111;
                    end
                    if (ORR | ORRS) begin
                        ALU_FunSel <= 5'b11000;
                    end
                    if (XOR | XORS) begin
                        ALU_FunSel <= 5'b11001;
                    end
                    if (NAND) begin
                        ALU_FunSel <= 5'b11010;
                    end
                    if (ADD | ADDS) begin
                        ALU_FunSel <= 5'b10100;
                    end
                    if (ADC) begin
                        ALU_FunSel <= 5'b10101;
                    end
                    if (SUB | SUBS ) begin
                        ALU_FunSel <= 5'b10110;
                    end
            end

            else begin
                    SC_reset <= 1'b0;
                    RF_OutASel <= SREG2[1:0];
                    RF_OutBSel <= 3'b100;
                    if (AND | ANDS) begin
                    ALU_FunSel <= 5'b10111;
                    end
                    if (ORR | ORRS) begin
                        ALU_FunSel <= 5'b11000;
                    end
                    if (XOR | XORS) begin
                        ALU_FunSel <= 5'b11001;
                    end
                    if (NAND) begin
                        ALU_FunSel <= 5'b11010;
                    end
                    if (ADD | ADDS) begin
                        ALU_FunSel <= 5'b10100;
                    end
                    if (ADC) begin
                        ALU_FunSel <= 5'b10101;
                    end
                    if (SUB | SUBS ) begin
                        ALU_FunSel <= 5'b10110;
                    end

            end
        end 
        end

        if ((AND | ORR | XOR | NAND |ADD | ADC | SUB | ADDS | SUBS | ANDS | ORRS | XORS) & T4 ) begin
            if (SREG1[2] == SREG2[2]) begin
                SC_reset <= 1'b0;
                RF_OutASel <= 3'b100;
                RF_OutBSel <= 3'b101;

                ALU_WF <= S;
                if (AND | ANDS) begin
                ALU_FunSel <= 5'b10111;
                end
                if (ORR | ORRS) begin
                    ALU_FunSel <= 5'b11000;
                end
                if (XOR | XORS) begin
                    ALU_FunSel <= 5'b11001;
                end
                if (NAND) begin
                    ALU_FunSel <= 5'b11010;
                end
                if (ADD | ADDS) begin
                    ALU_FunSel <= 5'b10100;
                end
                if (ADC) begin
                    ALU_FunSel <= 5'b10101;
                end
                if (SUB | SUBS ) begin
                    ALU_FunSel <= 5'b10110;
                end        
            end

            else begin
                SC_reset <= 1'b1;
                if (DSTREG[2]==1'b1) begin
                    MuxASel <= 2'b00;
                    RF_FunSel <= 3'b010;
                    RF_RegSel <= DestinationDR;
                end
                else begin
                    MuxBSel <= 2'b01;
                    ARF_FunSel <= 3'b010;
                    ARF_RegSel <= DestinationDR;
                end
            end
        end


        if ((AND | ORR | XOR | NAND |ADD | ADC | SUB | ADDS | SUBS | ANDS | ORRS | XORS) & T5) begin
            SC_reset <= 1'b1;
            if (DSTREG[2]==1'b1) begin
                MuxASel <= 2'b00;
                RF_FunSel <= 3'b010;
                RF_RegSel <= DestinationDR;
            end
            else begin
                MuxBSel <= 2'b01;
                ARF_FunSel <= 3'b010;
                ARF_RegSel <= DestinationDR;
            end

        end

        //////////////// MOVH & MOVL ////////////////

        if ((MOVH|MOVL) &T2) begin
            if (MOVH) begin
                MuxASel <= 2'b11;
                RF_FunSel <= 3'b110;
                RF_RegSel <= RxSel;
            end

            else begin
                MuxASel <= 2'b11;
                RF_FunSel <= 3'b101;
                RF_RegSel <= RxSel;           
            end

        end

        //////////////// LDR ////////////////

        if ((LDR) & T2) begin
            SC_reset <= 1'b0;


            Mem_CS <= 1'b0;
            Mem_WR <= 1'b0;

            MuxASel <= 2'b10;
            RF_RegSel <= RxSel;
            RF_FunSel <= 3'b101; 

            ARF_RegSel <= 3'b101;
            ARF_FunSel <= 3'b001;
            ARF_OutDSel <= 2'b10;

        end

        if ((LDR) & T3) begin
            ARF_OutDSel <= 2'b10;
            Mem_CS <= 1'b0;
            Mem_WR <= 1'b0;
            MuxASel <= 2'b10;
            RF_RegSel <= RxSel;
            RF_FunSel <= 3'b110;
            SC_reset <= 1'b1;
        end

        //////////////// STR ////////////////

        if ((STR) & T2) begin
            SC_reset <= 1'b0;
            RF_OutASel <= RSEL[1:0];
            ALU_FunSel <= 5'b10000;
            ALU_WF <= 0;
            MuxCSel <= 1'b0;
            ARF_OutDSel <= 2'b10;
            Mem_CS <= 1'b0;
            Mem_WR <= 1'b1;
            ARF_RegSel <= 3'b101;
            ARF_FunSel <= 3'b001;
        end

        if ((STR) & T3) begin
            SC_reset <= 1'b1;
            RF_OutASel <= RSEL[1:0];
            ALU_FunSel <= 5'b10000;
            ALU_WF <= 0;
            MuxCSel <= 1'b1;
            ARF_OutDSel <= 2'b10;
            Mem_CS <= 1'b0;
            Mem_WR <= 1'b1;
        end
        
        //////////////// BL ////////////////

         if (BL & T2) begin
            SC_reset <= 1'b0;
            ARF_OutDSel <= 2'b11;
            Mem_CS <= 1'b0;
            Mem_WR <= 1'b0;
            MuxBSel <= 2'b10;   
            ARF_RegSel <= 3'b011;
            ARF_FunSel <= 3'b101;
        end

        if (BL & T3) begin
            SC_reset <= 1'b0;
            ARF_RegSel <= 3'b110;
            ARF_FunSel <= 3'b001;
        end

        if ( BL & T4) begin
            SC_reset <= 1'b1;
            Mem_CS <= 1'b0;
            Mem_WR <= 1'b0;
            MuxBSel <= 2'b10;
            ARF_RegSel <= 3'b011;
            ARF_FunSel <= 3'b110;
        end

        //////////////// BX ////////////////

        if (BX & T2) begin 
            SC_reset <= 1'b0;
            ARF_OutCSel <= 2'b00;
            MuxASel <= 2'b01;
            RF_FunSel <= 3'b010;
            RF_ScrSel <= 4'b1101;
        end
    
        if  (BX & T3) begin
            SC_reset <= 1'b0;
            RF_OutASel <= 3'b110;
            ALU_FunSel <= 5'b10000;
            ALU_WF <= 0;
            MuxCSel <= 1'b0;
            ARF_OutDSel <= 2'b11;
            Mem_WR <= 1'b1;
            Mem_CS <= 1'b0;
            ARF_RegSel <= 3'b110;
            ARF_FunSel <= 3'b001;
        end

        if (BX & T4) begin
            SC_reset <= 1'b0;
            RF_OutASel <= 3'b110;
            ALU_FunSel <= 5'b10000;
            ALU_WF <= 0;
            
            MuxCSel <= 1'b1;
            ARF_OutDSel <= 2'b11;
            Mem_WR <= 1'b1;
            Mem_CS <= 1'b0;
        end

        if (BX & T5) begin
            SC_reset <= 1'b1;
            RF_OutASel <= RSEL[1:0];
            ALU_FunSel <= 5'b10000;
            ALU_WF <= 0;
            MuxBSel <= 2'b00;
            ARF_FunSel <= 3'b010;
            ARF_RegSel <= 011; 
        end

        //////////////// LDRIM ////////////////
        
        if (LDRIM & T2) begin
            SC_reset <= 1'b0;
            MuxBSel <= 2'b11;
            ARF_FunSel <= 3'b100;
            ARF_RegSel <= 3'b101;
            ARF_OutDSel <= 2'b10;
            Mem_CS <= 1'b0;
            Mem_WR <= 1'b0;
        end

        if (LDRIM & T3) begin
            SC_reset <= 1'b1;
            MuxASel <= 2'b10;
            RF_FunSel <= 3'b100;
            RF_RegSel <= RxSel;
        end

        //////////////// STRIM ////////////////
       
        if (STRIM & T2) begin
            SC_reset <= 1'b0;
            MuxASel <= 2'b11;
            RF_FunSel <= 3'b100;
            RF_ScrSel <= 3'b0111;
        end

        if (STRIM & T3) begin
            SC_reset <= 1'b0;
            ARF_OutCSel <= 2'b10;
            MuxASel <= 2'b01;
            RF_FunSel <= 3'b100;
            RF_ScrSel <= 3'b011;
        end

        if (STRIM & T4) begin
            SC_reset <= 1'b0;
            ALU_FunSel <= 5'b10100;
            ALU_WF <= 0;
            RF_OutASel <= 3'b100;
            RF_OutBSel <= 3'b101;
            MuxBSel <= 2'b00;
            ARF_FunSel <= 3'b010;
            ARF_RegSel <= 3'b101;
        end

        if (STRIM & T5) begin
            SC_reset <= 1'b0;
            ARF_OutDSel <= 2'b10;
            Mem_CS <= 1'b0;
            Mem_WR <= 1'b1;
            MuxCSel <= 1'b0;
            ARF_FunSel <= 3'b001;
            ARF_RegSel <= 3'b101;
        end
        
        if (STRIM & T6) begin
            SC_reset <= 1'b1;
            MuxCSel <= 1'b1;
            ARF_OutDSel <= 2'b10;
            Mem_CS <= 1'b0;
            Mem_WR <= 1'b1;
        end


    end

endmodule



module CPUSystem(
    input Clock,
    input Reset,
    input [7:0]T
);
    

    
     wire BRA;
     wire BNE;
     wire BEQ;
     wire POP;
     wire PSH;
     wire INC;
     wire DEC;
     wire LSL;
     wire LSR;
     wire ASR;
     wire CSL;
     wire CSR;
     wire AND;   
     wire ORR;
     wire NOT;
     wire XOR;
     wire NAND;
     wire MOVH;
     wire LDR;
     wire STR;
     wire MOVL;
     wire ADD;
     wire ADC;
     wire SUB;
     wire MOVS;
     wire ADDS;
     wire SUBS;
     wire ANDS;
     wire ORRS;
     wire XORS;
     wire BX;
     wire BL;
     wire LDRIM;
     wire STRIM;
     
     wire S0;
     wire S1;
     wire S2;
     wire S3;
     wire S4;
     wire S5;
     wire S6;
     wire S7;
 
     wire [2:0] RF_OutASel;
     wire [2:0] RF_OutBSel;
     wire [2:0] RF_FunSel;
     wire [3:0] RF_RegSel;
     wire [3:0] RF_ScrSel;
     wire [4:0] ALU_FunSel;
     wire  ALU_WF;
     wire [1:0] ARF_OutCSel;
     wire [1:0] ARF_OutDSel;
     wire [2:0] ARF_FunSel;
     wire [2:0] ARF_RegSel;
     wire  IR_LH;
     wire  IR_Write;
     wire Mem_WR;
     wire Mem_CS;
     wire [1:0] MuxASel;
     wire [1:0] MuxBSel;
     wire  MuxCSel;
 

        ControlUnit contrl(S0, S1, S2, S3, S4, S5, S6, S7, BRA, BNE, BEQ, POP, PSH, INC, DEC, LSL, LSR, ASR, CSL, CSR, AND, ORR, NOT, XOR, NAND, MOVH, LDR, STR, MOVL, ADD, ADC, SUB, MOVS, ADDS, SUBS, ANDS, ORRS, XORS, BX, BL, LDRIM, STRIM,
        _ALUSystem.IROut[9:8], _ALUSystem.IROut[8:6], _ALUSystem.IROut[5:3], _ALUSystem.IROut[2:0], _ALUSystem.IROut[9],_ALUSystem.FlagOut[3] , _ALUSystem.FlagOut[2], _ALUSystem.FlagOut[1] , _ALUSystem.FlagOut[0], RF_OutASel, RF_OutBSel, RF_FunSel,RF_RegSel, RF_ScrSel, ALU_FunSel,ALU_WF, ARF_OutCSel, ARF_OutDSel, ARF_FunSel, ARF_RegSel, IR_LH,
        IR_Write, Mem_WR,Mem_CS, MuxASel, MuxBSel, MuxCSel, Reset ); //SC_RESET
    
        ArithmeticLogicUnitSystem _ALUSystem(RF_OutASel, RF_OutBSel, RF_FunSel, RF_RegSel, RF_ScrSel, ALU_FunSel, ALU_WF, ARF_OutCSel, ARF_OutDSel, ARF_FunSel, ARF_RegSel, IR_LH, IR_Write, Mem_WR, Mem_CS, MuxASel, MuxBSel, MuxCSel, Clock);
      
        OPCodeDecoder IR_Dec(_ALUSystem.IROut[15:10], BRA, BNE, BEQ, POP, PSH, INC, DEC, LSL, LSR, ASR, CSL, CSR, AND, ORR,NOT, XOR, NAND, MOVH, LDR, STR, MOVL, ADD, ADC, SUB, MOVS, ADDS, SUBS, ANDS, ORRS, XORS, BX, BL, LDRIM, STRIM);
        SequenceDecoder SEQ_Dec(T, S0, S1, S2, S3, S4, S5, S6, S7);
        SequenceCounter SEQ_Cnt(Clock, Reset, T);
    

endmodule
