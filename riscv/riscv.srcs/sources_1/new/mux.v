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
    input [31:0] data1,   // 输入数据线1
    input [31:0] data2,   // 输入数据线2
    input sel,            // 选择信号，决定输出哪个输入的数据线 
    output reg [31:0] dout// 输出数据线 
);

always @(*) begin
   case(sel)
      1'b1: dout = data1; // 当 sel 为低时，输出 data1 
      1'b0: dout = data2; // 当 sel 为高时，输出 data2 
      default: dout = 32'b0; // 默认情况也可以设置为输出data1或其他逻辑处理。
   endcase  
end

endmodule

