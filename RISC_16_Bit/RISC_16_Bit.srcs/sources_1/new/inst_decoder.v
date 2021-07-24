`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2021 11:48:48
// Design Name: 
// Module Name: inst_decoder
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


module inst_decoder(
    input [15:0] I_inst,
    input clk,
    input en,
    output reg [3:0] aluop,
    output reg [15:0] imm_dataD,
    output reg [2:0] sel_Ra,
    output reg [2:0] sel_Rb,
    output reg [2:0] sel_Rd,
    output reg regwe
    );
    
    initial begin
            // Initialize all output registers to 0
            aluop = 0;
            imm_dataD = 0;
            sel_Ra = 0;
            sel_Rb = 0;
            sel_Rd = 0;
            regwe = 0;
        end
        
    always @(posedge clk) begin
                if(en) begin
                    // Assign the bits statically according to ISA
                    aluop <= I_inst[15:12];
                    sel_Rd <= I_inst[10:8];
                    sel_Ra <= I_inst[7:5];
                    sel_Rb <= I_inst[4:2];
                    imm_dataD <= I_inst[7:0];
                    
                    case(I_inst[15:12])
                    //disabling we for reg file, for all unused opcodes
                        4'b1101 : regwe <= 0;
                        4'b1110 : regwe <= 0;
                        4'b1111 : regwe <= 0;                        
                    default : regwe <= 1;
                    endcase
                    
                end
            end
endmodule
