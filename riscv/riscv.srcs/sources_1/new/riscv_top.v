`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/22 15:07:01
// Design Name: 
// Module Name: riscv_top
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


module riscv_top(
	input clk,
	input rst_n,
	output [7:0]rom_addr
    );

//	wire [7:0]rom_addr;
	wire [31:0]ram_addr;
	wire [31:0]inst;
	wire [31:0]Rd_mem_data;
	wire [31:0]Wr_mem_data;
	wire W_en;
	wire R_en;
	wire [2:0]RW_type;
	
	inst_mem inst_mem_inst (
	.r_en(1'b1),
    .addr(rom_addr), 
    .dout(inst)
    );

	riscv riscv_inst (
    .clk(clk), 
    .rst_n(rst_n), 
    .inst(inst), 
    .Rd_mem_data(Rd_mem_data), 
    .rom_addr(rom_addr), 
    .Wr_mem_data(Wr_mem_data), 
    .W_en(W_en), 
    .R_en(R_en), 
    .ram_addr(ram_addr), 
    .RW_type(RW_type)
    );	
	
	data_mem data_mem_inst (
    .clk(clk), 
    .rst_n(rst_n), 
    .w_en(W_en), 
    .r_en(R_en), 
    .addr(ram_addr), 
    .width(RW_type), 
    .din(Wr_mem_data), 
    .dout(Rd_mem_data)
    );	

endmodule


