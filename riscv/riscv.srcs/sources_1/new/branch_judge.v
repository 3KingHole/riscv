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
    input zero,        // ALU ���Ϊ��ı�־
    input [31:0] ALU_result, // ALU ��������ڱȽ�
    output reg jump_flag // ��ת��־
);

always @(*) begin
    jump_flag = 0; // Ĭ�ϲ���ת
    
    if (beq && zero) begin
        jump_flag = 1; // ��� beq Ϊ�������־Ϊ�棬����ת
    end else if (bne && !zero) begin
        jump_flag = 1; // ��� bne Ϊ�������־Ϊ�٣�����ת
    //end else if (blt && ALU_result[31]) begin
    end else if (blt && ALU_result) begin
        jump_flag = 1; // ��� blt Ϊ���� ALU_result �Ǹ���������ת��ֻ�������з��ţ�
    //end else if (bge && !ALU_result[31]) begin
    end else if (bge && !ALU_result) begin
        jump_flag = 1; // ��� bge Ϊ���� ALU_result �ǷǸ���������ת��ֻ�������з��ţ�
    //end else if (bltu && (ALU_result < 32'b0)) begin
    end else if (bltu && ALU_result) begin
        jump_flag = 1; // �޷���С�ڱȽϣ������������������ʵ���޷��űȽ�
    //end else if (bgeu && (ALU_result >= 32'b0)) begin
    end else if (bgeu && !ALU_result) begin
        jump_flag = 1; // �޷��Ŵ��ڵ��ڱȽϣ������������������ʵ���޷��űȽ�
    end else if (jal || jalr) begin 
        jump_flag = 1; // JAL �� JALR ָ��������ת 
    end 
end

endmodule

