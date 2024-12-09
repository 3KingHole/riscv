`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 15:32:00
// Design Name: 
// Module Name: datapath
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

`include "define.vh"
module datapath(
	input 	clk,
    input   rst_n,
    
    input   [31:0]inst,
    
    input   MemtoReg,
    input   ALUSrc,
    input   RegWrite,
    
    input   lui,
    input   U_type,
    input   jal,
    input   jalr,
    input   beq,
    input   bne,
    input   blt,
    input   bge,
    input   bltu,
    input   bgeu,
    
    input   [3:0]ALUctl,
    
    // control signals
    input  [2:0]RW_type,
    input   MemRead,
    input   MemWrite,
    output  MemRead_ex_mem_o,
    output  MemWrite_ex_mem_o,
    output [2:0] RW_type_ex_mem_o,
    //
    input [31:0]Rd_mem_data,
    output  [7:0]rom_addr,
    output [31:0]Wr_mem_data,
    output [31:0]ALU_result,
    output [6:0]opcode,
    output [2:0]func3,
    output func7

    );
    
/*    // registers
    wire [4:0]Rs1;
    wire [4:0]Rs2;
    wire [4:0]Rd;
    wire [31:0]imme;
    wire [31:0] Wr_reg_data;
    wire [31:0] Rd_data1;
    wire [31:0] Rd_data2;
    
    wire zero;

    wire [31:0]pc_order;
    wire [31:0]pc_jump;
    
    wire [31:0]pc_new;
    wire [31:0]pc_out;
    
    wire jump_flag;

    wire [31:0]ALU_DB;
    wire [31:0]WB_data;
    
    wire reg_sel;
    wire [31:0]Wr_reg_data1;
    wire [31:0]Wr_reg_data2;
    wire [31:0]pc_jump_order;
    wire [31:0]pc_jalr;
    
    assign reg_sel = jal | jalr ;
    assign Wr_mem_data = Rd_data2;
    assign rom_addr = pc_out[9:2];
    assign pc_jalr = {ALU_result[31:1],1'b0};
    
    pc pc_inst (
    .clk(clk), 
    .rst_n(rst_n), 
    .pc_new(pc_new), 
    .pc_out(pc_out)
    );
    
    decode decode_inst (
    .inst(inst), 
    .opcode(opcode), 
    .func3(func3), 
    .func7(func7), 
    .Rs1(Rs1), 
    .Rs2(Rs2), 
    .Rd(Rd), 
    .imme(imme)
    );
    
    registers registers_inst (
    .clk(clk), 
    .w_en(RegWrite), 
    .rs1(Rs1), 
    .rs2(Rs2), 
    .reg_addr(Rd), 
    .wr_data(Wr_reg_data), 
    .rd_data1(Rd_data1),  // registers output
    .rd_data2(Rd_data2)
    );
    
    alu alu_inst (
    .ALU_DA(Rd_data1), 
    .ALU_DB(ALU_DB),      // from ALU_data_mux
    .ALU_CTL(ALUctl),     // module input
    .ALU_ZERO(zero), 
    .ALU_OverFlow(), 
    .ALU_DC(ALU_result)
    );
    
    branch_judge branch_judge_inst (
    .beq(beq), 
    .bne(bne), 
    .blt(blt), 
    .bge(bge), 
    .bltu(bltu), 
    .bgeu(bgeu), 
    .jal(jal), 
    .jalr(jalr), 
    .zero(zero), 
    .ALU_result(ALU_result), 
    .jump_flag(jump_flag)  // branch output
    );
    
//pc+4    
    cla_adder32 pc_adder_4 (
    .A(pc_out), 
    .B(32'd4), 
    .cin(1'd0), 
    .result(pc_order), 
    .cout()
    );
    
//pc+imme
    cla_adder32 pc_adder_imme (
    .A(pc_out), 
    .B(imme), 
    .cin(1'd0), 
    .result(pc_jump), 
    .cout()
    );
    
/////mux//////
//pc_sel
    mux pc_mux (
    .data1(pc_jump), 
    .data2(pc_order), 
    .sel(jump_flag), 
    .dout(pc_jump_order)
    );
//pc_jalr
    mux pc_jalr_mux (
    .data1(pc_jalr), 
    .data2(pc_jump_order), // from pc_mux
    .sel(jalr), 
    .dout(pc_new)
    );
   
//ALUdata_sel    
    mux ALU_data_mux (
    .data1(imme), 
    .data2(Rd_data2), 
    .sel(ALUSrc), 
    .dout(ALU_DB)
    );
    
//ALU_result or datamem    
    mux WB_data_mux (
    .data1(Rd_mem_data), 
    .data2(ALU_result), 
    .sel(MemtoReg), 
    .dout(WB_data)
    );
        
//Wr_data_sel
    mux jalr_mux (
    .data1(pc_order), 
    .data2(WB_data), 
    .sel(reg_sel), 
    .dout(Wr_reg_data2)
    );
    
    mux lui_mux (
    .data1(imme), 
    .data2(pc_jump), 
    .sel(lui), 
    .dout(Wr_reg_data1)
    );
    
    mux Wr_reg_mux (
    .data1(Wr_reg_data1), 
    .data2(Wr_reg_data2), 
    .sel(U_type), 
    .dout(Wr_reg_data)
    );*/
    
    
    // if 
    wire [31:0]pc_if_i;
    wire [31:0]pc_if_o;
    // if - id
    wire [31:0]pc_if_id_o;
    wire [31:0]inst_if_id_o;
    // id
    wire [31:0]imme_id_o;
    wire [31:0]Rd_data1_id_o;
    wire [31:0]Rd_data2_id_o;
    wire [4:0]Rd_id_o;
    // id - ex
    wire [31:0]pc_id_ex_o;
    wire [31:0]imme_id_ex_o;
    wire [31:0]Rd_data1_id_ex_o;
    wire [31:0]Rd_data2_id_ex_o;
    wire [4:0]Rd_id_ex_o;
    
    wire ALUSrc_id_ex_o;
    wire [3:0]ALUctl_id_ex_o;
    wire beq_id_ex_o;
    wire bne_id_ex_o;
    wire blt_id_ex_o;
    wire bge_id_ex_o;
    wire bltu_id_ex_o;
    wire bgeu_id_ex_o;
    wire jal_id_ex_o;
    wire jalr_id_ex_o;
    wire MemRead_id_ex_o;
    wire MemWrite_id_ex_o;
    wire [2:0]RW_type_id_ex_o;
    wire lui_id_ex_o;
    wire U_type_id_ex_o;
    wire MemtoReg_id_ex_o;
    wire RegWrite_id_ex_o;

    // ex
    wire [31:0]ALU_result_ex_o;
    wire [31:0]pc_jump_o;
    //wire [31:0]Rd_data2_ex_o;
    wire [31:0]imme_ex_o;
    wire [31:0]pc_order_ex_o;
    
    // ex - mem
    wire [31:0]ALU_result_ex_mem_o;
    wire [31:0]pc_jump_ex_mem_o;
    wire [31:0]Rd_data2_ex_mem_o;
    wire [31:0]imme_ex_mem_o;
    wire [31:0]pc_order_ex_mem_o;
    wire [4:0]Rd_ex_mem_o;
    
    wire  jal_ex_mem_o;
    wire  jalr_ex_mem_o;
