`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2021 13:21:03
// Design Name: 
// Module Name: ctrl_unit_test
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


module ctrl_unit_test;
reg I_clk, I_reset;
wire O_enfetch, O_endec, O_enrgrd, O_enalu, O_enrgwr, O_enmem;
ctrl_unit DUT(I_clk, I_reset, O_enfetch, O_endec, O_enrgrd, O_enalu, O_enrgwr, O_enmem);
always #5 I_clk=~I_clk;
initial
begin
I_clk=1;I_reset=1;
#10 I_reset=0;
#100 $finish;
end
endmodule
