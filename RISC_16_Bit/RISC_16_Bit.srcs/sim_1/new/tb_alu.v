`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2021 16:46:05
// Design Name: 
// Module Name: tb_alu
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


module alu_test;
    reg [3:0] aluip; //opcode
    reg clk;
    reg en;
    reg [15:0] I_dataA;
    reg [15:0] I_dataB;
    reg [15:0] I_imm_D;
    wire [15:0] O_result;

    alu UUT( 
       .I_aluip(aluip),
       .I_clk(clk),
       .I_en(en),
       .I_dataA(I_dataA),
       .I_dataB(I_dataB),
       .I_imm_D(I_imm_D),
       .O_result(O_result)
       );
    
    initial begin
    clk = 0;
    en = 0;I_imm_D=0;
    end
    
    always #5 clk=~clk;
    
    always begin
    aluip = 4'b0000;
    I_dataA = 16'b0000_0000_0000_0010;
    I_dataB = 16'b0000_0000_0000_0010;
    #20 aluip = 4'b0000;
    I_dataA = 16'b0000_0000_0000_0011;
    I_dataB = 16'b0000_0000_0000_0010;
    #20 aluip = 4'b0001;
    I_dataA = 16'b0000_0000_0000_0010;
    I_dataB = 16'b0000_0000_0000_0010;   
    #50 $finish;
    end
    
endmodule
