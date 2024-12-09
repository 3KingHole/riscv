`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 15:41:01
// Design Name: 
// Module Name: mux
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


module mux(
    input [31:0] data1,   // ����������1
    input [31:0] data2,   // ����������2
    input sel,            // ѡ���źţ���������ĸ������������ 
    output reg [31:0] dout// ��������� 
);

always @(*) begin
   case(sel)
      1'b1: dout = data1; // �� sel Ϊ��ʱ����� data1 
      1'b0: dout = data2; // �� sel Ϊ��ʱ����� data2 
      default: dout = 32'b0; // Ĭ�����Ҳ��������Ϊ���data1�������߼�����
   endcase  
end

endmodule

