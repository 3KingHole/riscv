`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/22 15:07:17
// Design Name: 
// Module Name: inst_mem
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

`define rom_depth 255
module inst_mem(    
    input r_en,
    input [7:0] addr,
    output reg [31:0] dout
    );
    
    reg [31:0] mem_rom [`rom_depth:0];
    
    initial begin
        $readmemb("instrument_binary.txt", mem_rom);
        dout = 32'b0;
    end
    
    always @(*) begin
            dout = r_en ? mem_rom[addr] : 32'b0;
    end
    
endmodule
