`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2021 18:09:00
// Design Name: 
// Module Name: inst_fetch
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


module inst_fetch(
    input I_clk,
    input [15:0] I_pc,
    output [15:0] O_inst
    );
    
    reg O_inst;
    wire [15:0] r_inst;
    
    program_mem inst_mem1(
         .I_clk(I_clk),
         .I_addr(I_pc),
         .O_data(r_inst)
         );
    
    assign O_inst = r_inst;
    
endmodule
