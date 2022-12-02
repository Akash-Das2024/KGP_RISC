`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:11 11/08/2022 
// Design Name: 
// Module Name:    MemoryFetch 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MemoryFetch(
input clk, rst,
input mem_read,
input mem_write,
input [31:0] address,
input [31:0] input_data,
output [31:0] output_data
	);
wire [9:0] addr;
assign addr = address[9:0];
Memory Mem(
  .clka(clk), // input clka
  .rsta(rst), // input rsta
  .ena(1), // input ena
  .wea(mem_write), // input [0 : 0] wea
  .addra(addr), // input [9 : 0] addra
  .dina(input_data), // input [31 : 0] dina
  .douta(output_data) // output [31 : 0] douta
);


endmodule
