`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2021 14:27:01
// Design Name: 
// Module Name: branch_control_test
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


module branch_control_test;

    reg clk,en;
    reg [3:0]aluop;
    reg [15:0] I_dataA,I_dataB;
    reg [7:0] imm_D;
    wire [7:0]O_pc_in;
    wire O_load_en;
    
    branch_control DUT(clk,en,aluop,
        I_dataA,I_dataB,imm_D,
        O_pc_in, O_load_en);
        
        initial
        begin
        en=0;clk=1;imm_D=8'b10101010;
        #10 en=1; aluop=4'b1010; I_dataA=1;I_dataB=0;
        #10 aluop=4'b1011; I_dataA=1;I_dataB=0;
        #10 aluop=4'b1100; I_dataA=1;I_dataB=0;
        #10 $finish;
        end
        
        always #5 clk=~clk;
       
        
endmodule
