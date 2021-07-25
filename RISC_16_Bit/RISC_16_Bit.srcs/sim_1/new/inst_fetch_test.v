`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2021 10:18:57
// Design Name: 
// Module Name: inst_fetch_test
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

module inst_fetch_test;
    
    reg I_clk;
    reg [15:0] I_pc;
    wire [15:0] O_inst;
   
    instruction_fetch uut (
        .I_clk(I_clk),
        .I_pc(I_pc),
        .O_inst(O_inst)
    );
    
    always begin
        #5;
        I_clk = ~I_clk;
    end
    
    initial begin
        I_clk = 1'b1;
        
    end

endmodule
