`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2021 15:19:02
// Design Name: 
// Module Name: program_mem
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
    output reg [15:0] O_code
    );
    
    reg [15:0] mem[15:0]; // Defining 64 bytes of memory
    
    initial begin
              mem[0] = 16'b0001_0_000_000_001_00;//Ac=Ac-R1
//            mem[1] = 16'b0000_0_000_000_001_00;//Ac=Ac+R1
//            mem[2] = 16'b0010_0_000_000_001_00;//Ac=Ac|R1
//            mem[3] = 16'b0011_0_000_000_001_00;//Ac=Ac&R1
//            mem[4] = 16'b0100_0_000_000_001_00;//Ac=Ac^R1
//            mem[5] = 16'b0101_0_000_000_001_00;//Ac=Ac
//            mem[6] = 16'b0110_0_000_00000100;//Ac=#4H
//            mem[7] = 16'b0111_0_100_000_001_00;//R4[0]=Ac>R1,R4[1]=Ac==R1,R4[2]=Ac<R1
//            mem[8] = 16'b1000_0_000_000_001_00;//Ac=Ac>>R1
//            mem[9] = 16'b1001_0_000_000_001_00;//Ac=Ac<<R1
//            mem[10] = 16'b1010_0_001_00000100;//Jump to 00000100 if R1==Ac
//            mem[11] = 16'b1011_0_001_00000100;//Jump to 00000100 if R1>Ac
//            mem[12] = 16'b1100_0_001_00000100;//Jump to 00000100 if R1<Ac
//            mem[13] = 0;
//            mem[14] = 0;
//            mem[15] = 0;
            
//            O_code = 16'b0000000000000000;  
        end
        
         always @(posedge I_clk) begin
               O_code <= mem[I_addr[15:0]];
           end
endmodule
