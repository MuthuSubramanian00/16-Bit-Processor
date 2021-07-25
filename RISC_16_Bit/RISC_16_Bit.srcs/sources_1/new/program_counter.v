`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2021 16:45:46
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input I_clk,
    input I_reset,
    input I_count_en,
    input I_load_en,
    input [15:0] I_load_val,
    output reg [15:0] O_pc
    );
    
    reg [15:0] counter = 0;
    
    always@ (posedge I_clk or negedge I_reset)
    begin
        if(!I_reset)
        begin
            counter <= 0;
        end
        else
        begin
            if(I_load_en)
                counter <= I_load_val;
            else if(i_count_en)
                counter <= counter + 4;
        end
    end
    
    assign O_pc = counter;
    
endmodule