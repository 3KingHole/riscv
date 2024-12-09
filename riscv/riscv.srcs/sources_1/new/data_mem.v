`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/22 15:00:54
// Design Name: 
// Module Name: data_mem
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
`define ram_depth 256
`include "define.vh"
module data_mem(
    input clk,
    input rst_n,
    
    input w_en,
    input r_en,
    input [2:0] width,
    input [31:0] addr,
    input [31:0] din,
    output [31:0] dout
    );
    
    reg [31:0] mem_ram [`ram_depth - 1:0];
    integer i;
    
    initial begin
        for (i = 0; i < `ram_depth; i = i + 1) begin
            mem_ram[i] = 32'b0;
        end
    end
    

    
//    assign dout = r_en ? mem_ram[addr[9:2]] : 32'b0;

	wire [31:0]Rd_data, Rd_data_nxt;
	
//
	
	
	reg [31:0]Wr_data_B;//字节拼接
	wire [31:0]Wr_data_H;//半字拼接
	
	wire [31:0]Wr_data;
	
	
	assign Rd_data = mem_ram[addr[9:2]];
	assign Rd_data_nxt = mem_ram[addr[9:2] + 1];
//	always @(posedge clk or negedge rst_n) begin
//        if (~rst_n) begin
//           Rd_data <= 32'b0; 
//        end
//        else if(r_en) begin
//            Rd_data = mem_ram[addr[9:2]];
//        end
//    end

    always@(*) begin
        case(addr[1:0])
            2'b00:Wr_data_B = {Rd_data[31:8],din[7:0]};
            2'b01:Wr_data_B = {Rd_data[31:16],din[7:0],Rd_data[7:0]};
            2'b10:Wr_data_B = {Rd_data[31:24],din[7:0],Rd_data[15:0]};
            2'b11:Wr_data_B = {din[7:0],Rd_data[23:0]};
        endcase
    end

    assign Wr_data_H = (addr[1]) ? {din[15:0],Rd_data[15:0]} : {Rd_data[31:16],din[15:0]} ;
	
///根据写类型，选择写入的数捿

    assign Wr_data = (width[1:0]==2'b00) ? Wr_data_B :( (width[1:0]==2'b01) ? Wr_data_H : din   );

///上升沿写入数捿

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < `ram_depth; i = i + 1) begin
                mem_ram[i] <= 32'b0;
            end 
            //dout <= 32'b0;
        end
        else if(w_en) begin
            mem_ram[addr[9:2]] <= Wr_data;
        end
    end

 
//读部刿


    reg [7:0]Rd_data_B;
    reg [15:0]Rd_data_H;
    
    wire [31:0] Rd_data_B_ext;
    wire [31:0] Rd_data_H_ext;

    always@(*) begin
        case(addr[1:0])
            2'b00:Rd_data_B = Rd_data[7:0];
            2'b01:Rd_data_B = Rd_data[15:8];
            2'b10:Rd_data_B = Rd_data[23:16];
            2'b11:Rd_data_B = Rd_data[31:24];
        endcase
    end
		
    // assign Rd_data_H=(addr[1])? Rd_data[31:16]:Rd_data[15:0];
    always@(*) begin
        case(addr[1:0])
            2'b00:Rd_data_H = Rd_data[15:0];
            2'b01:Rd_data_H = Rd_data[23:8];
            2'b10:Rd_data_H = Rd_data[31:16];
            2'b11:Rd_data_H = {{Rd_data_nxt[7:0]},Rd_data[31:24]};
        endcase
    end
    
    ///扩展32使
    assign Rd_data_B_ext = (width[2]) ? {24'd0,Rd_data_B} : {{24{Rd_data_B[7]}},Rd_data_B};
    
    assign Rd_data_H_ext = (width[2]) ? {16'd0,Rd_data_H} : {{16{Rd_data_H[15]}},Rd_data_H};
    
    
    assign dout = (width[1:0]==2'b00) ? Rd_data_B_ext : ((width[1:0]==2'b01) ? Rd_data_H_ext : Rd_data );

       
 
endmodule
