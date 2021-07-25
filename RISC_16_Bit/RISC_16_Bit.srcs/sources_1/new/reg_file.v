`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2021 11:35:34
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input [2:0] sel_Ra,
    input [2:0] sel_Rb,
    input [2:0] sel_Rd,
    input [15:0] res_data_D,
    input clk,
    input en,
    input we,
    output reg [15:0] O_dataA,
    output reg [15:0] O_dataB
    );
    
    // Initialize internal registers
    reg [15:0] regs[7:0];// Read as Ac,R1,R2,R3,R4,R5,R6,R7
    
    // Loop variable
        integer count;
    
    // Initialize outputs and registers
        initial begin
            O_dataA = 16'b0;
            O_dataB = 16'b0;
            for(count = 0; count < 8; count = count + 1) begin
                        regs[count] = 16'b0000_0000_0000_0001;
                    end
        end
        
     // On clock positive edge
            always @(posedge clk) begin
                if(en) begin
                    // Check for write enable flag and then assign to register
                    if(we)
                        regs[sel_Rd] = res_data_D;
                        
                    // Assign correct output value to A and B
                    O_dataA <= regs[sel_Ra];
                    O_dataB <= regs[sel_Rb];
                end
            end
endmodule