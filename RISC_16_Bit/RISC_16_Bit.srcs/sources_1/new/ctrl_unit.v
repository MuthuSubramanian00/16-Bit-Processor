`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2021 12:06:01
// Design Name: 
// Module Name: ctrl_unit
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


module ctrl_unit(
    input I_clk,
    input I_reset,
//    output O_enfetch,
//    output O_endec,
    output O_enrgrd,
    output O_enalu,
    output O_enrgwr,
    output O_enbcu,
    output reg  [2:0] state
    
    );

    
//    assign O_enfetch = state[0];
//    assign O_endec = state[0];
    assign O_enrgrd = state[0];
    assign O_enalu = state[0];
    assign O_enbcu = state[0];  
    assign O_enrgwr = state[1];
    
    initial begin
        state = 3'b000;
    end
    
    always @(posedge I_clk) begin
        /*if(I_reset) begin
            state <= 3'b000;
        end*/
        //else begin
            case(state)
                3'b000 : state <= 3'b001;
                3'b001 : state <= 3'b010;
                3'b010 : state <= 3'b000;
                default : state <= 3'b000;
            endcase
        //end
    end
endmodule
