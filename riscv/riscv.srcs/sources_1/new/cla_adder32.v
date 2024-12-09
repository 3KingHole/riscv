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
    input [31:0] A,          // ��һ������
    input [31:0] B,          // �ڶ�������
    input cin,               // �����λ
    output [31:0] result,    // �ӷ����
    output cout              // �����λ
);

    wire [31:0] P;           // �����ź� (Propagate)
    wire [31:0] G;           // �����ź� (Generate)
    wire [32:0] C;           // ������λ�ź�

    // ����ÿһλ�Ĵ����������ź�
    assign P = A ^ B;        // Propagate signal = A XOR B
    assign G = A & B;        // Generate signal = A AND B

    // ��һ����λ�źţ�C[0] �������λ
    assign C[0] = cin;

    // ʹ�����ɺʹ����߼������������Ľ�λ�ź�
    genvar i;
    
    generate 
        for (i = 0; i < 32; i = i + 1) begin : carry_generation
            //assign C[i] = G[i-1] | (P[i-1] & C[i-1]);
            assign C[i+1] = (A[i] & C[i]) | (B[i] & C[i]) | (A[i] & B[i]);
        end 
    endgenerate

  	// ������������ÿһλ�ĺͣ����϶�Ӧ�Ľ�λ�ź�
  	assign result = P ^ {C[31:1], cin}; 

  	// ������һλ�Ľ�λ�ź�Ϊ cout
  	//assign cout = G[31] | (P[31] & C[31]);
  	assign cout = C[32];

endmodule

