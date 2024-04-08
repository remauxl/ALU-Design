 `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU Computer Engineering Department
// Engineer: Kadir Ozlem
// Project Name: BLG222E Project 1 Simulation
//////////////////////////////////////////////////////////////////////////////////

module ArithmeticLogicUnitSimulation();
    reg[15:0] A, B;
    reg[4:0] FunSel;
    reg WF;
    wire[15:0] ALUOut;
    wire[3:0] FlagsOut;
    integer test_no;
    wire Z, C, N, O;
    CrystalOscillator clk();
    ArithmeticLogicUnit ALU( .A(A), .B(B), .FunSel(FunSel), .WF(WF), 
                            .Clock(clk.clock), .ALUOut(ALUOut), .FlagsOut(FlagsOut));
        
    FileOperation F();
    
    assign {Z,C,N,O} = FlagsOut;
    
    initial begin
        F.SimulationName ="ArithmeticLogicUnit";
        F.InitializeSimulation(0);
        clk.clock = 0;
        
        //Test 1
        test_no = 1;
        A = 16'h1234;
        B = 16'h4321;
        ALU.FlagsOut = 4'b1111;
        FunSel =5'b10100;
        WF =1;
        #5
        F.CheckValues(ALUOut,16'h5555, test_no, "ALUOut");
        F.CheckValues(Z,1, test_no, "Z");
        F.CheckValues(C,1, test_no, "C");
        F.CheckValues(N,1, test_no, "N");
        F.CheckValues(O,1, test_no, "O");
        //Test 2
        test_no = 2;
        clk.Clock();
        
        F.CheckValues(ALUOut,16'h5555, test_no, "ALUOut");
        F.CheckValues(Z,0, test_no, "Z");
        F.CheckValues(C,0, test_no, "C");
        F.CheckValues(N,0, test_no, "N");
        F.CheckValues(O,0, test_no, "O");

        //Test 3
        test_no = 3;
        A = 16'h7777;
        B = 16'h8889;
        ALU.FlagsOut = 4'b0000;
        FunSel =5'b10101;
        WF =1;
        #5
        clk.Clock();
        
        F.CheckValues(ALUOut,16'h0001, test_no, "ALUOut");
        F.CheckValues(Z,1, test_no, "Z");
        F.CheckValues(C,1, test_no, "C");
        F.CheckValues(N,0, test_no, "N");
        F.CheckValues(O,0, test_no, "O");
        
        //Test 4
        test_no = 4;
        A = 16'hf0cd;
        B = 16'h37fe;
        ALU.FlagsOut = 4'b0000;
        FunSel =5'b10110;
        WF =1;
        #5
        clk.Clock();
                
        F.CheckValues(ALUOut,16'hb8cf, test_no, "ALUOut");
        F.CheckValues(Z,0, test_no, "Z");
        F.CheckValues(C,1, test_no, "C");
        F.CheckValues(N,1, test_no, "N");
        F.CheckValues(O,0, test_no, "O");
        
        //Test 5
        test_no = 5;
        A = 16'hf0cd;
        B = 16'h37fe;
        ALU.FlagsOut = 4'b1111;
        FunSel =5'b10101;
        WF =1;
        #5
        clk.Clock();
                
        F.CheckValues(ALUOut,16'h28cc, test_no, "ALUOut");
        F.CheckValues(Z,0, test_no, "Z");
        F.CheckValues(C,1, test_no, "C");
        F.CheckValues(N,0, test_no, "N");
        F.CheckValues(O,0, test_no, "O");
        //Test 6  NOT A
        test_no = 6;
        A = 8'b10110101; //B5
        B = 8'b10110101; //45
        ALU.FlagsOut = 4'b0000;
        FunSel =5'b00010;
        WF = 1;
        #5
        clk.Clock();
    

        F.CheckValues(ALUOut,8'b01001010, test_no, "ALUOut");
        F.CheckValues(Z,0, test_no, "Z");
        F.CheckValues(C,0, test_no, "C");
        F.CheckValues(N,0, test_no, "N");
        F.CheckValues(O,0, test_no, "O");
        
        //Test 7  A+B+C
        test_no = 7;
        A = 8'b10110101; //B5
        B = 8'b10110101; //45
        ALU.FlagsOut = 4'b0000;
        FunSel =5'b00101;
        WF = 1;
        #5
        clk.Clock();

        F.CheckValues(ALUOut,8'b01101011, test_no, "ALUOut");
        F.CheckValues(Z,0, test_no, "Z");
        F.CheckValues(C,1, test_no, "C");
        F.CheckValues(N,0, test_no, "N");
        F.CheckValues(O,1, test_no, "O");

        //Test 8  
        test_no = 8;
        A = 8'b10100101; //B5
        B = 8'b11110101; //45
        ALU.FlagsOut = 4'b0000;
        FunSel =5'b01011;
        WF = 1;
        #5
        clk.Clock();

        F.CheckValues(ALUOut,8'b01001010, test_no, "ALUOut");
        F.CheckValues(Z,0, test_no, "Z");
        F.CheckValues(C,1, test_no, "C");
        F.CheckValues(N,0, test_no, "N");
        F.CheckValues(O,0, test_no, "O");

//Test 9 A-B 8 BIT
        test_no = 9;
        A = 8'b10111101; //B5
        B = 8'b00110101; //45
        ALU.FlagsOut = 4'b0000;
        FunSel =5'b00110;
        WF = 1;
        #5
        clk.Clock();

        F.CheckValues(ALUOut, 16'hff88, test_no, "ALUOut");
        F.CheckValues(Z,0, test_no, "Z");
        F.CheckValues(C,1, test_no, "C");
        F.CheckValues(N,1, test_no, "N");
        F.CheckValues(O,0, test_no, "O");
        //Test 10 A-B 8 BIT
        test_no = 10; // no overflow occurs (-) - (-) = (+) and carry occurs
        A = 8'b1110_0010; 
        B = 8'b1100_1110;
        ALU.FlagsOut = 4'b0000;
        FunSel =5'b00110;
        WF = 1;
        #5
        clk.Clock();

        F.CheckValues(ALUOut, 8'b0001_0100, test_no, "ALUOut");
        F.CheckValues(Z,0, test_no, "Z");
        F.CheckValues(C,1, test_no, "C");
        F.CheckValues(N,0, test_no, "N"); 
        F.CheckValues(O,0, test_no, "O");
        
        //Test 11 A-B 16 BIT
        test_no = 11;
        A = 16'hffbd; //B5
        B = 16'h0035; //45
        ALU.FlagsOut = 4'b0000;
        FunSel =5'b10110;
        WF = 1;
        #5
        clk.Clock();

        F.CheckValues(ALUOut,16'hff88, test_no, "ALUOut");
//        F.CheckValues(ALU.Result8Bit,8'b01001010, test_no, "ALU8Bit");
        F.CheckValues(Z,0, test_no, "Z");
        F.CheckValues(C,1, test_no, "C");
        F.CheckValues(N,1, test_no, "N");
        F.CheckValues(O,0, test_no, "O");
        
        //Test 13 A-B 16 BIT // (+) - (-) = (-), overflow occurs, no carry
        test_no = 13;
        A = 16'h4e20; 
        B = 16'h9e58; 
        ALU.FlagsOut = 4'b0000;
        FunSel =5'b10110;
        WF = 1;
        #5
        clk.Clock();

        F.CheckValues(ALUOut,16'hafc8, test_no, "ALUOut");
//        F.CheckValues(ALU.Result8Bit,8'b01001010, test_no, "ALU8Bit");
        F.CheckValues(Z,0, test_no, "Z");
        F.CheckValues(C,0, test_no, "C");
        F.CheckValues(N,1, test_no, "N");
        F.CheckValues(O,1, test_no, "O");
        
        //Test 12 A-B 8 BIT
        test_no = 12;
        A = 8'b1111_1101; // overflow occurs (-) - (+) = (+), carry occurs
        B = 8'b0111_1111;

        ALU.FlagsOut = 4'b0000;
        FunSel =5'b00110;
        WF = 1;
        #5
        clk.Clock();

        F.CheckValues(ALUOut, 8'b0111_1110, test_no, "ALUOut");
        F.CheckValues(Z,0, test_no, "Z");
        F.CheckValues(C,1, test_no, "C");
        F.CheckValues(N,0, test_no, "N"); 
        F.CheckValues(O,1, test_no, "O");

        
        F.FinishSimulation();
    end
endmodule