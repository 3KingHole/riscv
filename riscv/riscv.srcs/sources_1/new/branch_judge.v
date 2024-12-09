`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 15:39:53
// Design Name: 
// Module Name: branch_judge
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


module branch_judge(
    input beq,
    input bne,
    input blt,
    input bge,
    input bltu,
    input bgeu,
    input jal,
    input jalr,
    input zero,        // ALU 输出为零的标志
    input [31:0] ALU_result, // ALU 结果，用于比较
    output reg jump_flag // 跳转标志
);

always @(*) begin
    jump_flag = 0; // 默认不跳转
    
    if (beq && zero) begin
        jump_flag = 1; // 如果 beq 为真且零标志为真，则跳转
    end else if (bne && !zero) begin
        jump_flag = 1; // 如果 bne 为真且零标志为假，则跳转
    //end else if (blt && ALU_result[31]) begin
    end else if (blt && ALU_result) begin
        jump_flag = 1; // 如果 blt 为真且 ALU_result 是负数，则跳转（只适用于有符号）
    //end else if (bge && !ALU_result[31]) begin
    end else if (bge && !ALU_result) begin
        jump_flag = 1; // 如果 bge 为真且 ALU_result 是非负数，则跳转（只适用于有符号）
    //end else if (bltu && (ALU_result < 32'b0)) begin
    end else if (bltu && ALU_result) begin
        jump_flag = 1; // 无符号小于比较，这里可以用其他方法实现无符号比较
    //end else if (bgeu && (ALU_result >= 32'b0)) begin
    end else if (bgeu && !ALU_result) begin
        jump_flag = 1; // 无符号大于等于比较，这里可以用其他方法实现无符号比较
    end else if (jal || jalr) begin 
        jump_flag = 1; // JAL 或 JALR 指令总是跳转 
    end 
end

endmodule

