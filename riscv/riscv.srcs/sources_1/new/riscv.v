`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 15:59:57
// Design Name: 
// Module Name: riscv
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


module riscv(
	input clk,
	input rst_n,
	input [31:0]inst,
	input [31:0]Rd_mem_data,
	
	output [7:0]rom_addr,
	
	output [31:0]Wr_mem_data,
	output W_en,
	output R_en,
	output [31:0]ram_addr,
	output [2:0]RW_type
    );
	
	wire [6:0]opcode;
	wire [2:0]func3;
	wire func7;
	wire MemtoReg;
	wire ALUSrc;
	wire RegWrite;
	wire lui;
	wire U_type;
	wire jal;
	wire jalr;
	wire beq;
	wire bne;
	wire blt;
	wire bge;
	wire bltu;
	wire bgeu;
	wire [3:0]ALUctl;
	// control signals
    wire MemWrite;
    wire MemRead;
    wire [2:0]RW_type_id;
	
	
	
	control control_inst (
        .opcode(opcode), 
        .func3(func3), 
        .func7(func7), 
        .MemRead(MemRead), 
        .MemtoReg(MemtoReg), 
        .MemWrite(MemWrite), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite), 
        .lui(lui),
        .U_type(U_type),
        .jal(jal), 
        .jalr(jalr), 
        .beq(beq), 
        .bne(bne), 
        .blt(blt), 
        .bge(bge), 
        .bltu(bltu), 
        .bgeu(bgeu), 
        .RW_type(RW_type_id), 
        .ALUctl(ALUctl)
    );
	
	datapath datapath_inst (
        .clk(clk), 
        .rst_n(rst_n), 
        .inst(inst), 
        .MemtoReg(MemtoReg), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite), 
        .lui(lui),
        .U_type(U_type),
        .jal(jal), 
        .jalr(jalr), 
        .beq(beq), 
        .bne(bne), 
        .blt(blt), 
        .bge(bge), 
        .bltu(bltu), 
        .bgeu(bgeu), 
        .ALUctl(ALUctl), 
        
        .MemRead(MemRead), 
        .MemWrite(MemWrite), 
        .RW_type(RW_type_id), 
        .MemRead_ex_mem_o(R_en), //output control
        .MemWrite_ex_mem_o(W_en), //output control
        .RW_type_ex_mem_o(RW_type), //output control
                     
        .Rd_mem_data(Rd_mem_data), 
        .rom_addr(rom_addr), 
        .Wr_mem_data(Wr_mem_data),
        .ALU_result(ram_addr),
        .opcode(opcode),
        .func3(func3),
        .func7(func7)
    );

endmodule


