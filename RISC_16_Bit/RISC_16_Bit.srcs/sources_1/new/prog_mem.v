`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2021 10:02:47
// Design Name: 
// Module Name: prog_mem
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

module program_mem(
    input I_clk,
    input [15:0] I_addr,
    output reg [15:0] O_data
    );
    
    reg [15:0] mem[15:0]; // Defining 64 bytes of memory
    
    initial begin
            mem[0] = 16'b0000_0_000_000_001_00;//Ac=Ac+R1
            mem[1] = 16'b0001_0_000_000_001_00;//Ac=Ac-R1
            mem[2] = 16'b0010_0_000_000_001_00;//Ac=Ac|R1
            mem[3] = 16'b0011_0_000_000_001_00;//Ac=Ac&R1
            mem[4] = 16'b0100_0_000_000_001_00;//Ac=Ac^R1
            mem[5] = 16'b0101_0_000_000_001_00;//Ac=Ac
            mem[6] = 16'b0101_0_000_00000100;//Ac=#4H
            mem[7] = 0;
            mem[8] = 0;
            mem[9] = 0;
            mem[10] = 0;
            mem[11] = 0;
            mem[12] = 0;
            mem[13] = 0;
            mem[14] = 0;
            mem[15] = 0;
            
            O_data = 16'b0000000000000000;  
        end
        
         always @(posedge I_clk) begin
               O_data <= mem[I_addr[15:0]];
           end
endmodule
