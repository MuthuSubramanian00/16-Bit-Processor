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

module main_test;
    
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
    wire Dwe;
    // wire shld_branch;
    
    wire en_pc;   
    // wire en_fetch;
    wire en_dec;
    wire en_rgrd;
    wire en_alu;
    wire en_rgwr;
    wire en_bcu;
    wire en_mem;
   
    //wire update;

    reg clk;
    reg reset;
   // reg ram_we = 0;
    //reg [15:0] ram_dataI = 0;
    
    assign en_rgwr = Dwe;
    //assign pc_opcode = (reset) ? 2'b00 : ((shld_branch) ? 2'b10 : ((en_mem) ? 2'b01 : 2'b00));
     
    program_counter main_pc(.I_clk(clk),
                      .I_reset(reset),
                      .I_count_en(en_pc),
                      .I_load_en(load_en),
                      .I_load_val(load_val),
                      .O_pc(pc_out));
                      
    inst_fetch main_fetch(
                          .I_clk(clk),
                          .I_pc(pc_out),
                          .O_inst(instruction));  
                          
    inst_decoder main_dec (
               .I_inst(instruction),
               .clk(clk),
               .en(en_dec),
               .aluop(aluop),
               .imm_dataD(imm),
               .sel_Ra(selA),
               .sel_Rb(selB),
               .sel_Rd(selD),
               .regwe(Dwe));
                  
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
                       .O_enfetch(en_pc),
                       .O_endec(en_dec),
                       .O_enrgrd(en_rgrd),
                       .O_enalu(en_alu),
                       .O_enrgwr(en_rgwr),
                       .O_enbcu(en_bcu),
                       .O_enmem(en_mem)
                       );
                        
    
    
    initial begin 
        clk = 0;
        reset = 1;
        #20 reset = 0;
        #100 $finish;
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