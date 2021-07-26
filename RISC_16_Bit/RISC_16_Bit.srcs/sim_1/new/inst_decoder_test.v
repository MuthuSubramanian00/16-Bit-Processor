`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2021 13:01:46
// Design Name: 
// Module Name: inst_decoder_test
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


module inst_decoder_test;
reg [15:0] I_inst;
reg clk,en;
wire [3:0] aluop;
wire [7:0] imm_dataD;
wire [2:0] sel_Ra, sel_Rb, sel_Rd;
wire regwe;
inst_decoder DUT(I_inst,clk, en, aluop, imm_dataD, sel_Ra, sel_Rb,sel_Rd,regwe);
always
#5 clk=~clk;
initial
begin
clk=1;en=0;I_inst=0;
#10 en=1;I_inst=16'b0000_0_010_000_001_00;
#10 en=1;I_inst=16'b0001_0_110_010_101_00;
#10 en=1;I_inst=16'b0010_0_010_000_101_00;
#10 $finish;
end
endmodule
