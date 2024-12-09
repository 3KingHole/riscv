`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/04 16:34:03
// Design Name: 
// Module Name: if_id_reg
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

module if_id_reg(
	input clk,
	input rst_n,
	input [31:0]pc_if_id_i,
	input [31:0]inst_if_id_i,
	output reg [31:0]pc_if_id_o,
	output reg [31:0]inst_if_id_o
    );

	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			pc_if_id_o <= `zero_word;
		else
			pc_if_id_o <= pc_if_id_i;
	end
	
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			inst_if_id_o <= `zero_word;
		else
			inst_if_id_o <= inst_if_id_i;
	end

endmodule


