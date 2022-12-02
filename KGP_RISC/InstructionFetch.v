`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:21:47 11/05/2022 
// Design Name: 
// Module Name:    InstructionFetch 
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
module InstructionFetch(
input clk,
input rst,
input [31:0] PC,
output [31:0] instruction
    );

wire [9:0] address;

assign address = PC[9:0];

InstructionMemory IM (
  .clka(clk), // input clka
  .rsta(rst), // input rsta
  .ena(1), // input ena
  .wea(0), // input [0 : 0] wea
  .addra(address), // input [9 : 0] addra
  .dina(), // input [31 : 0] dina
  .douta(instruction) // output [31 : 0] douta
);

endmodule
