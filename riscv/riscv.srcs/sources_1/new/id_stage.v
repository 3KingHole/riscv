`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/04 16:34:14
// Design Name: 
// Module Name: id_stage
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


module id_stage(
	input clk,
	input rst_n,
	input RegWrite_id_i,
	input [31:0]Wr_reg_data_id_i,
	input [31:0] inst_id_i,
	input [4:0]Rd_id_i,
	output [6:0] opcode_id_o,
	output [2:0] func3_id_o,
	output func7_id_o,
	output [31:0] imme_id_o,
	output [31:0] Rd_data1_id_o,
	output [31:0] Rd_data2_id_o,
	output [4:0] Rd_id_o

    );

	wire [4:0]Rs1;
	wire [4:0]Rs2;
	wire [4:0]Rd;
	
	assign Rd_id_o = Rd;
	
	
	decode decode_inst (
    .inst(inst_id_i), 
    .opcode(opcode_id_o), 
    .func3(func3_id_o), 
    .func7(func7_id_o), 
    .Rs1(Rs1), 
    .Rs2(Rs2), 
    .Rd(Rd), 
    .imme(imme_id_o)
    );
	
    registers registers_inst (
    .clk(clk), 
	.rst_n(rst_n), 
    .w_en(RegWrite_id_i), 
    .rs1(Rs1), 
    .rs2(Rs2), 
    .reg_addr(Rd_id_i), 
    .wr_data(Wr_reg_data_id_i), 
    .rd_data1(Rd_data1_id_o), 
    .rd_data2(Rd_data2_id_o)
    );
endmodule



