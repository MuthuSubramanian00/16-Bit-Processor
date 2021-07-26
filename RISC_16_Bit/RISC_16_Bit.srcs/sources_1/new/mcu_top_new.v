`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2021 20:43:36
// Design Name: 
// Module Name: main_test
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

module mcu_top;
      
      wire load_en;
      wire load_val;
      wire [15:0] pc_out;
      
      wire [15:0] instruction;
      
      
      wire [2:0] selA;
      wire [2:0] selB;
      wire [2:0] selD;
      wire [15:0] dataD;
      wire [15:0] dataB;
      wire [15:0] dataA;
      wire [3:0] aluop;
      wire [7:0] imm;
//      wire Dwe;
      // wire shld_branch;
      
//        wire en_pc = Dwe ;   
//        wire en_fetch = 1;
      wire en_dec = 1;
      
      wire en_rgrd;
//      wire count_en = 0;
      wire count_en = en_rgwr;
      
      wire en_alu;
      wire en_rgwr;
      wire en_bcu;

     
      //wire update;
  
      reg clk;
      reg reset;
      
      wire [2:0] state;
         
      program_counter main_pc(.I_clk(clk),
                        .I_reset(reset),
                        .I_count_en(count_en),
                        .I_load_en(load_en),
                        .I_load_val(load_val),
                        .O_pc(pc_out));
                        
      inst_fetch main_fetch(
                            .I_clk(clk),
                            .I_pc(pc_out),
                            .O_inst(instruction));  
                            
      inst_decoder main_dec(
                 .I_inst(instruction),
                 .clk(clk),
                 .en(en_dec),
                 .aluop(aluop),
                 .imm_dataD(imm),
                 .sel_Ra(selA),
                 .sel_Rb(selB),
                 .sel_Rd(selD));
                    
       reg_file main_reg(
                      .sel_Ra(selA),
                      .sel_Rb(selB),
                      .sel_Rd(selD),
                      .res_data_D(dataD),
                      .clk(clk),
                      .en(en_rgrd),
                      .we(en_rgwr),
                      .O_dataA(dataA),
                      .O_dataB(dataB));
                     
      alu main_alu(
                     .I_aluip(aluop),
                     .I_clk(clk),
                     .I_en(en_alu),
                     .I_dataA(dataA),
                     .I_dataB(dataB),
                     .I_imm_D(imm),
                     .O_result(dataD));
                     
      branch_control main_bcu(
                     .clk(clk),
                     .en(en_bcu),
                     .aluop(aluop),
                     .I_dataA(dataA),
                     .I_dataB(dataB),
                     .imm_D(imm),
                     .O_pc_in(load_val),
                     .O_load_en(load_en));

      ctrl_unit main_cu(
                         .I_clk(clk),
                         .I_reset(reset),
                         .O_enrgrd(en_rgrd),
                         .O_enalu(en_alu),
                         .O_enrgwr(en_rgwr),
                         .O_enbcu(en_bcu),
                         .state(state)
                         );
 
    initial begin 
        clk = 0;
        reset = 1;
        #10 reset = 0;
        #400 $finish;
        /* Old testing code
        inst = 16'b1000000011111110; // ldrl r0, #0xFE
        
        #1; reset = 0; // Enable stuff  
        wait(update == 1) inst = 16'b1000100111101101; #15;// ldrh r1, 0xed
        wait(update == 1) inst = 16'b0010001000100000; #15;// or r2, r1, r0
        wait(update == 1) inst = 16'b1000001100000001; #15;// ldrl r3, #0x01
        wait(update == 1) inst = 16'b1000010000000010; #15;// ldrl r4, #0x02 
        wait(update == 1) inst = 16'b0000001101110000; #15;// addu r3, r3, r4
        wait(update == 1) inst = 16'b0010010100001100; #15;// or r5, r0, r3
        */      
    end
    
    always begin
        #5; clk = ~clk;
    end
    
endmodule