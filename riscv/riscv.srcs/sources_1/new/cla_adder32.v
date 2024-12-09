`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 15:43:28
// Design Name: 
// Module Name: cla_adder32
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


module cla_adder32 (
    input [31:0] A,          // 第一个加数
    input [31:0] B,          // 第二个加数
    input cin,               // 输入进位
    output [31:0] result,    // 加法结果
    output cout              // 输出进位
);

    wire [31:0] P;           // 传播信号 (Propagate)
    wire [31:0] G;           // 生成信号 (Generate)
    wire [32:0] C;           // 各级进位信号

    // 计算每一位的传播和生成信号
    assign P = A ^ B;        // Propagate signal = A XOR B
    assign G = A & B;        // Generate signal = A AND B

    // 第一级进位信号，C[0] 是输入进位
    assign C[0] = cin;

    // 使用生成和传播逻辑计算后续级别的进位信号
    genvar i;
    
    generate 
        for (i = 0; i < 32; i = i + 1) begin : carry_generation
            //assign C[i] = G[i-1] | (P[i-1] & C[i-1]);
            assign C[i+1] = (A[i] & C[i]) | (B[i] & C[i]) | (A[i] & B[i]);
        end 
    endgenerate

  	// 最终输出结果是每一位的和，加上对应的进位信号
  	assign result = P ^ {C[31:1], cin}; 

  	// 输出最后一位的进位信号为 cout
  	//assign cout = G[31] | (P[31] & C[31]);
  	assign cout = C[32];

endmodule

