`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2024 14:30:04
// Design Name: 
// Module Name: ALU
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


module ArithmeticLogicUnit(
 input Clock,
 input [15:0] A,
 input [15:0] B,
 input [4:0] FunSel,
 input WF,
 output reg [3:0] FlagsOut,
 output reg [15:0] ALUOut
);

// 16 BİT ALU WIRE DESIGN 

reg [16:0] TEMP;

wire [16:0] A_TEMP;
assign A_TEMP = {1'b0, A};

wire [16:0] B_TEMP;
assign B_TEMP = {1'b0, B};

wire [16:0] NOTB_TEMP;
assign NOTB_TEMP = {1'b0, ~B};

// 8 BİT ALU WIRE DESIGN
wire [7:0] A8;
wire [7:0] B8;

assign A8 = A[7:0];
assign B8 = B[7:0];

reg [8:0] TEMP8;

wire [8:0] A_TEMP8;
assign A_TEMP8 = {1'b0, A8};

wire [8:0] B_TEMP8;
assign B_TEMP8 = {1'b0, B8};

wire [8:0] NOTB_TEMP8;
assign NOTB_TEMP8 = {1'b0, ~B8};


always @(*) begin
    if(WF) begin
    case (FunSel)
    // 8 bit ALUOut
        5'b00000: ALUOut <= {{8{A8[7]}}, A8[7:0]};
        5'b00001: ALUOut <= {{8{B8[7]}}, B8[7:0]};
        5'b00010: ALUOut <= {{8{~A8[7]}}, ~A8[7:0]};
        5'b00011: ALUOut <= {{8{~B8[7]}}, ~B8[7:0]};
        5'b00100: begin
         TEMP8 <= A_TEMP8 + B_TEMP8;
         ALUOut <= {{8{TEMP8[7]}}, TEMP8[7:0]};
         end
         
        5'b00101: begin
        TEMP8 <= A_TEMP8 + B_TEMP8 + FlagsOut[2];
        ALUOut <= {{8{TEMP8[7]}}, TEMP8[7:0]};
        end
        
        5'b00110: begin
         TEMP8 <= A_TEMP8 + NOTB_TEMP8 + 1;
         ALUOut <= {{8{TEMP8[7]}}, TEMP8[7:0]};
         end
        
        5'b00111: begin
            TEMP8 <= A8 & B8;
            ALUOut <= {{8{TEMP8[7]}}, TEMP8[7:0]};
        end

        5'b01000: begin
            TEMP8 <= A8 | B8;
            ALUOut <= {{8{TEMP8[7]}}, TEMP8[7:0]};
        end

        5'b01001:begin
            TEMP8 <= A8 ^ B8;
            ALUOut <= {{8{TEMP8[7]}}, TEMP8[7:0]};
        end
        5'b01010: begin
            TEMP8 <= ~(A8 & B8);
            ALUOut <= {{8{TEMP8[7]}}, TEMP8[7:0]};
        end
        
        5'b01011:begin
             TEMP8 <= A8 << 1; //LSLA
                ALUOut <= {{8{TEMP8[7]}}, TEMP8[7:0]};
        end

        5'b01100:begin
             TEMP8 <= A8 >> 1; //LSRA
                ALUOut <= {{8{TEMP8[7]}}, TEMP8[7:0]};
        end

        5'b01101:begin 
            TEMP8 <= A8 >>> 1; //ASRA
            ALUOut <= {{8{TEMP8[7]}}, TEMP8[7:0]};
        end

        5'b01110: begin //CSLA
            TEMP8 <= {A[6:0], A[7]};
            ALUOut <= {{8{TEMP8[7]}}, TEMP8[7:0]};
        end
        
        5'b01111: begin  //CSRA
            TEMP8 <= {A[0], A[7:1]};
            ALUOut <= {{8{TEMP8[7]}}, TEMP8[7:0]};
        end  
    endcase
end
end

always @(posedge Clock) begin
    case (FunSel)
    
    5'b00000: begin // Z,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
        
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
 
    end
    
    5'b00001: begin  // Z,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
            
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
      end
        
    5'b00010: begin  // Z,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
              
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
       
        end
               
    5'b00011: begin  // Z,N 
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
        end
          
    5'b00100: begin // Z,N,C,O
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
                
        if(TEMP8[8]==1) FlagsOut[2]<=1'b1;
        else FlagsOut[2]<=1'b0;
        
        if((A8[7]==0 && B8[7]==0 && ALUOut[7]==1) || (A8[7]==1 && B8[7]==1 && ALUOut[7]==0)) FlagsOut[0]<=1'b1 ;
        else FlagsOut[0]<=1'b0;
        
        end
            
    5'b00101: begin // Z,N,C,O
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
                
        if(TEMP8[8]==1) FlagsOut[2]<=1'b1;
        else FlagsOut[2]<=1'b0;
        
        if((A8[7]==0 && B8[7]==0 && ALUOut[7]==1) || (A8[7]==1 && B8[7]==1 && ALUOut[7]==0)) FlagsOut[0]<=1'b1 ;
        else FlagsOut[0]<=1'b0;
        
        end
              
              
    5'b00110: begin // Z,N,C,O 
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
                
        if(TEMP8[8]==1) FlagsOut[2]<=1'b1;
        else FlagsOut[2]<=1'b0;
        
        if((A8[7]==0 && B8[7]==1 && ALUOut[7]==1) || (A8[7]==1 && B8[7]==0 && ALUOut[7]==0)) FlagsOut[0]<=1'b1 ;
        else FlagsOut[0]<=1'b0;
        
        end
                
    5'b00111: begin // Z,N 
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
        end
    5'b01000: begin // Z,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                       
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
        end
               
    5'b01001: begin // Z,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                       
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
        end    
        
    5'b01010: begin // Z,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                       
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
        end 
    
    5'b01011: begin // Z,C,N
    
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                       
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
        FlagsOut[2] <= A8[7];
    
    end
    
    5'b01100: begin // Z,C,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                          
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
           
        FlagsOut[2] <= A8[0];

       
      end
      
    5'b01101: begin //Z,C
         if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
         else FlagsOut[3] <= 1'b0;
         
        FlagsOut[2] <= A8[0];

         
         end
    
    5'b01110: begin // Z,C,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                          
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
           
        FlagsOut[2]<=A8[7];
       
      end
    
    5'b01111: begin  // Z,C,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                          
        if(ALUOut[7] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
           
        FlagsOut[2]<=A8[0];
       
      end
endcase
end




always @(*) begin
    if(WF) begin
    case (FunSel)
    // 16 bit ALUOut
        5'b10000: ALUOut <= A;
        5'b10001: ALUOut <= B;
        5'b10010: ALUOut <= ~A;
        5'b10011: ALUOut <= ~B;
        5'b10100: begin
         TEMP <= A_TEMP + B_TEMP;
         ALUOut <= TEMP [15:0];
         end
         
        5'b10101: begin
        TEMP <= A_TEMP + B_TEMP + FlagsOut[2];
        ALUOut <= TEMP [15:0];
        end
        
        5'b10110: begin
         TEMP <= A_TEMP + NOTB_TEMP + 1;
         ALUOut <= TEMP [15:0];
         end
        
        5'b10111: ALUOut <= A & B;
        5'b11000: ALUOut <= A | B;
        5'b11001: ALUOut <= A ^ B;
        5'b11010: ALUOut <= ~(A & B);
        
        5'b11011: ALUOut <= A << 1; //LSLA
        5'b11100: ALUOut <= A >> 1; //LSRA
        5'b11101: ALUOut <= A >>> 1; //ASRA
        
        5'b11110: begin //CSLA
            ALUOut <= {A[14:0], A[15]};
        end
        
        5'b11111: begin  //CSRA
            ALUOut <= {A[0], A[15:1]};
        end  
    endcase
end
end

always @(posedge Clock) begin
    case (FunSel)
    
    5'b10000: begin // Z,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
        
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
 
    end
    
    5'b10001: begin  // Z,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
            
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
      end
        
    5'b10010: begin  // Z,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
              
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
       
        end
               
    5'b10011: begin  // Z,N 
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
        end
          
    5'b10100: begin // Z,N,C,O
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
                
        if(TEMP[16]==1) FlagsOut[2]<=1'b1;
        else FlagsOut[2]<=1'b0;
        
        if((A[15]==0 && B[15]==0 && ALUOut[15]==1) || (A[15]==1 && B[15]==1 && ALUOut[15]==0)) FlagsOut[0]<=1'b1 ;
        else FlagsOut[0]<=1'b0;
        
        end
            
    5'b10101: begin // Z,N,C,O
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
                
        if(TEMP[16]==1) FlagsOut[2]<=1'b1;
        else FlagsOut[2]<=1'b0;
        
        if((A[15]==0 && B[15]==0 && ALUOut[15]==1) || (A[15]==1 && B[15]==1 && ALUOut[15]==0)) FlagsOut[0]<=1'b1 ;
        else FlagsOut[0]<=1'b0;
        
        end
              
              
    5'b10110: begin // Z,N,C,O 
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
                
        if(TEMP[16]==1) FlagsOut[2]<=1'b1;
        else FlagsOut[2]<=1'b0;
        
        if((A[15]==0 && B[15]==1 && ALUOut[15]==1) || (A[15]==1 && B[15]==0 && ALUOut[15]==0)) FlagsOut[0]<=1'b1 ;
        else FlagsOut[0]<=1'b0;
        
        end
                
    5'b10111: begin // Z,N 
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
        end
    5'b11000: begin // Z,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                       
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
        end
               
    5'b11001: begin // Z,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                       
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
        end    
        
    5'b11010: begin // Z,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                       
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
        end 
    
    5'b11011: begin // Z,C,N
    
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                       
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
        
        FlagsOut[2] <= A[15];
    
    end
    
    5'b11100: begin // Z,C,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                          
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
           
        FlagsOut[2] <= A[0];

       
      end
      
    5'b11101: begin //Z,C
         if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
         else FlagsOut[3] <= 1'b0;
         
        FlagsOut[2] <= A[0];

         
         end
    
    5'b11110: begin // Z,C,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                          
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
           
        FlagsOut[2]<=A[15];
       
      end
    
    5'b11111: begin  // Z,C,N
        if(ALUOut == 15'b0) FlagsOut[3] <= 1'b1;
        else FlagsOut[3] <= 1'b0;
                          
        if(ALUOut[15] == 1) FlagsOut[1] <= 1'b1;
        else FlagsOut[1] <= 1'b0;
           
        FlagsOut[2]<=A[0];
       
      end
endcase
end


endmodule