//    wire  MemRead_ex_mem_o;    // input
//    wire  MemWrite_ex_mem_o;
//    wire [2:0] RW_type_ex_mem_o;
    wire  lui_ex_mem_o;
    wire  U_type_ex_mem_o;
    wire  MemtoReg_ex_mem_o;
    wire  RegWrite_ex_mem_o;
    
    // mem_wb
    wire [31:0]ALU_result_mem_wb_o;
    wire [31:0]pc_jump_mem_wb_o;
    wire [31:0]loaddata_mem_wb_o;
    wire [31:0]imme_mem_wb_o;
    wire [31:0]pc_order_mem_wb_o;
    wire [31:0]Wr_reg_data_wb_o;
    wire [4:0]Rd_mem_wb_o;
    
    wire  jal_mem_wb_o;
    wire  jalr_mem_wb_o;
    wire  lui_mem_wb_o;
    wire  U_type_mem_wb_o;
    wire  MemtoReg_mem_wb_o;
    wire  RegWrite_mem_wb_o;
              
    wire [31:0]pc_order_if_o;
        
    if_stage if_stage_inst (
        .clk(clk), 
        .rst_n(rst_n), 
        .pc_if_i(pc_if_i), 
        .pc_if_o(pc_if_o), 
        .rom_addr(rom_addr),
        
        .pc_ex_i(pc_id_ex_o),
        .pc_order(pc_order_if_o)
        );
    
    if_id_reg  if_id_reg_inst(
        .clk(clk), 
        .rst_n(rst_n), 
        .pc_if_id_i(pc_if_o), 
        .inst_if_id_i(inst), 
        .pc_if_id_o(pc_if_id_o), 
        .inst_if_id_o(inst_if_id_o)
        );
    
    id_stage id_stage_inst (
        .clk(clk), 
        .rst_n(rst_n), 
        .RegWrite_id_i(RegWrite_mem_wb_o), 
        .Wr_reg_data_id_i(Wr_reg_data_wb_o), 
        .inst_id_i(inst_if_id_o), 
        .Rd_id_i(Rd_mem_wb_o),
        .opcode_id_o(opcode), 
        .func3_id_o(func3), 
        .func7_id_o(func7), 
        .imme_id_o(imme_id_o), 
        .Rd_data1_id_o(Rd_data1_id_o), 
        .Rd_data2_id_o(Rd_data2_id_o),
        .Rd_id_o(Rd_id_o)
        );
    
    id_ex_reg id_ex_reg_inst (
        .clk(clk), 
        .rst_n(rst_n), 
        .pc_id_ex_i(pc_if_id_o), 
        .imme_id_ex_i(imme_id_o), 
        .Rd_data1_id_ex_i(Rd_data1_id_o), 
        .Rd_data2_id_ex_i(Rd_data2_id_o), 
        .Rd_id_ex_i(Rd_id_o),
        .pc_id_ex_o(pc_id_ex_o), 
        .imme_id_ex_o(imme_id_ex_o), 
        .Rd_data1_id_ex_o(Rd_data1_id_ex_o), 
        .Rd_data2_id_ex_o(Rd_data2_id_ex_o),
        .Rd_id_ex_o(Rd_id_ex_o),
        
        .ALUSrc_id_ex_i(ALUSrc), 
        .ALUctl_id_ex_i(ALUctl), 
        .beq_id_ex_i(beq), 
        .bne_id_ex_i(bne), 
        .blt_id_ex_i(blt), 
        .bge_id_ex_i(bge), 
        .bltu_id_ex_i(bltu), 
        .bgeu_id_ex_i(bgeu), 
        .jal_id_ex_i(jal), 
        .jalr_id_ex_i(jalr), 
        .MemRead_id_ex_i(MemRead), 
        .MemWrite_id_ex_i(MemWrite), 
        .RW_type_id_ex_i(RW_type), 
        .lui_id_ex_i(lui), 
        .U_type_id_ex_i(U_type), 
        .MemtoReg_id_ex_i(MemtoReg), 
        .RegWrite_id_ex_i(RegWrite), 
        .ALUSrc_id_ex_o(ALUSrc_id_ex_o), 
        .ALUctl_id_ex_o(ALUctl_id_ex_o), 
        .beq_id_ex_o(beq_id_ex_o), 
        .bne_id_ex_o(bne_id_ex_o), 
        .blt_id_ex_o(blt_id_ex_o), 
        .bge_id_ex_o(bge_id_ex_o), 
        .bltu_id_ex_o(bltu_id_ex_o), 
        .bgeu_id_ex_o(bgeu_id_ex_o), 
        .jal_id_ex_o(jal_id_ex_o), 
        .jalr_id_ex_o(jalr_id_ex_o), 
        .MemRead_id_ex_o(MemRead_id_ex_o), 
        .MemWrite_id_ex_o(MemWrite_id_ex_o), 
        .RW_type_id_ex_o(RW_type_id_ex_o), 
        .lui_id_ex_o(lui_id_ex_o), 
        .U_type_id_ex_o(U_type_id_ex_o), 
        .MemtoReg_id_ex_o(MemtoReg_id_ex_o), 
        .RegWrite_id_ex_o(RegWrite_id_ex_o)
        );
    
    ex_stage ex_stage_inst (
        .ALUctl_ex_i(ALUctl_id_ex_o), 
        .beq_ex_i(beq_id_ex_o), 
        .bne_ex_i(bne_id_ex_o), 
        .blt_ex_i(blt_id_ex_o), 
        .bge_ex_i(bge_id_ex_o), 
        .bltu_ex_i(bltu_id_ex_o), 
        .bgeu_ex_i(bgeu_id_ex_o), 
        .jal_ex_i(jal_id_ex_o), 
        .jalr_ex_i(jalr_id_ex_o), 
        .ALUSrc_ex_i(ALUSrc_id_ex_o), 
        .pc_ex_i(pc_id_ex_o), 
        .imme_ex_i(imme_id_ex_o), 
        .Rd_data1_ex_i(Rd_data1_id_ex_o), 
        .Rd_data2_ex_i(Rd_data2_id_ex_o), 
        .ALU_result_ex_o(ALU_result_ex_o), 
        .pc_new_ex_o(pc_if_i), 
        .pc_jump_o(pc_jump_o), 
        //.Rd_data2_ex_o(Rd_data2_ex_o), 
        .imme_ex_o(imme_ex_o), 
        .pc_order_ex_o(pc_order_ex_o),
        
        .pc_order_ex_i(pc_order_if_o)
        );
        
    ex_mem_reg ex_mem_reg_inst (
        .clk(clk), 
        .rst_n(rst_n), 
        .ALU_result_ex_mem_i(ALU_result_ex_o), 
        .pc_jump_ex_mem_i(pc_jump_o), 
        .Rd_data2_ex_mem_i(Rd_data2_id_ex_o), 
        .imme_ex_mem_i(imme_ex_o), 
        .pc_order_ex_mem_i(pc_order_ex_o), 
        .Rd_ex_mem_i(Rd_id_ex_o),
        .ALU_result_ex_mem_o(ALU_result_ex_mem_o), 
        .pc_jump_ex_mem_o(pc_jump_ex_mem_o), 
        .Rd_data2_ex_mem_o(Wr_mem_data), 
        .imme_ex_mem_o(imme_ex_mem_o), 
        .pc_order_ex_mem_o(pc_order_ex_mem_o),
        .Rd_ex_mem_o(Rd_ex_mem_o),
        
        .jal_ex_mem_i(jal_id_ex_o), 
        .jalr_ex_mem_i(jalr_id_ex_o), 
        .MemRead_ex_mem_i(MemRead_id_ex_o), 
        .MemWrite_ex_mem_i(MemWrite_id_ex_o), 
        .RW_type_ex_mem_i(RW_type_id_ex_o), 
        .lui_ex_mem_i(lui_id_ex_o), 
        .U_type_ex_mem_i(U_type_id_ex_o), 
        .MemtoReg_ex_mem_i(MemtoReg_id_ex_o), 
        .RegWrite_ex_mem_i(RegWrite_id_ex_o), 
        .jal_ex_mem_o(jal_ex_mem_o), 
        .jalr_ex_mem_o(jalr_ex_mem_o), 
        .MemRead_ex_mem_o(MemRead_ex_mem_o), //output control
        .MemWrite_ex_mem_o(MemWrite_ex_mem_o), //output control
        .RW_type_ex_mem_o(RW_type_ex_mem_o), ///output control
        .lui_ex_mem_o(lui_ex_mem_o), 
        .U_type_ex_mem_o(U_type_ex_mem_o), 
        .MemtoReg_ex_mem_o(MemtoReg_ex_mem_o), 
        .RegWrite_ex_mem_o(RegWrite_ex_mem_o)
        );
    
    mem_wb_reg mem_wb_reg_inst (
    	.clk(clk),
        .rst_n(rst_n),
        .ALU_result_mem_wb_i(ALU_result_ex_mem_o), 
        .pc_jump_mem_wb_i(pc_jump_ex_mem_o), 
        .loaddata_mem_wb_i(Rd_mem_data), 
        .imme_mem_wb_i(imme_ex_mem_o), 
        .Rd_mem_wb_i(Rd_ex_mem_o),
        .pc_order_mem_wb_i(pc_order_ex_mem_o), 
        .ALU_result_mem_wb_o(ALU_result_mem_wb_o), 
        .pc_jump_mem_wb_o(pc_jump_mem_wb_o), 
        .loaddata_mem_wb_o(loaddata_mem_wb_o), 
        .imme_mem_wb_o(imme_mem_wb_o), 
        .pc_order_mem_wb_o(pc_order_mem_wb_o),
        .Rd_mem_wb_o(Rd_mem_wb_o),
        
        .jal_mem_wb_i(jal_ex_mem_o), 
        .jalr_mem_wb_i(jalr_ex_mem_o), 
        .lui_mem_wb_i(lui_ex_mem_o), 
        .U_type_mem_wb_i(U_type_ex_mem_o), 
        .MemtoReg_mem_wb_i(MemtoReg_ex_mem_o), 
        .RegWrite_mem_wb_i(RegWrite_ex_mem_o), 
        .jal_mem_wb_o(jal_mem_wb_o), 
        .jalr_mem_wb_o(jalr_mem_wb_o), 
        .lui_mem_wb_o(lui_mem_wb_o), 
        .U_type_mem_wb_o(U_type_mem_wb_o), 
        .MemtoReg_mem_wb_o(MemtoReg_mem_wb_o), 
        .RegWrite_mem_wb_o(RegWrite_mem_wb_o)
        );
        
    wb_stage wb_stage_inst (
        .MemtoReg(MemtoReg_mem_wb_o), 
        .jal(jal_mem_wb_o), 
        .jalr(jalr_mem_wb_o), 
        .lui(lui_mem_wb_o), 
        .U_type(U_type_mem_wb_o), 
        .ALU_result_wb_i(ALU_result_mem_wb_o), 
        .pc_jump_wb_i(pc_jump_mem_wb_o), 
        .loaddata_wb_i(loaddata_mem_wb_o), 
        .imme_wb_i(imme_mem_wb_o), 
        .pc_order_wb_i(pc_order_mem_wb_o), 
        .Wr_reg_data_wb_o(Wr_reg_data_wb_o)
        );
        
    assign ALU_result = ALU_result_ex_mem_o;
    
endmodule
