`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2021 15:48:18
// Design Name: 
// Module Name: alu
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


module alu(
   input [3:0] I_aluip,
   input I_clk,
   input I_en,
   input [15:0] I_ins,
   input [15:0] I_dataA,
   input [15:0] I_dataB,
   input [15:0] I_imm_D,
   output [15:0] O_result
    );
    //Temporary registers for results
    reg [15:0] O_resD;
    reg [15:0] O_resJ;
    
    //Instruction definition
    parameter add_i = 4'b0000, sub_i = 4'b0001, bit_or_i = 4'b0010;
    parameter bit_and_i = 4'b0011, bit_xor_i = 4'b0100, bit_not_i = 4'b0101;
    parameter load_i = 4'b0110, rel_i = 4'b0111;
    
    parameter shift_r_i = 4'b1000, shift_l_i = 4'b1001;          
    parameter jif_equal_i = 4'b1010, jif_greater_i = 4'b1011, jif_lesser_i = 4'b1100;
    
    parameter alu = 4'b1010;
                
    always @(posedge I_clk)
    begin
        case(I_aluip)
            add_i: O_resD <= I_dataA + I_dataB;
            sub_i: O_resD <= I_dataA - I_dataB;
        
            bit_or_i:   O_resD <= I_dataA | I_dataB;
            bit_and_i:  O_resD <= I_dataA & I_dataB;
            bit_xor_i:  O_resD <= I_dataA ^ I_dataB;
            bit_not_i:  O_resD <= ~I_dataA ;
        
            load_i: O_resD <= I_imm_D;
            rel_i: begin 
                        O_resD[2] <= I_dataA>I_dataB? 1:0;          
                        O_resD[1] <= I_dataA==I_dataB? 1:0;
                        O_resD[0] <= I_dataA<I_dataB? 1:0;
                    end
            shift_r_i:  O_resD <= I_dataA>>I_dataB ;
            shift_l_i:  O_resD <= I_dataA<<I_dataB ;
        
            jif_equal_i:   O_resJ <= I_dataA==I_dataB ? I_imm_D: I_ins ;      
            jif_greater_i: O_resJ <= I_dataA==I_dataB ? I_imm_D: I_ins ;
            jif_lesser_i:  O_resJ <= I_dataA==I_dataB ? I_imm_D: I_ins ;
            default:  begin
                      O_resD <= 4'b0;
                      O_resJ <= 4'b0;          
                      end
            endcase
    end
    //Assign result based on Jump or ALU instruction
    assign O_result = I_aluip>=alu ? O_resJ:O_resD;
    
    
endmodule
