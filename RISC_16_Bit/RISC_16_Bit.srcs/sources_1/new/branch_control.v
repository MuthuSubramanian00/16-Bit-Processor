`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2021 14:54:19
// Design Name: 
// Module Name: branch_control
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


module branch_control(
    input clk,input en,input aluop[3:0],input alu_dataO[15:0],
    output pc_in[15:0]
    );
    
    always @(posedge clk)
    begin
    if(en)
    if(aluop==4'b1010 || aluop==4'b1011 || aluop==4'b1100)
    pc_in<=alu_dataO;
    else
    pc_in<=16'bZZZZ_ZZZZ_ZZZZ_ZZZZ;
    end
    
endmodule
