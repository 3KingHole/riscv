`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 15:56:31
// Design Name: 
// Module Name: alu_control
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
module alu_control(
	input [1:0]ALUop,
    input [2:0]func3,
    input func7,
    output [3:0]ALUctl
    );

	
	wire [3:0]branchop;
	reg  [3:0]RIop;
	
	assign branchop = (func3[2] & func3[1])? `SLTU : (func3[2] ^ func3[1])? `SLT : `SUB;
	
	always@(*)begin
		case(func3)
			3'b000: if(ALUop[1] & func7) //R
					RIop = `SUB;
					else                 //I
					RIop = `ADD;
			3'b001: RIop = `SLL;
			3'b010: RIop = `SLT;
			3'b011: RIop = `SLTU;
			3'b100: RIop = `XOR;
			3'b101: if(func7)
					RIop = `SRA;
					else
					RIop = `SRL;
			3'b110: RIop = `OR;
			3'b111: RIop = `AND;
			default:RIop = `ADD;
		endcase
	end
	
	assign ALUctl = (ALUop[1]^ALUop[0]) ? RIop : (ALUop[1]&ALUop[0]) ? branchop : `ADD;

endmodule

