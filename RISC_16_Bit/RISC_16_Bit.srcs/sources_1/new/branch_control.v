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
    input clk,
    input en,
    input [3:0]aluop,
    input [15:0] I_dataA,
    input [15:0] I_dataB,
    input [7:0] imm_D,
    output reg [7:0]O_pc_in,
    output reg O_load_en
    );
    
    parameter jif_equal_i = 4'b1010, jif_greater_i = 4'b1011, jif_lesser_i = 4'b1100;
    reg O_resJ;
    always @(posedge clk)
    begin
        if(en) 
        begin
        case(aluop)
            jif_equal_i:   O_load_en <= I_dataA==I_dataB ? 1:0 ;      
            jif_greater_i: O_load_en <= I_dataA>I_dataB ? 1:0;
            jif_lesser_i:  O_load_en <= I_dataA<I_dataB ? 1:0;
            endcase
        O_pc_in <= imm_D; 
        end    
    end
    
    
endmodule
