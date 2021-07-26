`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2021 10:10:19
// Design Name: 
// Module Name: program_counter_test
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


module program_counter_test;
    
        reg I_clk;
        reg I_reset;
        reg I_count_en;
        reg I_load_en;
        reg [7:0] I_load_val;
        wire [15:0] O_pc;
        
        program_counter uut (
            .I_clk(I_clk),
            .I_reset(I_reset),
            .I_count_en(I_count_en),
            .I_load_en(I_load_en),
            .I_load_val(I_load_val),
            .O_pc(O_pc)
        );
        
        always begin
            #5;
            I_clk = ~I_clk;
        end
        
        initial begin
            I_clk = 1'b1;
            I_reset = 1'b0;
            I_count_en = 1'b0;
            I_load_en = 1'b0;
            I_load_val = 16'b0;
            
            #10
                I_reset = 1'b1;        
                I_count_en = 1'b1;
            #50
                I_load_en = 1'b1;
                I_load_val = 200;
            #10
                I_load_en = 1'b0; 
            #50
            $finish;
        end
       
endmodule
