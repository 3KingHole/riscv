`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/04 16:35:04
// Design Name: 
// Module Name: ex_mem_reg
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
module ex_mem_reg(
	input clk,
	input rst_n,
	input [31:0]ALU_result_ex_mem_i,
	input [31:0]pc_jump_ex_mem_i,
	input [31:0]Rd_data2_ex_mem_i,
	input [31:0]imme_ex_mem_i,
	input [31:0]pc_order_ex_mem_i,
	input [4:0]Rd_ex_mem_i,
	output reg[31:0]ALU_result_ex_mem_o,   
	output reg[31:0]pc_jump_ex_mem_o,
	output reg[31:0]Rd_data2_ex_mem_o,     //DM
	output reg[31:0]imme_ex_mem_o,
	output reg[31:0]pc_order_ex_mem_o,
	output reg[4:0]Rd_ex_mem_o,
	
	// control signals
    input jal_ex_mem_i,
    input jalr_ex_mem_i,
    input MemRead_ex_mem_i,
    input MemWrite_ex_mem_i,
    input [2:0]RW_type_ex_mem_i,
    input lui_ex_mem_i,
    input U_type_ex_mem_i,
    input MemtoReg_ex_mem_i,
    input RegWrite_ex_mem_i,
    
    output reg  jal_ex_mem_o,
    output reg  jalr_ex_mem_o,
    output reg  MemRead_ex_mem_o,
    output reg  MemWrite_ex_mem_o,
    output reg [2:0] RW_type_ex_mem_o,
    output reg  lui_ex_mem_o,
    output reg  U_type_ex_mem_o,
    output reg  MemtoReg_ex_mem_o,
    output reg  RegWrite_ex_mem_o

    );

	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			ALU_result_ex_mem_o <= `zero_word;
		else
			ALU_result_ex_mem_o <= ALU_result_ex_mem_i;
	end
	
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			pc_jump_ex_mem_o <= `zero_word;
		else
			pc_jump_ex_mem_o <= pc_jump_ex_mem_i;
	end
	
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			Rd_data2_ex_mem_o <= `zero_word;
		else
			Rd_data2_ex_mem_o <= Rd_data2_ex_mem_i;
	end
	
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			imme_ex_mem_o <= `zero_word;
		else
			imme_ex_mem_o <= imme_ex_mem_i;
	end
	
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			pc_order_ex_mem_o <= `zero_word;
		else
			pc_order_ex_mem_o <= pc_order_ex_mem_i;
	end
	
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
            Rd_ex_mem_o <= 5'd0;
        else
            Rd_ex_mem_o <= Rd_ex_mem_i;
    end
    
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
            jal_ex_mem_o <= `zero_word;
        else
            jal_ex_mem_o <= jal_ex_mem_i;
    end
        
        
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
            jalr_ex_mem_o <= `zero_word;
        else
            jalr_ex_mem_o <= jalr_ex_mem_i;
    end
    
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
            MemRead_ex_mem_o <= `zero_word;
        else
            MemRead_ex_mem_o <= MemRead_ex_mem_i;
    end
    
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
            MemWrite_ex_mem_o <= `zero_word;
        else
            MemWrite_ex_mem_o <= MemWrite_ex_mem_i;
    end
    
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
            RW_type_ex_mem_o <= 3'b000;
        else
            RW_type_ex_mem_o <= RW_type_ex_mem_i;
    end
    
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
            lui_ex_mem_o <= `zero_word;
        else
            lui_ex_mem_o <= lui_ex_mem_i;
    end
    
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
            U_type_ex_mem_o <= `zero_word;
        else
            U_type_ex_mem_o <= U_type_ex_mem_i;
    end
    
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
            MemtoReg_ex_mem_o <= `zero_word;
        else
            MemtoReg_ex_mem_o <= MemtoReg_ex_mem_i;
    end
    
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n)
            RegWrite_ex_mem_o <= `zero_word;
        else
            RegWrite_ex_mem_o <= RegWrite_ex_mem_i;
    end
	
	

endmodule



