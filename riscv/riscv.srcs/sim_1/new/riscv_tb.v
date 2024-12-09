`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/27 15:00:04
// Design Name: 
// Module Name: riscv_tb
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


module riscv_tb();
    reg clk;
    reg rst_n;
    wire [7:0]rom_addr;
    
    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        #100
        rst_n = 1'b1;
    end
    
    always #5 clk <= ~clk;
    
    riscv_top riscv_top(
    .clk(clk),
    .rst_n(rst_n),
    .rom_addr(rom_addr)
    );
    

endmodule
