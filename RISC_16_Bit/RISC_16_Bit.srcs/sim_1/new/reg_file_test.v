`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2021 12:19:09
// Design Name: 
// Module Name: reg_file_test
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


module reg_file_test;
reg [2:0] sel_Ra, sel_Rb, sel_Rd;
reg [15:0] imm_dataD;
reg clk, en, we;
wire [15:0] O_dataA, O_dataB;
reg_file DUT(sel_Ra, sel_Rb,sel_Rd,imm_dataD, clk, en, we, O_dataA, O_dataB);
initial
begin
clk=1;sel_Ra=0;sel_Rb=0;sel_Rd=0;imm_dataD=0;en=0;we=0;
#10 en=0;
#10 en=1;we=1;sel_Rd=3'b000;imm_dataD=16;
#10 en=1;we=1;sel_Rd=3'b001;imm_dataD=10;
#10 en=1;we=0;sel_Rd=3'b000;imm_dataD=0;
#10 en=1;sel_Ra=3'b000;sel_Rb=3'b001;
#10 $finish;
end
always
#5 clk=~clk;
endmodule
