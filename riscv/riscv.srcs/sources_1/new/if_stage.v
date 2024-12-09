`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/04 16:33:30
// Design Name: 
// Module Name: if_stage
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


module if_stage(
	input clk,
    input rst_n,
    input [31:0]pc_if_i,
    
    input [31:0]pc_ex_i,
    output [31:0]pc_order,
    
    output [31:0]pc_if_o,
    output [7:0]rom_addr

);

    pc pc_inst (
        .clk(clk), 
        .rst_n(rst_n), 
        .pc_new(pc_if_i), 
        .pc_out(pc_if_o)
    );
    
    
    cla_adder32 pc_adder_4 (
        .A(pc_if_o), 
        .B(32'd4), 
        .cin(1'd0), 
        .result(pc_order), 
        .cout()
    );

assign rom_addr = pc_if_o[9:2];

endmodule
