`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/25 16:07:49
// Design Name: 
// Module Name: registers
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
module registers(
    input clk,
    input rst_n,
    
    input w_en,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] reg_addr,
    input [31:0] wr_data,
    
    output [31:0] rd_data1,
    output [31:0] rd_data2
    );
    
    reg [31:0] regs [31:0];
    integer i;
    
    initial begin  
        for (i = 0; i < 32; i = i + 1) begin
            regs[i] = 32'b0;   
        end
    end
    
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i <32; i = i + 1) begin
                regs[i] <= 32'b0;
            end 
        end
        else if(w_en && reg_addr != 5'b0) begin
            regs[reg_addr] <= wr_data;
        end
    end
    
	assign rd_data1 = (rs1==5'd0) ? `zero_word: regs[rs1];
    assign rd_data2 = (rs2==5'd0) ? `zero_word: regs[rs2];
    
endmodule
